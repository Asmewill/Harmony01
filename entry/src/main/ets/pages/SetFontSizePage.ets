
import router from '@ohos.router';
import PreferencesUtil from '../common/database/PreferencesUtil';
@Entry
@Component
export struct SetFontSizePage {
  @State changeFontSize: number = 14;

  onPageShow(){
    PreferencesUtil.getChangeFontSize().then((value)=>{
      if(value===0){
        this.changeFontSize=14;
      }else{
        this.changeFontSize=value;
      }
    })
  }


  build() {

    Column() {
      Row() {
        Image($r("app.media.ic_back")).width(20).height(20).onClick(()=>{
           router.back();
        })
        Text("字体大小设置").margin({ left: 8 }).fontSize(20)
      }.height(56).width("100%")

      Text("文字大小").alignSelf(ItemAlign.Start).fontSize(14)

      Column() {
        Text(this.changeFontSize.toString()).margin({ top: 10 })
        Row() {

          Text("A").fontSize(18).margin({right:10})

          Slider({
            value: this.changeFontSize,
            min: 14,
            max: 30,
            step: 2,
            style: SliderStyle.InSet
          }).onChange(async (value: number) => {
            this.changeFontSize = value;
            PreferencesUtil.saveChangeFontSize(this.changeFontSize)
          }).layoutWeight(1)

          Text("A").fontSize(20).margin({ left: 10 })

        }.justifyContent(FlexAlign.Start).width("100%").padding({ left: 15, right: 15 })

      }
      .borderRadius(24)
      .height(96)
      .backgroundColor(Color.White)
      .width("100%")
      .margin({ top: 10 })

    }
    .padding({ left: 15, right: 15 })
    .backgroundColor($r('sys.color.ohos_id_color_sub_background')).height("100%")
  }
}