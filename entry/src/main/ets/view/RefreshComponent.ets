import display from '@ohos.display';
import { RefreshConstant, RefreshHeaderStyle, RefreshState } from '../common/constants/RefreshConstants';
import { GlobalContext } from '../common/utils/GlobalContext';
import ClassifyModel from '../viewmodel/AnimationMode';
import RefreshAnimHeader from './RefreshAnimHeader';
import RefreshDefaultHeader from './RefreshDefaultHeader';


@Component
export default struct RefreshComponent {


  private headerStyle: RefreshHeaderStyle = RefreshHeaderStyle.DEFAULT; //下拉刷新的样式
  private displayHeight: number = 0; //list显示的长度
  @State headerOffset: number = 0; //list与顶部的距离
  private listController: Scroller = new Scroller();
  @Consume(RefreshConstant.REFRESH_STATE_TAG) @Watch('onStateChanged') state: number; //下拉状态
  @BuilderParam itemLayout?: () => void; //listItem UI
  private onRefresh?: () => void; //下拉刷新调用

  /****
   * @Watch应用于对状态变量的监听。
   * 如果开发者需要关注某个状态变量的值是否改变，
   * 可以使用@Watch为状态变量设置回调函数。
   */
  private onStateChanged() {
    switch (this.state) {
      case RefreshState.REFRESHING://正在刷新
      //正在刷新就调用onRefresh()方法
        if (this.onRefresh !== undefined) {
          this.onRefresh();
        }
        break;
      case RefreshState.COMPLETE://刷新完成
       //如果刷新完成，headerOffset变成-50
        this.headerOffset = -RefreshConstant.REFRESH_HEADER_HEIGHT;
        break;
    }
  }
  aboutToAppear(){
    if(this.state===RefreshState.REFRESHING){
      this.headerOffset=0;
      this.onStateChanged();
    }else{
      this.state=RefreshState.IDLE;
      this.headerOffset = -RefreshConstant.REFRESH_HEADER_HEIGHT;
    }
    this.displayHeight = RefreshConstant.REFRESH_HEADER_HEIGHT+this.displayHeight;
  }

  build() {
    List({ scroller: this.listController }) {
      ListItem() {
        Column() {
          //默认下拉刷新
          if (this.headerStyle === RefreshHeaderStyle.DEFAULT) {
            RefreshDefaultHeader().height(RefreshConstant.REFRESH_HEADER_HEIGHT)
          } else if (this.headerStyle === RefreshHeaderStyle.CLOUD) { //水果下拉刷新
            RefreshAnimHeader().height(RefreshConstant.REFRESH_HEADER_HEIGHT)
          }
          if (this.itemLayout !== undefined) {
            this.itemLayout();
          }
        }.width("100%")
        .height(this.displayHeight + RefreshConstant.REFRESH_LAYOUT_EXTRA_HEIGHT) //displayHeight+0.1
      }
    }
    .edgeEffect(EdgeEffect.Spring)
    .width("100%")
    .height(this.displayHeight)
    .listDirection(Axis.Vertical)
    .offset({ y: this.headerOffset })
    .animation({
      curve: Curve.Smooth,
      duration: 440,
      playMode: PlayMode.Normal,
      onFinish: () => {
        //判断headerOffset===-50
        if (this.headerOffset === -RefreshConstant.REFRESH_HEADER_HEIGHT) {
          this.state = RefreshState.IDLE;
        }
      }
    })
    .onTouch((event?: TouchEvent) => {
      if (event == null) {
        return;
      }
      switch (event.type) {
        case TouchType.Down:
          if(this.state===RefreshState.IDLE){
            this.state=RefreshState.DRAGGING;//1
          }
          break;
        case TouchType.Move://yOffset没有任何提示
          if(this.state==RefreshState.DRAGGING
          &&this.listController.currentOffset().yOffset<=-RefreshConstant.REFRESH_EFFECTIVE_HEIGHT){//-50*1.2
            this.state=RefreshState.DRAGGING_REFRESHABLE;
          }
          break;
        case TouchType.Up:
          if(this.state===RefreshState.DRAGGING_REFRESHABLE){
            this.headerOffset=0;
            this.state=RefreshState.REFRESHING;//正在刷新中
          }
          break;
        default:
          break;
      }
    })
  }
}