
import router from '@ohos.router'
import CommonConstants from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger';

const  TAG='[IndexPage]';

@Entry
@Component
struct Index {
  @State message: string = CommonConstants.INDEX_MESSAGE

  build() {
    Row() {

      Column(){
        // Text(this.message)
        //   .fontSize(CommonConstants.FONT_SIZE)
        //   .fontWeight(FontWeight.Bold)
        // Blank()
        Button("IndexPage---Router跳转")
          .fontSize("16fp")
          .width("296vp")
          .height("40vp")
          .backgroundColor($r("app.color.button_bg"))
          .onClick(()=>{
            router.pushUrl({
              url:"pages/SecondPage",
              params:{
                src:"Index页面传来的数据"
              }
            })
            .catch((error:Error)=>{
              Logger.info(TAG,'IndexPage push error'+JSON.stringify(error))
            });
        })
        Button("从简单页面开始---登录")
          .fontSize(16)
          .width(296)
          .margin({top:10})
          .onClick(()=>{
              router.pushUrl({url:"pages/LoginPage",params:{param:"login"}})
                .catch((error:Error)=>{
                  Logger.info(TAG,"IndexPage push error"+JSON.stringify(error))
                })
          })
      }.width("100%").height("140vp")

    }.height('100%')
    .backgroundColor($r('app.color.page_bg'))
  }
}