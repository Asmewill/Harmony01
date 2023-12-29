import defaultAppManager from '@ohos.bundle.defaultAppManager'
import CommonConstants from '../common/constants/CommonConstants';
import { NewsData, NewsFile } from '../viewmodel/NewsViewModel'

@Entry
@Component
export default struct NewsItem {
  private newsData: NewsData = new NewsData();

  build() {
    Column() {
      Row() {
        Image($r("app.media.news")).width("11.9%").height(20).objectFit(ImageFit.Fill)
        Text(this.newsData.title)
          .fontSize(20)
          .fontColor("#000000")
          .width("78.6%")
          .maxLines(1)
          .margin({ left: 2 })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(500)
      }.alignItems(VerticalAlign.Center)
      .height(22).margin({
        top: 16,
        left: 10
      })

      Text(this.newsData.content)
        .fontSize(16)
        .fontColor("#000000")
        .height(50)
        .width("93%")
        .maxLines(2)
        .margin({ left: 10, top: 10 })
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Grid() {
        ForEach(this.newsData.imagesUrl, (itemImg: NewsFile) => {
          GridItem() {
            Image(CommonConstants.SERVER + itemImg.url)
              .objectFit(ImageFit.Cover)
              .borderRadius(12)
          }
        })
      }
      .columnsTemplate("1fr".repeat(this.newsData.imagesUrl.length))
      .columnsGap(5)
      .rowsTemplate("1fr")
      .width("93%")
      .height(100)
      .margin({ left: 10, top: 10, right: 10 })

      Text(this.newsData.source).margin({left:10,top:10})

    }.alignItems(HorizontalAlign.Start)

  }
}