@Entry
@Component
struct StackPage {
  scroller: Scroller = new Scroller();
  private aar:String[]=["APP1", "APP2", "APP3", "APP4", "APP5", "APP6", "APP7", "APP8", "APP9"]

  build() {

    Scroll(this.scroller) {
      Column() {

        Text("层叠布局（StackLayout）用于在屏幕上预留一块区域来显示组件中的元素，提供元素可以重叠的布局。层叠布局通过Stack容器组件实现位置的固定定位与层叠，容器中的子元素（子组件）依次入栈，后一个子元素覆盖前一个子元素，子元素可以叠加，也可以设置位置。")
          .padding("10")
        Text("1.Stack组件为容器组件，容器内可包含各种子组件。其中子组件默认进行居中堆叠。子元素被约束在Stack下，进行自己的样式定义以及排列。")
          .padding("10")
        Stack() {
          Column().width("90%").height("100%").backgroundColor("#ff58b87c")
          Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
          Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000')
        }.width("100%").height(150)

        Text("2.对齐方式：Stack组件通过alignContent参数实现位置的相对移动。如图2所示，支持九种对齐方式。 " +
        "TopStart,Top,TopEnd,Start,Center,End,BottomStart,Bottom,BottomEnd")
          .padding("10")
        Stack() {
          Column() {

          }.width("90%").height("90").backgroundColor(Color.White)

          Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000')
        }.width("100%").height(150).backgroundColor(Color.Black).alignContent(Alignment.Center)

        Text("3.Stack容器中兄弟组件显示层级关系可以通过Z序控制的zIndex属性改变。zIndex值越大，显示层级越高，即zIndex值大的组件会覆盖在zIndex值小的组件上方。")
          .padding("10")

        Stack({alignContent:Alignment.BottomStart}) {
          Column() {
            Text('Stack子元素1').textAlign(TextAlign.End).fontSize(20)
          }.width(100).height(100).backgroundColor(0xffd306).zIndex(2)

          Column() {
            Text('Stack子元素2').fontSize(20)
          }.width(150).height(150).backgroundColor(Color.Pink).zIndex(1)

          Column() {
            Text('Stack子元素3').fontSize(20)
          }.width(200).height(200).backgroundColor(Color.Grey)
        }.margin({ top: 100 }).width(350).height(350).backgroundColor(Color.Black)
      }



    }
    .backgroundColor(0xDCDCDC)
    .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹


  }
}