



export class RefreshConstant{

  static readonly REFRESH_STATE_TAG="refresh_state_tag"

  static readonly REFRESH_HEADER_HEIGHT = 50;

  static readonly REFRESH_EFFECTIVE_HEIGHT = 1.2 * RefreshConstant.REFRESH_HEADER_HEIGHT;

  static readonly REFRESH_LAYOUT_EXTRA_HEIGHT=0.1;

  static readonly REFRESH_HEADER_ANIM_DURATION=440;


}

export enum PageState{
  Loading=0,
  Success=1,
  Fail=2
}



export enum RefreshState{
  //<HarmonyOS第一课>从网络获取数据
  //新闻数据加载
  DropDown = 0,
  Release = 1,
  Refreshing = 2,
  Success = 3,
  Fail = 4,
  //<HarmonyOS第一课>给应用添加动画
  // 自定义下拉刷新动画（ArkTS）
  IDLE=5,
  DRAGGING=6,
  DRAGGING_REFRESHABLE=7,
  REFRESHING=8,
  COMPLETE=9,
}




export enum RefreshHeaderStyle{
  DEFAULT,
  CLOUD
}