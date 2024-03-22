import { RoutePath } from '../route/RoutePath'
import Router from '../route/Router'
import showToast from '../utils/ToastUtils'

@Preview
@Component
export struct MinePage {

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
        Router.push(RoutePath.ContainerPage, { containerType: "category",title:"分类" })
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
        Router.push(RoutePath.ContainerPage, { containerType: "category",title:"分类" })
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
        Router.push(RoutePath.ContainerPage, { containerType: "topic",title:"热门"})
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("CoordinateLayout").margin({ left: 10 })
      }.height(50).width("100%").justifyContent(FlexAlign.Start).padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.CoordinatePage)
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("HorizontalScroll1").margin({ left: 10 })
      }.height(50).width("100%").justifyContent(FlexAlign.Start).padding({ left: 10 })
      .onClick(() => {
        Router.push(RoutePath.TestHorizontalPage1)
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)

      Row() {
        Image($r("app.media.icon_topic")).width(25).height(25)
        Text("HorizontalScroll2").margin({ left: 10 })
      }.height(50).width("100%").justifyContent(FlexAlign.Start).padding({ left: 10 })
      .onClick(() => {
         Router.push(RoutePath.TestHorizontalPage2)
      })

      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
      Row() {
        Image($r("app.media.icon_about")).width(25).height(25)
        Text("关于").margin({ left: 10 })
      }.height(50).width("100%").justifyContent(FlexAlign.Start).padding({ left: 10 })
      .onClick(() => {
          showToast("关于")
      })
      Divider().strokeWidth(1).color(Color.Grey).opacity(0.1)
    }
    .width("100%").height("100%")

  }
}