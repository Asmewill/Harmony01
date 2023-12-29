import promptAction from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
import { PageState } from '../common/constants/RefreshConstants';
import {listTouchEvent} from '../common/utils/PullDownRefresh';
import NewsModel from '../viewmodel/NewsModel';
import NewsViewModel, { LayoutItem, NewsData } from '../viewmodel/NewsViewModel';
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';
import LoadMoreLayout from './LoadMoreLayout';
import NewsItem from './NewsItem';
import RefreshLayout from './RefreshLayout';

@Component
export default struct NewsList {
  @State newsModel: NewsModel = new NewsModel();
  @Watch("changeCategory") @Link currentIndex: number;

  changeCategory() {
    this.newsModel.currentPage = 1;
    NewsViewModel.getNewsList(this.newsModel.currentPage, this.newsModel.pageSize, CommonConstants.GET_NEWS_LIST)
      .then((data: NewsData[]) => {
        this.newsModel.pageState = PageState.Success;
        if (data.length === this.newsModel.pageSize) {
          this.newsModel.currentPage++;
          this.newsModel.hasMore = true;
        } else {
          this.newsModel.hasMore = false;
        }
        this.newsModel.newsData = data;
      })
      .catch((error: string | Resource) => {
        promptAction.showToast({
          message: error,
          duration: 2000
        });
        this.newsModel.pageState = PageState.Fail;
      })
  }

  aboutToAppear() {
    this.changeCategory();
  }

  build() {
    Column() {
      if (this.newsModel.pageState === PageState.Success) {
        this.ListLayout();
      } else if (this.newsModel.pageState === PageState.Loading) {
        this.LoadingLayout();
      } else {
        this.FailLayout();
      }
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
    .onTouch((event:TouchEvent)=>{
// 所有的对象都被当作 true。
// 当且仅当字符串为空时，该字符串被当作 false。
// null 和 undefined 被当作 false。
// 当且仅当数字为零（0）时，该数字被当作 false。
      if(event){
        if(this.newsModel.pageState===PageState.Success){
          //监听滑动，通过改变newsModel中的变量，
          // 隐藏下拉刷新头部或者上拉加载部分
         listTouchEvent(this.newsModel,event);
        }
      }
    })

  }

  @Builder LoadingLayout() {
    CustomRefreshLoadLayout({ layoutItem: new LayoutItem(
      true, $r("app.media.ic_pull_up_load"),
      $r("app.string.pull_up_load_text"),
      this.newsModel.pullDownRefreshHeight) })
  }


  @Builder ListLayout(){
    List(){
      //下拉刷新控件
      ListItem(){
        RefreshLayout({layoutItem:new LayoutItem(
          this.newsModel.isVisiblePullDown,this.newsModel.pullDownRefreshImage,
          this.newsModel.pullDownRefreshText,this.newsModel.pullDownRefreshHeight)})
      }
      //主List列表页面
      ForEach(this.newsModel.newsData,(item:NewsData)=>{
        ListItem(){
          NewsItem({ newsData: item });
        }.height(256).backgroundColor($r("app.color.white"))
        .margin({top:10})
        .borderRadius(12)
      })
      //上拉加载控件
      ListItem(){
        if(this.newsModel.hasMore){
          LoadMoreLayout({layoutItem:new LayoutItem(
            this.newsModel.isVisiblePullUpLoad,
            this.newsModel.pullUpLoadImage,
            this.newsModel.pullUpLoadText,
            this.newsModel.pullUpLoadHeight)})
        }else{
          Row() {
            Text($r('app.string.prompt_message'))
              .margin({ left: 5})
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }
          .width("100%")
          .justifyContent(FlexAlign.Center)
          .height(50)
        }
      }
    }.width("93.5%")
    .height("100%")
    .offset({ x: 0, y: `${this.newsModel.offsetY/3}px` })
    .onScrollIndex((start:number,end:number)=>{
       this.newsModel.startIndex=start;
       this.newsModel.endIndex=end;
    })

  }

  @Builder FailLayout(){
    Image($r("app.media.none"))
      .height(120)
      .width(120)
    Text($r("app.string.page_none_msg"))
      .opacity(0.6)
      .fontSize(16)
      .fontColor("#182431")
      .margin({top:12})
  }
}