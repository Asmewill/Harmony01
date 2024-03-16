import emitter from '@ohos.events.emitter';
import { LoadingDialog } from './dialog/LoadingDialog';
import { EventId, EventKeys } from './event/EventKeys';
import LoadingEvent from './event/LoadingDialogEvent';
import { FindPage } from './find/FindPage';
import { HomePage } from './home/HomePage';
import { HotPage } from './hot/HotPage';
import { MinePage } from './mine/MinePage';
import { TabItem } from './model/TabItem';
import mainMainViewModel from './viewmodel/MainViewModel';

@Entry
@Component
export struct MainPage {
  @State selectedIndex: number = 0;
  @State loadingShow:boolean=false;
  @Provide homeTabSelected:number=0; //Provide  提供初始值  配合Consume  Watch 一起使用
  //全局loading
  loadingDialogController:CustomDialogController=new CustomDialogController({
    builder:LoadingDialog({loadingTips:"loading...."}),
    autoCancel:true,
    gridCount: 2,
    cancel:()=>{
      this.loadingShow=false;
    }
  })

  aboutToAppear(){
    emitter.on(EventId,(event:LoadingEvent)=>{
      if(event.data.showLoading==true&&!this.loadingShow){
        this.loadingShow=true;
        this.loadingDialogController.open();
      }else{
        this.loadingShow=false;
        this.loadingDialogController.close();
      }
    })

  }
  aboutToDisappear(){
    this.loadingDialogController=null
    emitter.off(EventKeys.LOADING_DIALOG_EVENT)
  }

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End,
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.TabBottom(mainMainViewModel.tabTitle[0], 0))

        TabContent() {
          FindPage()
        }.tabBar(this.TabBottom(mainMainViewModel.tabTitle[1], 1))

        TabContent() {
          HotPage()
        }.tabBar(this.TabBottom(mainMainViewModel.tabTitle[2], 2))

        TabContent() {
          MinePage()
        }.tabBar(this.TabBottom(mainMainViewModel.tabTitle[3], 3))
      }
      .barWidth("100%")
      .barHeight(56)
      .scrollable(false)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.selectedIndex = index;
        this.homeTabSelected=index;
      })
    }
  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex === index ? item.imageActivated : item.imageOriginal)
        .height(21)
        .width(21)
        .margin({ top: 8, bottom: 5 })
      Text(item.title)
        .fontSize(12)
        .margin({ bottom: 20 })
        .fontColor(this.selectedIndex === index ? "#d81e06" : Color.Grey)
    }
    .height("100%")
    .width("100%")
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor("#f5f5f5")
  }
}