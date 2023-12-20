import router from '@ohos.router'
import CommonConstants from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger';
import Home from '../view/Home';
import Setting from '../view/Setting';

const TAG = '[IndexPage]';

@Entry
@Component
struct MainPage {
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  private tabsController: TabsController = new TabsController();

  @Builder tabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex == index ? selectedImg : normalImg)
        .width(25).height(25)
      Text(title).margin({ top: 7 })
        .fontSize(10)
        .fontColor(this.currentIndex==index ? $r("app.color.mainPage_selected") : $r("app.color.mainPage_normal"))
    }.height(56).width("100%").justifyContent(FlexAlign.Center).onClick(() => {
      this.currentIndex=index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      TabContent() {
        Home()
      }
     // .tabBar("首页")
      .tabBar(this.tabBuilder("首页", 0, $r("app.media.home_selected"), $r("app.media.home_normal")))
      TabContent() {
        Setting()
      }
     // .tabBar("我的")
      .tabBar(this.tabBuilder("我的", 1, $r("app.media.mine_selected"), $r("app.media.mine_normal")))
    }
    .width("100%")
    .backgroundColor(Color.White)
    .barHeight(56)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}