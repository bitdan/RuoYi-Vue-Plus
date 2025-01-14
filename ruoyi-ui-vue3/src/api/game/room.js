import request from '@/utils/request'

// 查询五子棋房间列表
export function listRoom(query) {
  return request({
    url: '/game/room/list',
    method: 'get',
    params: query
  })
}

// 查询五子棋房间详细
export function getRoom(id) {
  return request({
    url: '/game/room/' + id,
    method: 'get'
  })
}

// 新增五子棋房间
export function addRoom(data) {
  return request({
    url: '/game/room',
    method: 'post',
    data: data
  })
}

// 修改五子棋房间
export function updateRoom(data) {
  return request({
    url: '/game/room',
    method: 'put',
    data: data
  })
}

// 删除五子棋房间
export function delRoom(id) {
  return request({
    url: '/game/room/' + id,
    method: 'delete'
  })
}
