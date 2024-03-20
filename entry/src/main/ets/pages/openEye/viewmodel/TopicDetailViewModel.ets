import { getTopicDetailList } from '../http/apiService'
import { TopDetailModel } from '../model/TopDetailModel'
import { BaseViewModel, ResultCallback } from './BaseViewModel'

export class TopicDetailViewModel extends BaseViewModel {
  async getTopicDetailList(id: number, callBack?: ResultCallback) {
    await this.httpRequest().promise(getTopicDetailList(id), true).then((result: TopDetailModel) => {
      callBack?.(result);
    })
  }
}

export default new TopicDetailViewModel();