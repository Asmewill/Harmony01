import CommonConstants from '../../../common/constants/CommonConstants';
import { DetailModel } from '../model/DetailModel';
import { FocusModel } from '../model/FocusModel';
import { HomeModel } from '../model/HomeModel';
import { RankModel } from '../model/RankModel';
import { TopDetailModel } from '../model/TopDetailModel';
import { TopicModel } from '../model/TopicModel';
import { CategoryModel } from '../viewmodel/CategoryModel';
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
export function getRelationList(id: number): Promise<DetailModel> {
  return axiosClient.get<DetailModel>(
    {
      url: baseUrl + "api/v4/video/related",
      params: { "id": id },
      showLoading: false
    }
  )
}
/***
 * 获取关注接口
 */
export function getFocusData(pageIndex: number = 0): Promise<FocusModel> {
  return axiosClient.get<FocusModel>(
    {
      url: baseUrl + "api/v4/tabs/follow",
      params: { "start": pageIndex },
    }
  )
}
/***
 * 获取分类接口
 */
export function getCategories(): Promise<CategoryModel[]> {
  return axiosClient.get<CategoryModel[]>({
    url: baseUrl + "api/v4/categories",
  })
}

/***
 * 获取分类详情接口
 */
export function getCategoryDetailList(id: number, start: number): Promise<HomeModel> {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v4/categories/videoList",
    params: {
      "id": id,
      "start": start,
      "udid": CommonConstants.UUID,
      deviceModel: CommonConstants.DEVICE_NUM
    }
  })
}

export function getTopicData(start: number = 0): Promise<TopicModel> {
  return axiosClient.get<TopicModel>(
    {
      url: baseUrl + "api/v3/specialTopics",
      params: { "start": start }
    }
  )
}

export function getTopicDetailList(id: number): Promise<TopDetailModel> {
  return axiosClient.get<TopDetailModel>({
    url: baseUrl + "api/v3/lightTopics/internal/" + id,
  })
}

export function getRankList(rankType:string):Promise<RankModel>{
  return axiosClient.get<RankModel>({
    url: baseUrl + "api/v4/rankList/videos",
    params:{"strategy":rankType}
  })
}




