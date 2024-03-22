import { ItemList, RankModel } from '../../model/RankModel'
import { RoutePath } from '../../route/RoutePath';
import Router from '../../route/Router';
import { RankViewModel } from '../../viewmodel/RankViewModel';
import { CommonTopBar } from '../../views/CommonTopBar'

@Component
export struct RankPage {
  rankType: string = "weekly"
  @State dataList: ItemList[] = []
  viewModel = new RankViewModel();

  aboutToAppear() {
    this.loadNet()
  }

  loadNet() {
    this.viewModel.getRankList(this.rankType, (rankModel: RankModel) => {
      this.dataList = rankModel.itemList;
    })
  }

  build() {
    Column() {
      List() {
        ForEach(this.dataList, (item: ItemList) => {
          ListItem() {
            Column() {
              Stack({ alignContent: Alignment.Top }) {
                Image(item.data?.cover?.feed)
                  .width("100%")
                  .height("100%")
                  .objectFit(ImageFit.Fill)
                  .borderRadius(10)
                  .onClick(() => {
                    Router.push(RoutePath.DetailPage, { playId: item?.data?.id, playUrl: item?.data?.playUrl })
                  });
                Text(item.data.category)
                  .width(50)
                  .height(25)
                  .border({ radius: { topLeft: 10, bottomRight: 10 } })
                  .fontColor(Color.White)
                  .fontSize(14)
                  .backgroundColor(Color.Red)
                  .textAlign(TextAlign.Center)
                  .position({ x: 0, y: 0 })
              }.width("100%").height(200)

              Row() {
                Image(item.data?.cover?.feed).width(40).height(40).borderRadius(20)
                Column() {
                  Text(item.data.author.name)
                    .fontColor(Color.Black)
                    .fontSize(14)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  Text(item.data.author.description)
                    .fontColor(Color.Grey)
                    .fontSize(12)
                    .margin({ top: 2 })
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }
                .layoutWeight(1)
                .height("100%")
                .justifyContent(FlexAlign.Center)
                .margin({ left: 10 })
                .alignItems(HorizontalAlign.Start)
              }
              .width("100%")
              .height(50)
              .alignItems(VerticalAlign.Center)
              .justifyContent(FlexAlign.Start)
            }.width("100%").height(250).justifyContent(FlexAlign.Start)
          }.padding(10)
        })

      }
    }.height("100%").width("100%").padding({ bottom: 100 })

  }
}