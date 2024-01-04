@Entry
@Component
struct RelativeContainerPage {
  build() {
    Column() {
      Text("1.在水平方向上,可以设置left、middle、right的锚点。\n" +
      " 2.在竖直方向上，可以设置top、center、bottom的锚点 \n" +
      " 3.在水平方向上，对齐位置可以设置为HorizontalAlign.Start、HorizontalAlign.Center、HorizontalAlign.End \n" +
      "4.在竖直方向上，对齐位置可以设置为VerticalAlign.Top、VerticalAlign.Center、VerticalAlign.Bottom。").padding(10)

      RelativeContainer() {
        Text("AAA").fontColor('#FF3333').alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top } ,
          left: { anchor: "__container__",align:HorizontalAlign.Start}}
        ).id("tv_1")

        Text("BBB").fontColor('#FF3333').alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top } ,
          middle: { anchor: "__container__",align:HorizontalAlign.Center}}
        ).id("tv_2")

        Text("BBB").fontColor('#FF3333').alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top } ,
          middle: { anchor: "__container__",align:HorizontalAlign.Center}}
        ).id("tv_2")

        Text("CCC").fontColor('#FF3333').alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top } ,
          right: { anchor: "__container__",align:HorizontalAlign.End}}
        ).id("tv_3")


        Text("DDD").fontColor('#FF3333').alignRules({
          center: { anchor: "__container__",align: VerticalAlign.Center } ,
          left: { anchor: "__container__",align:HorizontalAlign.Start}}
        ).id("tv_4")

        Text("EEE").fontColor('#FF3333').alignRules({
          center: { anchor: "__container__",align: VerticalAlign.Center } ,
          middle: { anchor: "__container__",align:HorizontalAlign.Center}}
        ).id("tv_5")

        Text("FFF").fontColor('#FF3333').alignRules({
          center: { anchor: "__container__",align: VerticalAlign.Center } ,
          right: { anchor: "__container__",align:HorizontalAlign.End}}
        ).id("tv_6")

        Text("GGG").fontColor('#FF3333').alignRules({
          bottom: { anchor: "__container__",align: VerticalAlign.Bottom } ,
          left: { anchor: "__container__",align:HorizontalAlign.Start}}
        ).id("tv_7")

        Text("HHH").fontColor('#FF3333').alignRules({
          bottom: { anchor: "__container__",align: VerticalAlign.Bottom } ,
          middle: { anchor: "__container__",align:HorizontalAlign.Center}}
        ).id("tv_8")

        Text("KKK").fontColor('#FF3333').alignRules({
          bottom: { anchor: "__container__",align: VerticalAlign.Bottom } ,
          right: { anchor: "__container__",align:HorizontalAlign.End}}
        ).id("tv_9")

      }.width(300).height(300).border({ width: 2, color: '#6699FF' })


      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#FF3333')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top }, //以父容器为锚点，竖直方向顶头对齐
            middle: { anchor: '__container__', align: HorizontalAlign.Center } //以父容器为锚点，水平方向居中对齐
          })
          .id('row1') //设置锚点为row1
        Row() {
          Image($r('app.media.icon'))
        }
        .height(100).width(100)
        .alignRules({
          top: { anchor: 'row1', align: VerticalAlign.Bottom }, //以row1组件为锚点，竖直方向低端对齐
          left: { anchor: 'row1', align: HorizontalAlign.Start } //以row1组件为锚点，水平方向开头对齐
        })
        .id('row2') //设置锚点为row2

        Row()
          .width(100)
          .height(100)
          .backgroundColor('#FFCC00')
          .alignRules({
            top: { anchor: 'row2', align: VerticalAlign.Top }
          })
          .id('row3') //设置锚点为row3

        Row()
          .width(100)
          .height(100)
          .backgroundColor('#FF9966')
          .alignRules({
            top: { anchor: 'row2', align: VerticalAlign.Top },
            left: { anchor: 'row2', align: HorizontalAlign.End },
          })
          .id('row4') //设置锚点为row4

        Row()
          .width(100)
          .height(100)
          .backgroundColor('#FF66FF')
          .alignRules({
            top: { anchor: 'row2', align: VerticalAlign.Bottom },
            middle: { anchor: 'row2', align: HorizontalAlign.Center }
          })
          .id('row5') //设置锚点为row5
      }
      .width(300).height(300).border({ width: 2, color: '#6699FF' })

    }

  }
}