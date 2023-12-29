
import {  LayoutItem } from '../viewmodel/NewsViewModel';


@Component
export default struct ListLayout{
  @ObjectLink layoutItem:LayoutItem;

  build(){
    Row(){

      Image(this.layoutItem.imageSrc)
        .width(18).height(18)

      Text(this.layoutItem.textValue)
        .margin({left:7,bottom:1})
        .fontSize(17)
        .textAlign(TextAlign.Center)

    }
    .clip(true)
    .width("100%")
    .justifyContent(FlexAlign.Center)
    .height(this.layoutItem.heightValue)

  }
}