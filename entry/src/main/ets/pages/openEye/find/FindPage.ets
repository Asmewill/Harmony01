import { LogUtils } from '../utils/LogUtils'
import FindViewModel from '../viewmodel/FindViewModel'
import { CommonTopBar } from '../views/CommonTopBar'
import { CategoryPage } from './category/CategoryPage'
import { FocusPage } from './focus/FocusPage'
import { TopicPage } from './topic/TopicPage'

@Component
export struct FindPage {

  private controller: TabsController = new TabsController()

  @Consume @Watch("onTabSelected") homeTabSelected:number

  @Provide findCurrentIndex: number = 0  //提供初始值
  onTabSelected(){
    LogUtils.debug("Find-onHomeTabSelected>>>",`${this.homeTabSelected}`)
  }
  build() {
    Column() {
      CommonTopBar({ title: "发现", alpha: 1, backButton: false })
      Stack({ alignContent: Alignment.TopStart }) {
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            FocusPage()
          }.tabBar(this.TabBuilder(FindViewModel.tabTitle[0].index, FindViewModel.tabTitle[0].title))

          TabContent() {
            CategoryPage()
          }.tabBar(this.TabBuilder(FindViewModel.tabTitle[1].index, FindViewModel.tabTitle[1].title))

          TabContent() {
            TopicPage()
          }.tabBar(this.TabBuilder(FindViewModel.tabTitle[2].index, FindViewModel.tabTitle[2].title))
        }
        .barHeight(50) //barHeight高度一定要和TabBuilder中控件的高度一致
        .barMode(BarMode.Fixed)
        .onChange((index => {
          this.findCurrentIndex = index;
        }))
      }
    }
    .width("100%")
    .height("100%")

  }

  @Builder
  TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor("#ffffff")
        .fontSize(15)
        .fontWeight(400)
        .height(45)
        .textAlign(TextAlign.Center)
        .flexGrow(1)
      Divider()
        .strokeWidth(4)
        .color("#ffffff")
        .width(50)
        .visibility(this.findCurrentIndex == index ? Visibility.Visible : Visibility.Hidden)
        .lineCap(LineCapStyle.Round).margin({bottom:0.5})
    }
    .width("101%") //解决Tab连接处白线问题
    .height(50)
    .backgroundColor("#d81e06")
  }
}