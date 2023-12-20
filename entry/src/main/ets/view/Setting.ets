
import promptAction from '@ohos.promptAction'
import CommonConstants from '../common/constants/CommonConstants'
import ItemData from '../viewmodel/ItemData'
import mainViewModel from "../viewmodel/MainViewModel"

@Component
export default struct Setting{
  @Builder settingItem(item:ItemData){
    Row(){
      Row({space:CommonConstants.COMMON_SPACE}){
        Image(item.img).width(22).height(22)
        Text(item.title).fontSize(16)
      }
      if(item.others==null){
        Image($r("app.media.right_grey"))
          .width(12).height(24)
      }else{
        Toggle({type:ToggleType.Switch,isOn:false})
      }
    }.justifyContent(FlexAlign.SpaceBetween).width("100%").padding({left:10,right:10}).onClick(()=>{
         promptAction.showToast({message:item.title})
    })
  }


  build(){
    Scroll(){

       Column({space:12}){
         Row(){
           Text($r("app.string.mainPage_tabTitles_mine"))
             .fontSize(24)
             .fontWeight(FontWeight.Medium)
             .margin({top:12,left:12})
         }.width("100%")
         .justifyContent(FlexAlign.Start)


         Row(){
           Image($r("app.media.account")).width(48).height(48)
           Column(){
             Text($r("app.string.setting_account_name")).fontSize(20)
             Text("864805002@qq.com").margin({top:4}).fontSize(16)
           }.alignItems(HorizontalAlign.Start).margin({left:20})
         }
         .margin({top:0})
         .width("100%")
         .height(96)
         .backgroundColor(Color.White)
         .padding({left:24})
         .borderRadius(16)


         List(){
           ForEach(mainViewModel.getSettingListData(),( item : ItemData)=>{
             ListItem(){
               this.settingItem(item)
             }.height(48)
           }, (item:ItemData) => JSON.stringify(item))
         }
         .backgroundColor(Color.White)
         .width("100%")
         .height("42%")
         .divider({
           strokeWidth:0.25,
           color:Color.Gray,
           startMargin:42,
           endMargin:24
         })
         .borderRadius(16)
         .padding({top:4,bottom:4})

         Blank()
         Button($r("app.string.setting_button",{type:ButtonType.Capsule}))
           .width("90%").height(40).fontSize(16).fontColor($r("app.color.setting_button_fontColor"))
           .backgroundColor($r("app.color.setting_button_backgroundColor")).margin({bottom:55})
           .onClick(()=>{
              promptAction.showToast({message:"退出登录"})
           })


       }.backgroundColor($r("app.color.background")).height("100%").padding({left:12,right:12})

    }
  }

}