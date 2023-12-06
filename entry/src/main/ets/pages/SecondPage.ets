import router from '@ohos.router'

@Entry
@Component
struct SecondPage {
  @State message: string = 'SecondPage'
  @State src:string =(router.getParams() as Record<string ,string>)["src"];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize("38fp")
          .fontWeight(FontWeight.Bold)
        Text(this.src)
          .fontSize("20fp")
          .opacity(0.6)
        Blank()
        Button($r("app.string.back"))
          .fontSize("16fp")
          .width("296vp")
          .height("40vp")
          .backgroundColor($r("app.color.button_bg"))
          .onClick(()=>{
            router.back();
          })
      }.width("100%")
      .height("140vp")
    }.height('100%').backgroundColor($r("app.color.page_bg"))
  }
}