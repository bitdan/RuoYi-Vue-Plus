import request from '@/utils/request'

// 查询全局应用列表
export function listGlobalApp(query) {
  return request({
    url: '/system/globalApp/list',
    method: 'get',
    params: query
  })
}

// 查询全局应用详细
export function getGlobalApp(id) {
  return request({
    url: '/system/globalApp/' + id,
    method: 'get'
  })
}

// 新增全局应用
export function addGlobalApp(data) {
  return request({
    url: '/system/globalApp',
    method: 'post',
    data: data
  })
}

// 修改全局应用
export function updateGlobalApp(data) {
  return request({
    url: '/system/globalApp',
    method: 'put',
    data: data
  })
}

// 删除全局应用
export function delGlobalApp(id) {
  return request({
    url: '/system/globalApp/' + id,
    method: 'delete'
  })
}
