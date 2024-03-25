import { RoutePath } from '../route/RoutePath'
import Router from '../route/Router'
import showToast from '../utils/ToastUtils'
import { CommonDialog } from '../views/CommonDialog'

@Preview
@Component
export struct MinePage {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CommonDialog({ title: "关于",
      content: "" +
      "该项目是基于鸿蒙HarmonyOS " +
      "Api9版本开发的开眼App（主要使用ArkTs+ArkUI开发）" +
      "，主要用来学习和了解HarmonyOS开发App的使用方式；" +
      "项目封装了基本的网络请求以及页面网络状态管理等，" +
      "也封装了部分基础组件和基础组件的使用范例供大家参考借鉴，" +
      "如果大佬们有好的实现方式也请不吝赐教！！！",
      sure: "确定", cancel: "取消" }),
    autoCancel: true,
    gridCount: 4
  })

  aboutToDisappear() {
    this.dialogController = null
  }

  build() {
    Column() {
      Column() {
        Image($r("app.media.default_avatar")).width(70).height(70).borderRadius(25)
        Text("Harmony-开眼App").fontSize(16).fontColor(Color.White).margin({ top: 10 })
      }
      .width("100%")
      .height(250)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .backgroundImage($r("app.media.back_mine"))

      Row() {
        Image($r("app.media.icon_focus")).width(25).height(25)
        Text("关注").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.ContainerPage, { containerType: "category", title: "分类" })
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_type")).width(25).height(25)
        Text("分类").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.ContainerPage, { containerType: "category", title: "分类" })
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("热门").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.ContainerPage, { containerType: "topic", title: "热门" })
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("CoordinateLayout").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.CoordinatePage)
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("HorizontalScroll1").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.TestHorizontalPage1)
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)

      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("HorizontalScroll2").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.TestHorizontalPage2)
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_about")).width(25).height(25)
        Text("关于").margin({ left: 10 })
      }
      .height(50)
      .width("100%")
      .justifyContent(FlexAlign.Start)
      .padding({ left: 10 })
      .onClick(() => {
        this.dialogController.open();
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
    }
    .width("100%").height("100%")

  }
}