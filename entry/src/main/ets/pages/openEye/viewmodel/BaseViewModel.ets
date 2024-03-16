
import useRequestStatus, { LoadStateResult } from '../http/useRequestStatus';
export type StateCallback=(state:string)=>void;
export  type ResultCallback=(result:any)=>void;


export  class BaseViewModel{
  private stateCallBack?:StateCallback;

  observeState(stateCallback:StateCallback){
    this.stateCallBack=stateCallback;
  }
  dispatchViewState(state:string){
    if(this.stateCallBack!=null){
      this.stateCallBack(state)
    }
  }

  httpRequest(checkResult?:boolean):LoadStateResult{
     return useRequestStatus(
       state=>{
       this.dispatchViewState(state)
     },checkResult)
  }


}