import defaultAppManager from '@ohos.bundle.defaultAppManager'
import promptAction from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../viewmodel/ItemData';
import mainViewModel from '../viewmodel/MainViewModel'


@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Row() {
          Text($r("app.string.mainPage_tabTitles_home"))
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }.width("100%").justifyContent(FlexAlign.Start)

        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius(16).onClick(() => {
              promptAction.showToast({ message: "item clicked" })
            })
          })
        }.autoPlay(true).margin({right:5})

        Grid() {
          ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img).width(24).height(24)
                Text(item.title).fontSize(12).margin({ top: 5 })
              }
            }
          })
        }
        .columnsTemplate("1fr 1fr 1fr 1fr")
        .rowsTemplate("1fr 1fr")
        .columnsGap(8)
        .padding({ top: 12, bottom: 12 })
        .height(124)
        .backgroundColor($r("app.color.white"))
        .borderRadius(24)

        Text($r("app.string.home_list")).fontSize(16).fontWeight(FontWeight.Medium)
          .width("100%").margin({top:12}).textAlign(TextAlign.Start)
        
        Grid(){
          ForEach(mainViewModel.getSecondGridData(),(item:ItemData)=>{
             GridItem(){
               Column(){
                 Text(item.title).fontSize(16).fontWeight(FontWeight.Medium)
                 Text(item.others).margin({top:4}).fontSize(12)
                   .fontColor($r("app.color.home_grid_fontColor"))
               }.alignItems(HorizontalAlign.Start)

             }
             .backgroundImage(item.img)
             .borderRadius(12)
             .align(Alignment.TopStart)
             .width("100%").height("100%").backgroundImageSize(ImageSize.Cover)
             .padding({top:8,left:8})
          })
        }
        .width("100%").height(260)
        .columnsTemplate("1fr 1fr")
        .rowsTemplate("1fr 1fr")
        .columnsGap(8)
        .rowsGap(12)

      }.padding({left:10,right:10}).margin({bottom:100})


    }.height("100%").backgroundColor($r("app.color.background")).scrollBar(BarState.Off)
  }
}