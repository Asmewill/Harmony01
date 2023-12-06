
import ItemData from '../viewmodel/ItemData'
import mainViewModel from "../viewmodel/MainViewModel"

@Component
export default struct Setting{
  @Builder settingItem(item:ItemData){
    Row(){

    }
  }


  build(){
    Scroll(){
       Column({space:12}){
         Column(){
           Text($r("app.string.mainPage_tabTitles_mine"))
             .fontSize(24)
             .fontWeight(FontWeight.Medium)
             .margin({top:12,left:12})
         }.width("100%")
         .alignItems(HorizontalAlign.Start)

         Row(){
           Image($r("app.media.account")).width(48).height(48)
           Column(){
             Text($r("app.string.setting_account_name")).fontSize(20)
             Text("864805002@qq.com").margin({top:4}).fontSize(16)
           }.alignItems(HorizontalAlign.Start).margin({left:20})
         }
         .margin({top:20})
         .width("100%")
         .height(96)
         .backgroundColor(Color.White)
         .padding({left:24})
         .borderRadius(16)

         List(){
           ForEach(mainViewModel.getSettingListData(),( item : ItemData)=>{
             ListItem(){
               Text("AA")

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


       }.backgroundColor($r("app.color.background")).height("100%").padding({left:12,right:12})





    }
  }

}