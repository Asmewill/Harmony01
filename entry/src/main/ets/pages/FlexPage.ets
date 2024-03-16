
@Preview
@Entry
@Component
struct FlexPage{


  //Flex 弹性布局
  build(){
    Scroll(){
      Column(){
        Text("1.FlexDirection.Row（默认值）：主轴为水平方向，子组件从起始端沿着水平方向开始排布。")
        .padding(10)
        Flex({ direction: FlexDirection.Row }) {
          Text('1').width('13%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('23%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('33%').height(50).backgroundColor(0xF5DEB3)
        }
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("2.FlexDirection.RowReverse：主轴为水平方向，子组件从终点端沿着FlexDirection. Row相反的方向开始排布。")
          .padding(10)
        Flex({ direction: FlexDirection.RowReverse }) {
          Text('1').width('13%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('23%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('33%').height(50).backgroundColor(0xF5DEB3)
        }
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("3.FlexDirection.Column：主轴为垂直方向，子组件从起始端沿着垂直方向开始排布。")
          .padding(10)
        Flex({ direction: FlexDirection.Column }) {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('100%').height(75).backgroundColor(0xD2B48C)
          Text('3').width('100%').height(100).backgroundColor(0xF5DEB3)
        }
        .height(225)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)


        Text("4.FlexDirection.ColumnReverse：主轴为垂直方向，子组件从终点端沿着FlexDirection. Column相反的方向开始排布。")
          .padding(10)
        Flex({ direction: FlexDirection.ColumnReverse }) {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('100%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('100%').height(50).backgroundColor(0xF5DEB3)
        }
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("5.FlexWrap. NoWrap（默认值）：不换行。如果子组件的宽度总和大于父元素的宽度，则子组件会被压缩宽度。")
          .padding(10)
        Flex({ wrap: FlexWrap.NoWrap }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xF5DEB3)
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("6.FlexWrap. Wrap：换行，每一行子组件按照主轴方向排列.")
          .padding(10)
        Flex({ wrap: FlexWrap.Wrap }) {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3).margin({right:10,bottom:10})
          Text('2').width('20%').height(50).backgroundColor(0xD2B48C).margin({right:10,bottom:10})
          Text('3').width('20%').height(50).backgroundColor(0xF5DEB3).margin({right:10,bottom:10})
          Text('4').width('15%').height(50).backgroundColor(0xD2B48C).margin({right:10,bottom:10})
          Text('5').width('10%').height(50).backgroundColor(0xD2B48C).margin({bottom:10})
          Text('6').width('10%').height(50).backgroundColor(0xD2B48C).margin({bottom:10})
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)


        Text("7.FlexWrap. WrapReverse：换行，每一行子组件按照主轴反方向排列。")
          .padding(10)
        Flex({ wrap: FlexWrap.WrapReverse}) {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3).margin({left:10,bottom:10})
          Text('2').width('20%').height(50).backgroundColor(0xD2B48C).margin({left:10,bottom:10})
          Text('3').width('20%').height(50).backgroundColor(0xF5DEB3).margin({left:10,bottom:10})
          Text('4').width('15%').height(50).backgroundColor(0xD2B48C).margin({left:10,bottom:10})
          Text('5').width('10%').height(50).backgroundColor(0xD2B48C).margin({bottom:10})
          Text('6').width('10%').height(50).backgroundColor(0xD2B48C).margin({bottom:10})
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text("8.主轴对齐方式：FlexAlign.Start（默认值）/Center/End/SpaceBetween/SpaceAround/SapceEvenly：" +
        "子组件在主轴方向起始端对齐， 第一个子组件与父元素边沿对齐，其他元素与前一个元素对齐。")
        Flex({direction:FlexDirection.Row, justifyContent: FlexAlign.End }) {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('20%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('20%').height(50).backgroundColor(0xF5DEB3)
        }
        .width('90%')
        .padding({ top: 10, bottom: 10 })
        .backgroundColor(0xAFEEEE)


        Text("9.交叉轴对齐方式：ItemAlign.Auto（默认值）/Center/End/Stretch/SpaceAround/SapceEvenly：" +
        "子组件在主轴方向起始端对齐， 第一个子组件与父元素边沿对齐，其他元素与前一个元素对齐。").padding(10)
        Flex({ alignItems: ItemAlign.Auto }) {
          Text('1').width('33%').height(30).backgroundColor(0xF5DEB3)
          Text('2').width('33%').height(40).backgroundColor(0xD2B48C)
          Text('3').width('33%').height(50).backgroundColor(0xF5DEB3)
        }
        .size({ width: '90%', height: 80 })
        .padding(10)
        .backgroundColor(0xAFEEEE)

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