import router from '@ohos.router'
import { CategoryPage } from '../find/category/CategoryPage'
import { FocusPage } from '../find/focus/FocusPage'
import { TopicPage } from '../find/topic/TopicPage'
import { CommonTopBar } from '../views/CommonTopBar'

@Entry
@Component
export struct ContainerPage {
  @State containerType: string = "focus"
  @State title: string = ""
  aboutToAppear(){
    this.containerType=router.getParams()["containerType"];
    this.title=router.getParams()["title"];
  }

  build() {
    Column() {
      CommonTopBar({ title: this.title, alpha: 1, backButton: true, onBackClick: () => {
        router.back();
      } })
      Stack(){ //居中
        if (this.containerType == "focus") {
          FocusPage()
        } else if (this.containerType == "topic") {
          TopicPage()
        } else if (this.containerType == "category") {
          CategoryPage()
        } else {
          Text("页面丢失了~")
        }
      }.layoutWeight(1)
    }.width("100%").height("100%")
  }
  //
  // @Builder getContent() {
  //   if (this.containerType == "focus") {
  //     FocusPage()
  //   } else if (this.containerType == "topic") {
  //     TopicPage()
  //   } else if (this.containerType == "category") {
  //     CategoryPage()
  //   } else {
  //     Text("页面丢失了~")
  //   }
  // }
}