/***
 * 公共头部View
 */
import router from '@ohos.router';

@Component
export struct CommonTopBar {
  //即 @Prop 修饰的变量必须使用其父组件提供的 @State 变量进行初始化，允许组件内部修改 @Prop 变量值但更改不会通知给父组件
  @Prop title: string
  @Prop alpha: number
  @State statusBarHeight: number = 0
  private backButton: boolean = true;
  private onBackClick?: () => void

  aboutToAppear() {

  }

  build() {
    Column() {
      Blank().backgroundColor("#d81e06").opacity(this.alpha)
      RelativeContainer() {
        if (this.backButton) {
          Image($r("app.media.ic_action_back"))
            .height(16)
            .width(16)
            .alignRules({
              left: { anchor: "__container__", align: HorizontalAlign.Start },
              center: { anchor: "__container__", align: VerticalAlign.Center }
            })
            .id("iv_back")
            .margin({ left: 20 })
            .onClick(() => {
              if (this.onBackClick != null) {
                this.onBackClick?.();
              }
            })
        }
        Text(this.title)
          .alignRules({
            middle: { anchor: "__container__", align: HorizontalAlign.Center }, //水平方向
            center: { anchor: "__container__", align: VerticalAlign.Center }, //竖直方向上
          })
          .id("tv_title")
          .fontColor(Color.White)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textAlign(TextAlign.Center)
      }.width("100%").height(50).backgroundColor("#d81e06").opacity(this.alpha)

    }.height(90)

  }
}