

@Component
export struct HotPage{


  build(){
    Column(){
      Text("HotContent")
    }.width("100%").height("100%").justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)

  }
}