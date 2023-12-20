import RefreshComponent from '../view/RefreshComponent';
import { RefreshConstant, RefreshHeaderStyle, RefreshState } from '../common/constants/RefreshConstants';
import display from '@ohos.display';
import { GlobalContext } from '../common/utils/GlobalContext';

const TAG = '[MultipleDialogPage]';

@Entry
@Component
struct RefreshPage {
  @Provide(RefreshConstant.REFRESH_STATE_TAG) state:number=RefreshState.REFRESHING;
  private deviceDisplay:display.Display=GlobalContext.getContext().getObject("display") as display.Display;

  @Builder
  ContentBody(){
    Image($r("app.media.bg_content"))
      .width("100%")
      .height(626)
      .objectFit(ImageFit.Fill)

  }

  build(){
    Stack({alignContent:Alignment.Top}){
      Text("云空间")
        .backgroundColor(Color.White)
        .width("100%")
        .height(56).fontSize(20).fontWeight(FontWeight.Regular)
        .padding({left:24}).zIndex(1)
      RefreshComponent({
        headerStyle:RefreshHeaderStyle.CLOUD,
        itemLayout:()=>{
          this.ContentBody();
        },
        displayHeight:(px2vp(this.deviceDisplay.height) -56),  //屏幕高度减去Text("云空间")高度
        onRefresh:()=>{
          setTimeout(()=>{
            this.state = RefreshState.COMPLETE;
          },3000);
        }
      }).width("100%").margin({top:56})
    }
  }

}
