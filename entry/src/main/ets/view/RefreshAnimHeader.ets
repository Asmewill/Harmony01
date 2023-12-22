
import display from '@ohos.display';
import CommonConstants from '../common/constants/CommonConstants';
import { RefreshConstant, RefreshState } from '../common/constants/RefreshConstants'
import DimensionUtil from '../common/utils/DimensionUtil';
import { GlobalContext } from '../common/utils/GlobalContext';
import ClassifyModel from '../viewmodel/AnimationMode';

@Component
export default struct RefreshAnimHeader{

  @Consume(RefreshConstant.REFRESH_STATE_TAG) @Watch("onStateCheck") state:number;

  @State iconWidth:number= 30;

  private deviceDisplay:display.Display=GlobalContext.getContext().getObject("display") as display.Display;

  private IMAGE_MODEL_ARRAY:ClassifyModel[];
  aboutToAppear(){
    this.IMAGE_MODEL_ARRAY= [
      new ClassifyModel($r("app.media.ic_loading_game"),  (px2vp(this.deviceDisplay.width)/2 - 30/2)-100,400),
      new ClassifyModel($r("app.media.ic_loading_heart"), (px2vp(this.deviceDisplay.width)/2 - 30/2)-50,400),
      new ClassifyModel($r("app.media.ic_loading_louder"),(px2vp(this.deviceDisplay.width)/2 - 30/2)-0,400),
      new ClassifyModel($r("app.media.ic_loading_bag"),   (px2vp(this.deviceDisplay.width)/2 - 30/2)+50,400),
      new ClassifyModel($r("app.media.ic_loading_file"),  (px2vp(this.deviceDisplay.width)/2 - 30/2)+100,400),
    ];
  }



  private onStateCheck(){
    if(this.state===RefreshState.REFRESHING){//正在刷新
      this.iconWidth=80;
    }else{
      this.iconWidth=30
    }
  }

  @Builder
  AttrAnimIcons(iconItem:ClassifyModel){
    Image(iconItem.imgRes).width(px2vp(DimensionUtil.adaptDimension(this.iconWidth)))
      .position({x:iconItem.posX})
      .objectFit(ImageFit.Contain).animation({
      duration:2000,
      tempo:3.0,//速度-节奏
      delay:iconItem.delay,//400
      curve:Curve.Linear,//线性的
      playMode:PlayMode.Alternate,//候补
      iterations:-1,//重复进行，迭代
    })
  }

  build(){
    Row(){
      if(this.state !==RefreshState.IDLE){ // stop animation when idle state.
        ForEach(this.IMAGE_MODEL_ARRAY,(item:ClassifyModel)=>{
            this.AttrAnimIcons(item)
        })
      }
    }
    .width("100%")
    .height("100%")
    .onAppear(()=>{
      this.onStateCheck();
    })
  }

}