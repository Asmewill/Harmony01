import { DetailModel } from '../model/DetailModel';
import { FocusModel } from '../model/FocusModel';
import { HomeModel } from '../model/HomeModel';
import { axiosClient } from './AxiosRequest';


let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"

/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */
export function getHomeListAxios(date: string = ""): Promise<HomeModel> {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v2/feed",
    params: { "date": date },
    showLoading: true
  })

}
/**
 * 获取视频详情接口
 * @param id
 */
export function getRelationList(id: number) {
  return axiosClient.get<DetailModel>(
    {
      url: baseUrl + "api/v4/video/related",
      params: { "id": id },
      showLoading:false
    }
  )
}
/***
 * 获取关注接口
 */
export function getFocusData(pageIndex: number = 0): Promise<FocusModel> {

  return axiosClient.get<FocusModel>(
    {
      url:baseUrl+"api/v4/tabs/follow",
      params:{"start":pageIndex},
    }
  )
}