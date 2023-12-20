
import promptAction from '@ohos.promptAction';

import Context from '@ohos.app.ability.common';
import CommonConstants from '../constants/CommonConstants';
export class CommonUtils{

   alertDialog(context:Context.UIAbilityContext){
     AlertDialog.show({
       message:$r("app.string.alert_dialog_message"),
       alignment:DialogAlignment.Bottom,
       offset:{
         dx:0,
         dy:-20
       },
       primaryButton:{
         value:$r("app.string.cancel_button"),
         action:()=>{
           promptAction.showToast({message:"取消"})
         }
       },
       secondaryButton:{
         value:$r("app.string.definite_button"),
         action:()=>{
           context.terminateSelf();
           promptAction.showToast({message:"确定"})
         }
       }
     });
   }

  datePickerDialog(dateCallBack:(string)=>void){
    DatePickerDialog.show({
      start:new Date("1940-1-1"),
      end:new Date(),
      selected:new Date("1990-1-1"),
      lunar:false,
      onAccept:(value: DatePickerResult)=>{
        let year:number=value.year
        let month:number=value.month+1;
        let day=value.day;
        let birthdate:string=this.getBirthDateValue(year,month,day);
        dateCallBack(birthdate)
      }
    });
  }


  getBirthDateValue(year:number,month:number,day:number): string {
    let birthDate:string =year+"年"+month+"月"+day+"日";
    return birthDate;
  }

  textPickerDialog(sexArray:Resource,sexCallback:Function){
    if(this.isEmpty(sexArray)){
      promptAction.showToast({message:"sex is null"})
      return;
    }
    TextPickerDialog.show({
      range:sexArray,
      selected:1,
      onAccept:(result: TextPickerResult)=>{
        sexCallback(result.value);
      },
      onCancel:()=>{

      }
    });
  }

  isEmpty(obj:object|string):boolean{
    return obj==undefined||obj==null||obj=="";
  }


}
export default  new CommonUtils();