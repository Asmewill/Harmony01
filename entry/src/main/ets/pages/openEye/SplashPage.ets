
import router from '@ohos.router'
import { RoutePath } from './route/RoutePath'

@Entry
@Component
export struct SplashPage{
  aboutToAppear(){
    setTimeout(()=>{
      router.replaceUrl({url:RoutePath.MainPage})
    },100)
  }

  build(){
    Stack(){
      Image($r("app.media.landing_image")).objectFit(ImageFit.ScaleDown)
    }.width("100%").height("100%")
  }
}