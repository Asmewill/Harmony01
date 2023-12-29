
import { PageState, RefreshState } from '../common/constants/RefreshConstants';
import { NewsData } from './NewsViewModel'


export default class NewsModel{
   newsData:Array<NewsData>=[];
   currentPage:number=1;
   pageSize:number = 4;
   pullDownRefreshText:Resource=$r("app.string.pull_down_refresh_text");
   pullDownRefreshImage:Resource=$r("app.media.ic_pull_down_refresh");
   pullDownRefreshHeight:number = 70;
   isVisiblePullDown:boolean=false;
   pullUpLoadText:Resource=$r("app.string.pull_up_load_text");
   pullUpLoadImage:Resource=$r("app.media.ic_pull_up_load");
   pullUpLoadHeight:number= 70;
   isVisiblePullUpLoad:boolean=false;
   offsetY:number=0;
   pageState:number= PageState.Loading;
   hasMore:boolean=true;
   startIndex=0;
   endIndex=0;
   downY=0;
   lastMoveY=0;
   isRefreshing:boolean=false;
   isCanRefresh=false;
   isPullRefreshOperation:boolean=false;
   isLoading:boolean=false;
   isCanLoadMore:boolean=false;
}