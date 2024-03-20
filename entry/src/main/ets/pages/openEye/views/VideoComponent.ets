@Preview
@Component
export struct VideoComponent {
  //即 @Link 修饰的变量必须使用其父组件提供的 @State 变量进行初始化，允许组件内部修改 @Link 变量值且更改会通知给父组件。
  @Link playUrl: string
  @Prop showControls: boolean
  private controller: VideoController
  isAutoPlay: boolean = false;
  @State isShowLoading: boolean = true;

  build() {
    //Stack默认元素是居中显示
    Stack() {
      Video({
        src: this.playUrl,
        controller: this.controller
      }).autoPlay(this.isAutoPlay)
        .width("100%").height("100%").onStart(() => {
        this.isShowLoading = false;
      })

      Image($r("app.media.loading"))
        .width(50)
        .height(50)
        .visibility(this.isShowLoading ? Visibility.Visible : Visibility.None)

    }.width("100%").height("100%")
  }
}