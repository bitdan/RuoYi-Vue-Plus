import {ElMessage} from 'element-plus'

export function useMessage() {
  const showSuccess = (message: string) => {
    ElMessage({
      message,
      type: 'success',
      duration: 2000
    })
  }

  const showError = (message: string) => {
    ElMessage({
      message,
      type: 'error',
      duration: 3000
    })
  }

  return {
    showSuccess,
    showError
  }
}
