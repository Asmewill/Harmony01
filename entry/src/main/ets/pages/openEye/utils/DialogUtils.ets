import emitter from '@ohos.events.emitter'
import { EventId } from '../event/EventKeys'
import { LoadingDialogEvent } from '../event/LoadingDialogEvent'

/***
 * 展示loading
 */
export function showLoadingDialog(tips:string="加载中"){
   //发送EventBus通知
   emitter.emit(EventId ,LoadingDialogEvent(true,tips))
}
/***
 * 隐藏loading
 */
export function hideLoadingDialog(){
   //发送EventBus通知
   emitter.emit(EventId,LoadingDialogEvent(false,""))
}