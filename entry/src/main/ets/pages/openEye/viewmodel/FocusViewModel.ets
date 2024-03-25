import { httpRequestGet } from '../../../common/utils/HttpUtil';
import { getFocusData } from '../http/apiService';
import { FocusModel, ItemList } from '../model/FocusModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class FocusViewModel extends BaseViewModel {


 async  getFocusData(pageIndex: number, callBack?: ResultCallback) {
   await  this.httpRequest().promise(getFocusData(pageIndex), pageIndex==0?true:false).then((focusModel: FocusModel) => {
      let valueList: ItemList[] = focusModel.itemList.filter((item: ItemList) => item.type == "videoCollectionWithBrief");
      callBack?.(valueList);
    })
  }
}
export  default  new FocusViewModel()


