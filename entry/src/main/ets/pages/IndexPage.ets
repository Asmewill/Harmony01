import router from '@ohos.router'
import CommonConstants from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger';

const TAG = '[IndexPage]';

@Entry
@Component
struct IndexPage {
  @State message: string = CommonConstants.INDEX_MESSAGE

  build() {
    Scroll() {
      Column() {
        Button("IndexPage---Router跳转")
          .fontSize("16fp")
          .width("80%")
          .height("40vp")
          .backgroundColor($r("app.color.button_bg"))
          .margin({top:10})
          .onClick(() => {
            router.pushUrl({
              url: "pages/SecondPage",
              params: {
                src: "Index页面传来的数据"
              }
            })
              .catch((error: Error) => {
                Logger.info(TAG, 'IndexPage push error' + JSON.stringify(error))
              });
          })

        Button("从简单页面开始---登录")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/LoginPage", params: { param: "login" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("构建更加丰富的页面---弹窗")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/MultipleDialogPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })


        Button("给应用添加下拉刷新动画(ArkTS)")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/RefreshPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

      }.width("100%").backgroundColor($r('app.color.page_bg'))

    }

  }
}