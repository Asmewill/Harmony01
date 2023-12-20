import defaultAppManager from '@ohos.bundle.defaultAppManager'
import promptAction from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../viewmodel/ItemData';
import mainViewModel from '../viewmodel/MainViewModel'


@Component
export default struct TextInputWidget {
  private inputImage?:Resource;
  private hintText?:Resource;

  build(){
    Row(){
      Image(this.inputImage!=null?this.inputImage:"")
        .width(24).height(24)
        .margin({left:12})

      TextInput({placeholder:this.hintText})
        .fontSize(16)
        .padding({left:12})
        .placeholderColor($r("app.color.placeholder_color"))
        .margin({right:32}).height(48).backgroundColor(Color.White)

    }
    .width("92%")
    .margin({top:24})
    .height(64).backgroundColor(Color.White)
    .borderRadius(24)
  }

}