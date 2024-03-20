import { getTopicData } from '../http/apiService';
import { TopicModel } from '../model/TopicModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class TopicViewModel extends BaseViewModel {
  pageIndex: number = 0;

  getTopicData(pageIndex: number, callBack?: ResultCallback) {
    this.httpRequest().promise(getTopicData(), this.pageIndex == 0 ? true : false).then((result: TopicModel) => {
      callBack?.(result);
    })
  }
}

export default new TopicViewModel();