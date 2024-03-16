import { getRelationList } from '../http/apiService';
import { DetailModel, ItemList } from '../model/DetailModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';


export class VideoDetailViewModel extends BaseViewModel {
  async getRelationList(playId:number,resultCallback?: ResultCallback) {
    await this.httpRequest().promise(getRelationList(playId), true).then((result:DetailModel) => {
      let filterList=result.itemList.filter((item:ItemList)=> item.type==="videoSmallCard")
      resultCallback?.(filterList)

    })
  }
}
export default new VideoDetailViewModel();

