
import router from '@ohos.router'
import defaultAppManager from '@ohos.bundle.defaultAppManager';
import { LogUtils } from '../utils/LogUtils';


export default class Router{
  static push(url:string,params?:Object){
    router.pushUrl({url:url,params:params},router.RouterMode.Standard,(err)=>{
      if(err){
         LogUtils.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
         return;
      }
      LogUtils.info('pushUrl success' + url);
    })
  }
}
