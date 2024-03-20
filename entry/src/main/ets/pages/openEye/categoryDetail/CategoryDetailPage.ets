import router from '@ohos.router'
import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import { HomeListItemComponent } from '../home/component/HomeListItemComponent'
import { HomeModel, ItemList } from '../model/HomeModel'
import ImageRegexUtils from '../utils/ImageRegexUtil'
import { LogUtils } from '../utils/LogUtils'
import CategoryDetailViewModel from '../viewmodel/CategoryDetailViewModel'
import { CommonTopBar } from '../views/CommonTopBar'
import { RefreshFooter } from '../views/RefreshFooter'
import { StateComponent } from '../views/StateComponent'

@Entry
@Component
export struct CategoryDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_SUCCESS
  @State itemList: ItemList[] = [];
  detailId: number = -1;
  pageIndex = 0;
  @State alpha: number = 0;
  scrollOffset: number = 0;
  @State showLoadMore: boolean = false;
  @State isRefreshing: boolean = false;
  headerImage:string=""
  name:string=""

  aboutToAppear() {
    this.headerImage=router.getParams()["headerImage"]
    this.name=router.getParams()["name"]
    CategoryDetailViewModel.observeState((state:string)=>{
      this.viewState=state;
    })
    this.detailId = router.getParams()["detailId"];
    this.loadNet()
  }

  loadNet() {
    CategoryDetailViewModel.getCategoryDetailList(this.detailId, this.pageIndex, (homeModel: HomeModel) => {
      this.isRefreshing=false;
      this.showLoadMore=false;
      if(this.pageIndex==0){
        this.itemList = homeModel.itemList;
      }else{
        this.itemList =[...  this.itemList,...homeModel.itemList];
      //this.itemList.push()
      }
    });
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Stack(){ //默认子元素居中
        StateComponent({ viewState: this.viewState, retryCallback: () => {
          this.loadNet();
        } }) {
          Refresh({refreshing:this.isRefreshing}){
            List() {
              ListItem() {
                Image(ImageRegexUtils(this.headerImage)).height(300).width("100%").objectFit(ImageFit.Fill)
              }.margin({ bottom: 10 })

              ForEach(this.itemList, (item: ItemList) => {
                ListItem() {
                  HomeListItemComponent({ item: item })
                }
              })
              ListItem(){
                //此处alpha参数，必须是Prop类型才能触发，否则无效
                RefreshFooter({showFooter:this.showLoadMore})
              }
            }.onScroll((scrollOffset: number, scrollState: ScrollState) => {
              this.scrollOffset += scrollOffset;
              LogUtils.debug("Scroll滚动距离", `${scrollState}  >>  ${scrollOffset}`)
              this.dispatchScrollOffset();
            }).onScrollStop(() => {
              LogUtils.debug("Scroll滚动距离", "scrollStateStop")
              this.dispatchScrollOffset();
            }).onReachEnd(()=>{
              this.isRefreshing=false;
              this.pageIndex++;
              this.showLoadMore=true;
              setTimeout(()=>{
                this.loadNet();
              },1000)

            })
          }.onRefreshing(()=>{
            this.showLoadMore=false;
            this.pageIndex=0;
            this.isRefreshing=true;
            this.loadNet();
          })
        }
      }.width("100%").height("100%")
      //此处alpha参数，必须是Prop类型才能触发，否则无效
      CommonTopBar({ title:this.name, backButton: true, alpha: this.alpha, onBackClick: () => {
        router.back()
      } })
    }
  }

  dispatchScrollOffset() {
    let alpha = this.scrollOffset / 300;
    if (alpha > 1) {
      this.alpha = 1;
    } else if (alpha < 0) {
      this.alpha = 0;
    } else {
      this.alpha = alpha;
    }
    LogUtils.info("Scroll滚动距离", `${this.scrollOffset}`)
  }
}