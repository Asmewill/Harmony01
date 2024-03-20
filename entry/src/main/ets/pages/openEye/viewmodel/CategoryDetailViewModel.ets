
import defaultAppManager from '@ohos.bundle.defaultAppManager';
import { getCategoryDetailList } from '../http/apiService';
import { HomeModel } from '../model/HomeModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class CategoryDetailViewModel extends BaseViewModel{

   async  getCategoryDetailList(id:number,pageIndex:number,callBack?:ResultCallback){
        this.httpRequest().promise(getCategoryDetailList(id,pageIndex),pageIndex===0?true:false).then((result:HomeModel)=>{
          callBack?.(result)
        })
    }

}

export default new CategoryDetailViewModel();