import { ViewStateConstant } from '../../../../common/constants/ViewStateConstant'
import { ItemList } from '../../model/TopicModel';
import { TopicModel } from '../../model/TopicModel';
import { RoutePath } from '../../route/RoutePath';
import Router from '../../route/Router';
import ImageRegexUtils from '../../utils/ImageRegexUtil';
import TopViewModel from '../../viewmodel/TopicViewModel';
import { RefreshFooter } from '../../views/RefreshFooter';
import { StateComponent } from '../../views/StateComponent'

@Component
export struct TopicPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_SUCCESS;
  @State isRefreshing: boolean = false;
  @State dataList: ItemList[] = [];
  pageIndex: number = 0;
  @State showLoadMore: boolean = false;
  @State brief:string=""

  aboutToAppear() {
    this.loadNet()
  }

  loadNet() {
    TopViewModel.getTopicData(this.pageIndex, (topicModel: TopicModel) => {
      this.isRefreshing=false;
      this.showLoadMore=false;
      if (this.pageIndex == 0) {
        this.dataList = topicModel.itemList;
      } else {
        this.dataList = [...this.dataList, ...topicModel.itemList]
      }
    })
  }

  build() {
    StateComponent({ viewState: this.viewState, retryCallback: () => {
      this.loadNet()
    } }) {
      Refresh({ refreshing: this.isRefreshing }) {
        List() {
          ForEach(this.dataList, (item: ItemList) => {
            ListItem() {
              Stack({ alignContent: Alignment.Bottom }) {
                Image(ImageRegexUtils(item.data.image))
                  .width("100%")
                  .height(200)
                  .objectFit(ImageFit.Fill)
                  .borderRadius(5)
              }.width("100%").height(200)
            }.padding(8).onClick(()=>{
              Router.push(RoutePath.TopicDetailPage,{topicId:item.data.id})
            })
          })
          ListItem() {
            RefreshFooter({showFooter:this.showLoadMore})
          }
        }.onReachEnd(()=>{
          this.pageIndex++
          this.isRefreshing=false
          this.showLoadMore=true;
          setTimeout(()=>{ //延迟1加载，可以看到FooterView
            this.loadNet()
          },1000)
        })
      }
      .width("100%")
      .height("100%")
      .padding({bottom:50})
      .onRefreshing(() => {
        this.pageIndex = 0;
        this.isRefreshing=true;
        this.showLoadMore=false;
        this.loadNet()
      })
    }
  }
}