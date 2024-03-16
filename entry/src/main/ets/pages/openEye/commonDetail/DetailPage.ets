import router from '@ohos.router';
import showToast from '../utils/ToastUtils';
import { CommonTopBar } from '../views/CommonTopBar'
import { VideoBottomComponent } from '../views/VideoBottomComponent';
import { VideoComponent } from '../views/VideoComponent';

@Entry
@Component
struct DetailPage {
  playId: string = "";
  @State playUrl: string = "";
  @State showControl: boolean = true;

  aboutToAppear() {
    this.playUrl = router.getParams()["playUrl"];
    this.playId = router.getParams()["playId"];
   // showToast("playId:" + this.playId + ",playUrl：" + this.playUrl);
  }

  build() {
    Column() {
      CommonTopBar({ title: "视频详情", alpha: 1, onBackClick: () => {
        router.back()
      } })
      VideoComponent({ playUrl: $playUrl, showControls: this.showControl, isAutoPlay: true, isShowLoading: true })
        .width("100%")
        .height(250)
      VideoBottomComponent({ playId: this.playId, onItemClick: (playUrl: string) => {
        this.playUrl=playUrl;
      } }).layoutWeight(1)
    }
    .width("100%")
    .height("100%")

  }
}





