import router from '@ohos.router'
import CommonConstants from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger';

const TAG = '[IndexPage]';
@Preview
@Entry
@Component
struct  IndexPage {
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
            }).catch((error: Error) => {
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

        Button("新闻数据加载---从网络获取数据")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/NewsPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("设置页面字体大小")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/FontSizePage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("闹钟")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/ClockPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("RelativeContainer布局")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/RelativeContainerPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("Stack布局")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/StackPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("Stack1布局")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/StackPage1", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("Flex布局")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/FlexPage", params: { param: "MultipleDialog" } })
              .catch((error: Error) => {
                Logger.info(TAG, "IndexPage push error" + JSON.stringify(error))
              })
          })

        Button("HarmonyOpenEye")
          .fontSize(16)
          .width("80%")
          .margin({ top: 10 })
          .onClick(() => {
            router.pushUrl({ url: "pages/openEye/SplashPage"})
          })

      }.width("100%").backgroundColor($r('app.color.page_bg'))
    }
  }
}


/****
 * export default命令用于指定模块的默认输出。
 * 显然，一个模块只能有一个默认输出，因此export default命令只能使用一次。
 * 所以，import命令后面才不用加大括号，因为只可能唯一对应export default
 * 区别：
 * 1.export与export default均可用于导出常量、函数、文件、模块等
 * 2.在一个文件或模块中，export、import可以有多个，export default仅有一个
 * 3.通过export方式导出，在导入时要加{ }，export default则不需要，并可以起任意名称
 * 4.输出多个值，使用export
 * 5.输出单个值，使用export default
 * 6.export default与普通的export不要同时使用
 */