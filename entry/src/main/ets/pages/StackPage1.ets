import promptAction from '@ohos.promptAction';

@Entry
@Component
struct StackPage1 {
  scroller: Scroller = new Scroller();
  private arr: String[] = ["APP1", "APP2", "APP3", "APP4", "APP5", "APP6", "APP7", "APP8", "APP9"];

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(this.arr, (item: string) => {
              Text(item)
                .width(100)
                .aspectRatio(1)
                .backgroundColor(Color.White)
                .margin({ left: 10, top: 5, right: 10, bottom: 10 }).textAlign(TextAlign.Center).borderRadius(10)
            })
          }.width("100%").height("100%")


      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text("联系人").fontColor(Color.White).margin({ left: 10 }).onClick(() => {
          promptAction.showToast({ message: "联系人" })
        })
        Text("设置").fontColor(Color.White).onClick(() => {
          promptAction.showToast({ message: "设置" })
        })
        Text("短信").fontColor(Color.White).margin({ right: 10 }).onClick(() => {
          promptAction.showToast({ message: "短信" })
        })

      }
      .width("50%")
      .height("50")
      .backgroundColor(Color.Black)
      .margin({ bottom: 10 })
      .borderRadius(10)

    }.width("100%").height("100%").backgroundColor('#CFD0CF')

  }
}