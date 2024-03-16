
import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import { ApiResponse } from './AxiosHttp'
import axios from "@ohos/axios"


//这是一个 TypeScript 类型定义，定义了一个名为 LoadStateResult 的类型，其中包含了一个名为 promise 的属性，该属性是一个函数类型。

export type LoadStateResult={
  //showLoadingState 是否显示加载中...状态
  promise:<T>(requestPromise:Promise<T>,showLoadingState?:boolean)=>Promise<T>
}

const useRequestStatus=(stateCallback?:(state:string)=>void,checkResult:boolean=false):LoadStateResult=>{

  function updateViewState(state:string){
    stateCallback?.(state)
  }
  //LoadStateResult Type中 promise函数的实现类
  function run<T>(requestPromise:Promise<T>,showLoadingState:boolean):Promise<T>{
    if(showLoadingState!==false){
      updateViewState(ViewStateConstant.VIEW_STATE_LOADING)
    }
    return new Promise<T>((resolve,reject)=>{
      requestPromise.then((res)=>{
        if(checkResult){
          const  result= res as unknown as ApiResponse;
          const resultData=result.data;
          if(result.errorCode!==0){
            updateViewState(ViewStateConstant.VIEW_STATE_ERROR)
          }else if(Array.isArray(resultData)&&resultData.length===0){
            updateViewState(ViewStateConstant.VIEW_STATE_EMPTY);
          }else{
            updateViewState(ViewStateConstant.VIEW_STATE_SUCCESS);
          }
        }else{
          updateViewState(ViewStateConstant.VIEW_STATE_SUCCESS);
        }
        resolve(res)
      }).catch((error)=>{
        if(axios.isAxiosError(error)){
          updateViewState(ViewStateConstant.VIEW_STATE_NETWORK_ERROR);
        }else{
          updateViewState(ViewStateConstant.VIEW_STATE_ERROR);
        }
        reject(error);
      })
    })
  }
  return  { promise:run }
}
export default  useRequestStatus;