import applyCaseMiddleware from "axios-case-converter"
import axios from "axios"
import Cookies from "js-cookie"

// applyCaseMiddleware:
// axiosで受け取ったレスポンスの値をスネークケース→キャメルケースに変換
// または送信するリクエストの値をキャメルケース→スネークケースに変換してくれるライブラリ

// ヘッダーに関してはケバブケースのままで良いので適用を無視するオプションを追加
const options = {
  ignoreHeaders: true
}

const client = applyCaseMiddleware(axios.create({
  baseURL: "http://192.168.224.132:3001/api/v1",
  headers: {
    Authorization: Cookies.get("_authorization") || ""
  }
}), options)

export default client