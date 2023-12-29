@Entry
@Component
export struct SetFontSizePage {
  @State  changeFontSize:number=14;
  build() {

    Column() {
      Row() {
        Image($r("app.media.ic_back")).width(20).height(20)
        Text("字体大小设置").margin({ left: 8 }).fontSize(20)
      }.height(56).width("100%")

      Text("文字大小").alignSelf(ItemAlign.Start).fontSize(14)
      Column() {
        Text(this.changeFontSize.toString()).margin({top:10})
        Row(){
          Text("A").fontSize(18)
          Slider({value:14,min:14,max:30,step:2,style:SliderStyle.InSet})
            .onChange((value:number)=>{
              this.changeFontSize=value;

          })
        }.justifyContent(FlexAlign.Start).width("100%").padding({left:15,right:15})

      }.borderRadius(24).height(100).backgroundColor(Color.White).width("100%")
      .margin({top:10})

    }
    .padding({ left: 15, right: 15 })
    .backgroundColor($r('sys.color.ohos_id_color_sub_background')).height("100%")
  }
}