import { beforeEach } from '@ohos/hypium';
import promptAction from '@ohos.promptAction';
import NewsModel from '../../viewmodel/NewsModel';
import { RefreshState } from '../constants/RefreshConstants';
import { touchMoveLoadMore, touchUpLoadMore } from './PullUpLoadMore';
import NewsViewModel, { NewsData } from '../../viewmodel/NewsViewModel';
import CommonConstants from '../constants/CommonConstants';

export   function listTouchEvent(newsModel: NewsModel, event: TouchEvent) {

  switch (event.type) {
    case TouchType.Down:
      newsModel.downY = event.touches[0].y;
      newsModel.lastMoveY = event.touches[0].y;
      break;
    case TouchType.Move:
      if ((newsModel.isRefreshing === true) || newsModel.isLoading === true) {
        return;
      }
      let isDownPull = event.touches[0].y - newsModel.lastMoveY > 0;
      if ((isDownPull === true || newsModel.isPullRefreshOperation === true)
      && (newsModel.isCanLoadMore === false)) {
        touchMovePullRefresh(newsModel, event)
      } else {
        touchMoveLoadMore(newsModel, event);
      }
      newsModel.lastMoveY=event.touches[0].y;
      break;
    case TouchType.Up:
    //如果正在刷新或者正在loading
      if (newsModel.isRefreshing === true || newsModel.isLoading === true) {
        return;
      }
      if (newsModel.isPullRefreshOperation === true) {
        touchUpPullRefresh(newsModel);
      } else {
        touchUpLoadMore(newsModel);
      }
      break;
    default:
      break;
  }
}

export function touchUpPullRefresh(newsModel: NewsModel) {
  if (newsModel.isCanRefresh === true) {
    newsModel.offsetY = vp2px(newsModel.pullDownRefreshHeight);
    pullRefreshState(newsModel, RefreshState.Refreshing);
    newsModel.currentPage = 1;
    setTimeout(() => {
      let self: NewsModel = newsModel;
      NewsViewModel.getNewsList(newsModel.currentPage,newsModel.pageSize,CommonConstants.GET_NEWS_LIST)
        .then((data:NewsData[])=>{
          if(data.length===newsModel.pageSize){
            self.hasMore=true;
            self.currentPage++;
          }else{
            self.hasMore=false;
          }
          self.newsData=data;
          closeRefresh(self,true)
        }).catch((error:Error)=>{
           promptAction.showToast({message:JSON.stringify(error)})
           closeRefresh(self,false);
      })
    }, 1000)
  } else {
    closeRefresh(newsModel, false);
  }
}


export function touchMovePullRefresh(newsModel: NewsModel, event: TouchEvent) {
  if (newsModel.startIndex === 0) {
    newsModel.isPullRefreshOperation = true;
    let height = vp2px(newsModel.pullDownRefreshHeight);
    newsModel.offsetY = event.touches[0].y - newsModel.downY;

    if (newsModel.offsetY >= (height/2)) {
      pullRefreshState(newsModel, RefreshState.Release);
      newsModel.offsetY = height + newsModel.offsetY* 0.1;
    } else {
      pullRefreshState(newsModel, RefreshState.DropDown)
    }
    if (newsModel.offsetY < 0) {
      newsModel.offsetY = 0;
      newsModel.isPullRefreshOperation = false;
    }
  }
}

export function pullRefreshState(newsModel: NewsModel, state: number) {
  switch (state) {
    case RefreshState.DropDown: //下拉
      newsModel.pullDownRefreshText = $r("app.string.pull_down_refresh_text");
      newsModel.pullDownRefreshImage = $r("app.media.ic_pull_down_refresh");
      newsModel.isCanRefresh = false;
      newsModel.isRefreshing = false;
      newsModel.isVisiblePullDown = true;//显示拉刷新View
      break;
    case RefreshState.Release: //释放
      newsModel.pullDownRefreshText = $r("app.string.release_refresh_text")
      newsModel.pullDownRefreshImage = $r("app.media.ic_pull_up_refresh")
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = false;
      break;
    case RefreshState.Refreshing: //正在刷新
      newsModel.offsetY = vp2px(newsModel.pullDownRefreshHeight);
      newsModel.pullDownRefreshText = $r("app.string.refreshing_text");
      newsModel.pullDownRefreshImage = $r("app.media.ic_pull_up_load");
      newsModel.isCanRefresh = true;
      newsModel.isCanRefresh = true;
      break;
    case RefreshState.Success: //刷新成功
      newsModel.pullDownRefreshText = $r("app.string.refresh_success_text");
      newsModel.pullDownRefreshImage = $r("app.media.ic_succeed_refresh");
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    case RefreshState.Fail: //刷新失败
      newsModel.pullDownRefreshText = $r("app.string.refresh_fail_text");
      newsModel.pullDownRefreshImage = $r("app.media.ic_fail_refresh");
      newsModel.isCanRefresh = true;
      newsModel.isRefreshing = true;
      break;
    default:
      break;
  }

}

function closeRefresh(newsModel: NewsModel, isRefreshSuccess: boolean) {
  let self = newsModel;
  setTimeout(() => {
    let delay =50;
    if (self.isCanRefresh === true) {
      pullRefreshState(newsModel, isRefreshSuccess ? RefreshState.Success : RefreshState.Fail)
      delay = 500;
    }
    animateTo({
      duration: 150,
      delay: delay,
      onFinish: () => {
        pullRefreshState(newsModel,RefreshState.DropDown);
        self.isVisiblePullDown=false; //隐藏下拉刷新View
        self.isPullRefreshOperation=false;
      }
    }, () => {
      self.offsetY = 0;
    })
  }, self.isCanRefresh ? 300 : 0)


}
