
import promptAction from '@ohos.promptAction';
import NewsModel from '../../viewmodel/NewsModel';
import NewsViewModel, { NewsData } from '../../viewmodel/NewsViewModel';
import CommonConstants from '../constants/CommonConstants';

export function touchMoveLoadMore(newsModel:NewsModel,event:TouchEvent){
  if(newsModel.endIndex===newsModel.newsData.length-1||newsModel.endIndex===newsModel.newsData.length){
    newsModel.offsetY=event.touches[0].y-newsModel.downY;
    if(Math.abs(newsModel.offsetY)>vp2px(newsModel.pullUpLoadHeight)/2){
      newsModel.isCanLoadMore=true;
      newsModel.isVisiblePullUpLoad=true;
      newsModel.offsetY = -vp2px(newsModel.pullUpLoadHeight) + newsModel.offsetY*0.1;
    }
  }
}
export function touchUpLoadMore(newsModel:NewsModel){
  let self:NewsModel=newsModel;
  animateTo({
    duration:2000,
  },()=>{
    self.offsetY=0;
  })
  if(self.isCanLoadMore===true&&self.hasMore===true){
    self.isLoading=true;
    setTimeout(()=>{
      closeLoadMore(newsModel)
     // promptAction.showToast({message:"上拉加载中..."});
      NewsViewModel.getNewsList(self.currentPage,self.pageSize,CommonConstants.GET_NEWS_LIST)
        .then((data:NewsData[])=>{
          if(data.length===self.pageSize){
            self.currentPage++;
            self.hasMore=true;
          }else{
            self.hasMore=false;
          }
          self.newsData=self.newsData.concat(data)
        }).catch((error:Error)=>{
        promptAction.showToast({message:JSON.stringify(error)})
      })

    },1000)
  }else{
    closeLoadMore(newsModel)
  }
}

export function closeLoadMore(newsModel:NewsModel){
  newsModel.isCanLoadMore=false;
  newsModel.isLoading=false;
  newsModel.isVisiblePullUpLoad=false;
}