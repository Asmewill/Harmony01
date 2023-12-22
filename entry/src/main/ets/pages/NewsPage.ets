
import TabBar from '../view/TabBar'

@Entry
@Component
struct NewsPage{

  build(){
    Column(){
      Column(){
        TabBar()
      }
      .width("100%")
      .backgroundColor("#F1F3F5")
      .justifyContent(FlexAlign.Center)
    }
  }
}