

@Component
export struct MinePage{

  build(){
    Column(){
      Text("MineContent")
    }
    .width("100%").height("100%")
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)

  }

}