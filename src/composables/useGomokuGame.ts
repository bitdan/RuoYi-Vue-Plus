import {onUnmounted, ref} from 'vue'
import {useUserStore} from '@/store/user'
import {useMessage} from './useMessage'

interface GameState {
  board: number[][]
  currentPlayer: 'black' | 'white'
  winner: 'black' | 'white' | null
  lastMove: { x: number; y: number } | null
}

export function useGomokuGame(roomId: string) {
  const { showError } = useMessage()
  const wsUrl = `${import.meta.env.VITE_WS_URL}/ws/gomoku/${roomId}`
  console.log('尝试连接WebSocket:', wsUrl)

  let ws: WebSocket
  try {
    ws = new WebSocket(wsUrl)
  } catch (error) {
    console.error('WebSocket连接创建失败:', error)
    showError('连接游戏服务器失败')
    throw error
  }

  const userStore = useUserStore()

  const gameState = ref<GameState>({
    board: Array(15).fill(0).map(() => Array(15).fill(0)),
    currentPlayer: 'black',
    winner: null,
    lastMove: null
  })

  const playerColor = ref<'black' | 'white' | null>(null)
  const opponentName = ref<string | null>(null)
  const isReady = ref(false)

  ws.onopen = () => {
    console.log('WebSocket连接已建立，发送加入消息')
    try {
      const joinMessage = {
        type: 'JOIN',
        userId: userStore.userId,
        username: userStore.username
      }
      console.log('发送加入消息:', joinMessage)
      ws.send(JSON.stringify(joinMessage))
    } catch (error) {
      console.error('发送加入消息失败:', error)
      showError('加入游戏失败')
    }
  }

  ws.onmessage = (event) => {
    try {
      const data = JSON.parse(event.data)
      console.log('收到WebSocket消息:', data)

      switch (data.type) {
        case 'GAME_STATE':
          gameState.value = data.state
          break
        case 'PLAYER_INFO':
          playerColor.value = data.color
          break
        case 'OPPONENT_JOIN':
          opponentName.value = data.username
          isReady.value = true
          break
        case 'OPPONENT_LEAVE':
          opponentName.value = null
          isReady.value = false
          break
        default:
          console.warn('收到未知类型的消息:', data.type)
      }
    } catch (error) {
      console.error('处理WebSocket消息失败:', error)
    }
  }

  ws.onerror = (error) => {
    console.error('WebSocket错误:', error)
    showError('游戏连接出错')
  }

  ws.onclose = (event) => {
    console.log('WebSocket连接已关闭:', event.code, event.reason)
    isReady.value = false
    if (!event.wasClean) {
      showError('游戏连接已断开')
    }
  }

  const makeMove = (x: number, y: number) => {
    if (ws.readyState === WebSocket.OPEN) {
      try {
        const moveMessage = {
          type: 'MOVE',
          x,
          y
        }
        console.log('发送移动消息:', moveMessage)
        ws.send(JSON.stringify(moveMessage))
      } catch (error) {
        console.error('发送移动消息失败:', error)
        showError('发送移动失败')
      }
    } else {
      console.warn('WebSocket未连接，无法发送移动')
      showError('游戏未连接')
    }
  }

  const restartGame = () => {
    if (ws.readyState === WebSocket.OPEN) {
      try {
        const restartMessage = {
          type: 'RESTART'
        }
        console.log('发送重启消息:', restartMessage)
        ws.send(JSON.stringify(restartMessage))
      } catch (error) {
        console.error('发送重启消息失败:', error)
        showError('重启游戏失败')
      }
    } else {
      console.warn('WebSocket未连接，无法重启游戏')
      showError('游戏未连接')
    }
  }

  const leaveGame = () => {
    if (ws.readyState === WebSocket.OPEN) {
      try {
        const leaveMessage = {
          type: 'LEAVE'
        }
        console.log('发送离开消息:', leaveMessage)
        ws.send(JSON.stringify(leaveMessage))
        ws.close(1000, '主动离开')
      } catch (error) {
        console.error('发送离开消息失败:', error)
      }
    }
  }

  onUnmounted(() => {
    if (ws.readyState === WebSocket.OPEN) {
      ws.close(1000, '组件卸载')
    }
  })

  return {
    gameState,
    playerColor,
    opponentName,
    isReady,
    makeMove,
    restartGame,
    leaveGame
  }
}
