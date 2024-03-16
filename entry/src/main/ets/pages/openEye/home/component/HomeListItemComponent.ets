import { HomeModel, ItemList } from '../../model/HomeModel'
import ImageRegexUtils from '../../utils/ImageRegexUtil';
import showToast from '../../utils/ToastUtils';


@Component
export struct HomeListItemComponent {
  private item: ItemList;
  bannerList: ItemList[] = [];
  click:()=>void;

  aboutToAppear() {
    if (this.item.type == "banner2") {
      this.bannerList.push(this.item);
    }

  }

  build() {
    if (this.item.type == "banner2") {
      this.bannerComponent();
    } else {
      this.itemComponent();
    }
  }

  @Builder
  bannerComponent() {
    Swiper() {
      ForEach(this.bannerList.concat(this.bannerList)
        .concat(this.bannerList)
        .concat(this.bannerList), (item: ItemList) => {
        Image(ImageRegexUtils(item.data.image))
          .borderRadius(16)
          .width("100%")
          .height(200)
          .onClick(() => {
              if(this.click){
                this.click();
              }
           })
          .margin({ left: 5, right: 5 })
      })
    }.autoPlay(true).indicatorStyle({ color: "#F1F3F5", selectedColor: "#007DFF" })
  }

  @Builder
  itemComponent() {
    Column() {
      RelativeContainer() {
       //默认后面组件回覆盖前面的组件，可以自用zIndex改变层级
       //  Text("旅游")
       //    .width(80)
       //    .height(50)
       //    .border({ radius: { topLeft: 10, bottomRight: 10 } })
       //    .backgroundColor(Color.Blue)
       //    .fontColor(Color.White)
       //    .fontSize(10)
       //    .textAlign(TextAlign.Center)
       //    .id("tv_2").alignRules({
       //    left:{anchor:"__container__",align:HorizontalAlign.Start},
       //    top:{anchor:"__container__",align:VerticalAlign.Top}
       //  })
        Text("旅游")
          .width(40)
          .height(25)
          .border({ radius: { topLeft: 10, bottomRight: 10 } })
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .fontSize(10)
          .textAlign(TextAlign.Center)
          .id("tv_1").alignRules({
            left:{anchor:"__container__",align:HorizontalAlign.Start},
            top:{anchor:"__container__",align:VerticalAlign.Top}
        })
      }.width("100%").height(200).backgroundImage(`${this.item.data?.cover?.feed}`, ImageRepeat.XY).borderRadius(10)

      Row(){
        Image(`${this.item.data?.cover?.feed}`).width(40).height(40).borderRadius(20)
        Column(){
          Text(`${this.item.data?.author?.name}`).fontSize(14).margin({bottom:1})
          Text(`${this.item.data?.author?.name}`).fontSize(12)
        }.height("100%").justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Start).padding({left:10})
      }.width("100%").height(50).justifyContent(FlexAlign.Start).alignItems(VerticalAlign.Center)

    }.padding({left:10,right:10}).onClick(()=>{
        if(this.click){
           this.click();
        }
    })
  }
}