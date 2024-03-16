@Component
export struct RefreshFooter {
   @Prop showFooter:boolean;
  build() {
    Row() {
      Text("数据加载中，请稍后").fontColor("#333332").fontSize(15)
    }.width("100%").height(50)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .backgroundColor("#f8f8f8")
    .visibility(this.showFooter?Visibility.Visible:Visibility.None)
  }
}