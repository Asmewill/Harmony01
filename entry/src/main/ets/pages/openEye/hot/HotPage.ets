import HotViewModel from '../viewmodel/HotViewModel';
import { CommonTopBar } from '../views/CommonTopBar'
import { RankPage } from './Rank/RankPage'

@Component
export struct HotPage {
  @State currentIndex: number = 0;
  controller: TabsController = new TabsController();

  build() {
    Column() {

      CommonTopBar({ title: "发现", alpha: 1, backButton: false })
      Stack({ alignContent: Alignment.TopStart }) {
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            RankPage({ rankType: HotViewModel.tabTitle[0].rankType })
          }.tabBar(this.TabBuilder(HotViewModel.tabTitle[0].index, HotViewModel.tabTitle[0].title))

          TabContent() {
            RankPage({ rankType: HotViewModel.tabTitle[1].rankType })
          }.tabBar(this.TabBuilder(HotViewModel.tabTitle[1].index, HotViewModel.tabTitle[1].title))

          TabContent() {
            RankPage({ rankType: HotViewModel.tabTitle[2].rankType })
          }.tabBar(this.TabBuilder(HotViewModel.tabTitle[2].index, HotViewModel.tabTitle[2].title))
        }
        .barHeight(50) //barHeight高度一定要和TabBuilder中控件的高度一致
        .barMode(BarMode.Fixed)
        .onChange((index => {
          this.currentIndex = index;
        }))
      }
    }
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
        .visibility(this.currentIndex == index ? Visibility.Visible : Visibility.Hidden)
        .lineCap(LineCapStyle.Round)
        .margin({ bottom: 0.5 })
    }
    .width("101%") //解决Tab连接处白线问题
    .height(50)
    .backgroundColor("#d81e06")
  }
}