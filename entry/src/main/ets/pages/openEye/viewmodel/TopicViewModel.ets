import { getTopicData } from '../http/apiService';
import { TopicModel } from '../model/TopicModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class TopicViewModel extends BaseViewModel {

  getTopicData(pageIndex: number, callBack?: ResultCallback) {
    this.httpRequest().promise(getTopicData(), pageIndex == 0 ? true : false).then((result: TopicModel) => {
      callBack?.(result);
    })
  }
}

export default new TopicViewModel();