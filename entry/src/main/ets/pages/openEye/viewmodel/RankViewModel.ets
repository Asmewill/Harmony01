import { getRankList } from '../http/apiService';
import { RankModel } from '../model/RankModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class RankViewModel extends BaseViewModel {
  async getRankList(rankType: string, callBack?: ResultCallback) {
    await this.httpRequest().promise(getRankList(rankType), true).then((result: RankModel) => {
      callBack?.(result)
    })
  }
}

