import router from '@ohos.router'
import { ItemList, TopDetailModel } from '../model/TopDetailModel'
import { LogUtils } from '../utils/LogUtils'

import TopicDetailViewModel from '../viewmodel/TopicDetailViewModel'
import { CommonTopBar } from '../views/CommonTopBar'
import { VideoComponent } from '../views/VideoComponent'


@Entry
@Component
struct TopicDetailPage {
  @State playUrl: string = ""
  @State topicId: number = -1;
  @State title: string = "广告";
  @State dataList: ItemList[] = [];
  @State headerImage: string = ""
  @State headerText: string = ""
  @State playIndex: number = -1;

  aboutToAppear() {
    this.loadNet()
  }

  loadNet() {
    this.topicId = router.getParams()["topicId"]
    TopicDetailViewModel.getTopicDetailList(this.topicId, (result: TopDetailModel) => {
      this.title = result.brief;
      this.headerText = result.text;
      this.dataList = result.itemList;
      this.headerImage = result.headerImage;
    })
  }

  build() {
    Column() {
      CommonTopBar({ title: this.title, alpha: 1, backButton: true, onBackClick: () => {
        router.back();
      } })
      List() {
        ListItem() {
          Column() {
            Image(this.headerImage).width("100%").height(200)
            Text(this.title)
              .fontSize(16)
              .width("80%")
              .height(46)
              .backgroundColor(Color.White)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .textAlign(TextAlign.Center)
              .borderWidth(1)
              .borderColor(Color.Grey)
              .margin({ top: -23 })
              .maxLines(1)
          }.width("100%").height(224)
        }

        ForEach(this.dataList, (item: ItemList, index: number) => {
          ListItem() {
            Column() {
              Text(this.title)
                .fontSize(14)
                .fontColor(Color.Black)
                .margin(10)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(this.headerText)
                .fontSize(14)
                .fontColor(Color.Black).margin(10).textOverflow({ overflow: TextOverflow.Ellipsis })
              Stack() {
                if (this.playIndex === index) {
                  VideoComponent({ playUrl: $playUrl, showControls: true })
                } else {
                  Image(item.data.content.data.cover.feed).width("100%").height("100%").objectFit(ImageFit.Fill)
                  Image($r("app.media.icon_play")).width(50).height(50).onClick(() => {
                    this.playIndex = index;
                    this.playUrl = item.data.content.data.playUrl;
                  })
                }
              }.width("100%").height(200)
            }
          }
        })
      }.onScrollIndex((firstIndex: number, lastIndex: number) => {
        LogUtils.debug("ScrollIndex","firstIndex:"+firstIndex+">>>>>"+"lastIndex:"+lastIndex)
        //当划过正在播放的视频时，就停止播放
        if(this.playIndex>lastIndex||this.playIndex<firstIndex){
          this.playIndex=-1;
        }
      })
    }
  }
}