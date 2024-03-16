import { ViewStateConstant } from '../../../common/constants/ViewStateConstant';
import { CommonSkeleton } from './CommonSkeleton';


@Component
export struct StateComponent {
  //@prop修饰的变量必须使用父组件提供的@State变量进行初始化，允许组件内部修改@Prop 变量值但不会通知父组件
  @Prop viewState: string;


  @BuilderParam viewContent: () => void;
  //是否是骨架屏幕
  private showSkeleton: boolean = false;

  private  retryCallback:()=>void;

  build() {
    Stack() {
      if (this.viewState != ViewStateConstant.VIEW_STATE_SUCCESS) {
        this.holderContent();
      } else {
        this.viewContent();
      }
    }
  }

  @Builder
  holderContent() {
    if (this.showSkeleton && this.viewState == ViewStateConstant.VIEW_STATE_LOADING) {
         CommonSkeleton()
    } else {
      //重试
      Column() {
        Image(this.convertImage())
          .width(100).height(100)
        Text(this.convertValue())
          .fontSize(15).fontColor("#666666")
          .margin({top:10})
        if(this.viewState!=ViewStateConstant.VIEW_STATE_LOADING){
          Button(this.convertValue())
            .width(120).height(35)
            .backgroundColor("#d81e06")
            .fontColor("#ffffff")
            .onClick(()=>{
              this.retryCallback?.();
            })
        }
      }
    }
  }
  /***
   * 根据状态文字
   */
  convertValue() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return "加载中"
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return "加载数据异常"
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return "网络错误"
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return "暂无数据"
        break
      default:
        return "加载成功"
        break;
    }
  }


  /***
   * 根据状态返回图片
   */
  convertImage() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.media.loading')
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r("app.media.common_empty_content")
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r("app.media.timeout")
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r("app.media.common_empty_content")
        break
      default:
        return $r('app.media.loading')
        break;
    }

  }
}