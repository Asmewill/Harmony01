
import promptAction from '@ohos.promptAction';

import CommonUtils from '../common/utils/CommonUtils';

import Logger from '../common/utils/Logger';
import HobbyItem from '../viewmodel/HobbyItem';
const TAG="CustomDialogWidget"

@CustomDialog
export default struct CustomDialogWidget {
  @State hobbyItems:HobbyItem[]=[];
  @Link hobbies:string;
  private controller?:CustomDialogController;


  aboutToAppear(){
    let context:Context=getContext(this);
    if(CommonUtils.isEmpty(context)||CommonUtils.isEmpty(context.resourceManager)){
      return;
    }
    let manager=context.resourceManager;
    manager.getStringArrayValue($r("app.strarray.hobbies_data").id,(error,hobbyArray)=>{
      if(!CommonUtils.isEmpty(error)){
        Logger.error(TAG,"error="+JSON.stringify(error))
      }else{
        hobbyArray.forEach((hobby:string)=>{
          let hobbyItem=new HobbyItem();
          hobbyItem.label=hobby;
          if(this.hobbies.indexOf(hobby)!=-1){
            hobbyItem.isChecked=true;
          }else{
            hobbyItem.isChecked=false;
          }
          this.hobbyItems.push(hobbyItem)
        })
      }
    })
    //程序会先执行这一段代码，然后去去读取hobbies_data数组
    // if(!CommonUtils.isEmpty(this.hobbies)){ //选择了爱好之后再次进入
    //   this.hobbyItems.filter((item:HobbyItem)=>{
    //     return this.hobbies.indexOf(item.label)!=-1;
    //   })
    // }
  }


  setHobbiesValue(hobbyItems:HobbyItem[]){
    if(CommonUtils.isEmpty(hobbyItems)){
      return;
    }
    let hobbiesText:string="";
   hobbiesText=hobbyItems.filter((item:HobbyItem)=>item.isChecked).map<string>( (item1:HobbyItem)=>{
      return item1.label;
    }).join(",")
    if(hobbiesText.length>0){
      this.hobbies=hobbiesText;
      promptAction.showToast({message:this.hobbies})
    }
  }

  build(){
    Column(){
      Text($r("app.string.text_title_hobbies"))
        .fontColor($r("app.color.custom_button_color"))
        .fontSize(20)
        .lineHeight(28)
        .fontWeight(500)
        .alignSelf(ItemAlign.Start)
        .margin({left:24})

      List(){
        ForEach(this.hobbyItems,(itemHobby:HobbyItem)=>{
          ListItem(){
            Row(){
              Text(itemHobby.label).layoutWeight(1).margin({left:20})

              Toggle({type:ToggleType.Switch,isOn:itemHobby.isChecked}).margin({right:20})
                .onChange((isCheck)=>{
                  itemHobby.isChecked=isCheck;
              })
            }.height(45)
          }
        })
      }.margin({
        top:14,
        bottom:8
      }).divider({
        strokeWidth:0.5,
        color:$r("app.color.divider_color")
      })
      Row(){
        Button($r("app.string.cancel_button"))
          .layoutWeight(1).backgroundColor(Color.White)
          .fontColor($r("app.color.custom_button_color"))
          .onClick(()=>{
           this.controller?.close();
        })
        Blank()
          .backgroundColor($r('app.color.custom_blank_color'))
          .width(1)
          .opacity(1)

        Button($r("app.string.definite_button"))
          .layoutWeight(1).backgroundColor(Color.White)
          .fontColor($r("app.color.custom_button_color"))
          .onClick(()=>{
            this.controller?.close();
            this.setHobbiesValue(this.hobbyItems)
          })
      }.width("92%")
    }
    .width("92%")
    .padding({ top:14, bottom:16 })
    .backgroundColor(Color.White)
    .borderRadius(32)

  }

}