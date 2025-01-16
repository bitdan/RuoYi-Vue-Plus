import {useRouter} from 'vue-router'
import {useUserStore} from '@/store/user'
import {useMessage} from './useMessage'

export function useAuthCheck() {
  const router = useRouter()
  const userStore = useUserStore()
  const { showError } = useMessage()

  const withAuth = async (callback: () => Promise<void>) => {
    if (!userStore.isLoggedIn) {
      showError('请先登录')
      await router.push('/login')
      return
    }
    await callback()
  }

  return {
    withAuth
  }
}
