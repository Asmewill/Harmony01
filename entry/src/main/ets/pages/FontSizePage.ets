import promptAction from '@ohos.promptAction'
import router from '@ohos.router'
import Logger from '../common/utils/Logger'

let TAG: string = "FontSizePage"

@Entry
@Component
export default struct FontSizePage {
  build() {
    Column() {
      Text("设置")
        .alignSelf(ItemAlign.Start)
        .height(48)
        .margin({ left: 25 })
        .fontSize(22)
        .fontColor(Color.Black)

      Row() {
        Image($r("app.media.ic_display_and_brightness")).width(20).height(20).margin({ left: 12 })
        Text("显示和亮度").margin({ left: 10 }).fontColor(Color.Black)
      }
      .width("94%")
      .backgroundColor(Color.White)
      .height(48)
      .borderRadius(24)
      .margin({ top: 10 })
      .onClick(() => {
        promptAction.showToast({ message: "显示和亮度" })
      })

      Row() {
        Image($r("app.media.ic_voice")).width(20).height(20).margin({ left: 12 })
        Text("声音").margin({ left: 10 }).fontColor(Color.Black)
      }
      .width("94%")
      .backgroundColor(Color.White)
      .height(48)
      .borderRadius(24)
      .margin({ top: 10 })
      .onClick(() => {
        promptAction.showToast({ message: "声音" })
      })

      Column() {
        Row() {
          Image($r("app.media.ic_app_management")).width(20).height(20).margin({ left: 12 })
          Text("应用管理").margin({ left: 10 }).fontColor(Color.Black)
        }
        .width("100%")
        .backgroundColor(Color.White)
        .height(48)
        .borderRadius({ topLeft: 24, topRight: 24 })
        .onClick(() => {
          promptAction.showToast({ message: "应用管理" })
        })

        Row() {
          Image($r("app.media.ic_storage")).width(20).height(20).margin({ left: 12 })
          Text("存储").margin({ left: 10 }).fontColor(Color.Black)
        }.width("100%").backgroundColor(Color.White).height(48)
        .onClick(() => {
          promptAction.showToast({ message: "存储" })
        })

        Row() {
          Image($r("app.media.ic_privacy")).width(20).height(20).margin({ left: 12 })
          Text("隐私").margin({ left: 10 }).fontColor(Color.Black)
        }.width("100%").backgroundColor(Color.White).height(48)
        .onClick(() => {
          promptAction.showToast({ message: "隐私" })
        })

        Row() {
          Image($r("app.media.ic_setting_the_font_size")).width(20).height(20).margin({ left: 12 })
          Text("设置字体大小").margin({ left: 10 }).fontColor(Color.Black)
        }
        .width("100%")
        .backgroundColor(Color.White)
        .height(48)
        .borderRadius({ bottomLeft: 24, bottomRight: 24 })
        .onClick(() => {
          router.pushUrl({ url: "pages/SetFontSizePage", params: { param: "SetFontSizePage" } })
            .catch((error: Error) => {
              Logger.info("FontSizePage", "error:" + JSON.stringify(error))
            })
        })
      }
      .margin({ top: 10 })
      .width("94%")
      .height(192)
      .borderRadius(24)
      .backgroundColor(Color.White)

    }
    .width("100%")
    .height("100%").backgroundColor($r('sys.color.ohos_id_color_sub_background'))
  }

  //1-aboutToAppear
  aboutToAppear() {
    Logger.info(TAG, "1-aboutToAppear")
  }

  //2-build()

  //3-onPageShow
  onPageShow(){
    Logger.info(TAG, "3-onPageShow")
  }

  //4-onBackPress
  onBackPress(){
    Logger.info(TAG, "4-onBackPress")
  }

  //5-onPageHide()
  onPageHide(){
    Logger.info(TAG, "5-onPageHide")
  }

  //6-aboutToDisappear()
  aboutToDisappear(){
    Logger.info(TAG, "6-aboutToDisappear")
  }

}