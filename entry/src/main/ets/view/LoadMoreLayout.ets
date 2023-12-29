
import { LayoutItem } from '../viewmodel/NewsViewModel'


@Component
export default struct LoadMoreLayout{
  @ObjectLink layoutItem:LayoutItem

  build(){
    Column(){
      if(this.layoutItem.isVisible){
        Row() {
          Image(this.layoutItem.imageSrc)
            .width(18)
            .height(18)

          Text(this.layoutItem.textValue)
            .margin({
              left: 10,
              bottom: 10
            })
            .fontSize(16)
            .textAlign(TextAlign.Center)
        }
        .clip(true)
        .width("100%")
        .justifyContent(FlexAlign.Center)
        .height(this.layoutItem.heightValue)
      }else{
        Row() {
          Image(this.layoutItem.imageSrc)
            .width(18)
            .height(18)

          Text(this.layoutItem.textValue)
            .margin({
              left: 10,
              bottom: 10
            })
            .fontSize(16)
            .textAlign(TextAlign.Center)
        }
        .clip(true)
        .width("100%")
        .justifyContent(FlexAlign.Center)
        .height(0)
      }
    }

  }

}