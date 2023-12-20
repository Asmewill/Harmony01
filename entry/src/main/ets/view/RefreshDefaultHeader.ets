import { RefreshConstant, RefreshState } from '../common/constants/RefreshConstants';

@Component
export default struct RefreshDefaultHeader {
  @State refreshTitle: string = "下拉刷新";
  @Consume(RefreshConstant.REFRESH_STATE_TAG) @Watch("onStateCheck") state: number;

  private onStateCheck() {
    switch (this.state) {
      case RefreshState.IDLE:
        this.refreshTitle = "下拉刷新..."
        break;
      case RefreshState.DRAGGING_REFRESHABLE:
        this.refreshTitle = "松开刷新..."
        break
      case RefreshState.REFRESHING:
        this.refreshTitle = "正在刷新..."
        break;
    }
  }

  build() {
    if (this.state !== RefreshState.IDLE) {
      Text(this.refreshTitle)
        .height("100%")
        .width("100%")
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .onAppear(() => {
           this.onStateCheck();
        })
    }
  }
}