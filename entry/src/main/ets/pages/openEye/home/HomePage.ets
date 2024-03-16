import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import { IssueList, ItemList } from '../model/HomeModel'
import { RoutePath } from '../route/RoutePath'
import Router from '../route/Router'
import showToast from '../utils/ToastUtils'
import HomeViewModel from '../viewmodel/HomeViewModel'

import { CommonTopBar } from '../views/CommonTopBar'
import { RefreshFooter } from '../views/RefreshFooter'
import { StateComponent } from '../views/StateComponent'
import { HomeListItemComponent } from './component/HomeListItemComponent'


@Component
export struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: ItemList[] = new Array<ItemList>();
  @State isRefreshing: boolean = false;
  @State showLoadMore: boolean = false;

  aboutToAppear() {
    // for(let i=0;i<100;i++){
    //   this.dataList.push(new ItemList())
    // }
    // setTimeout(()=>{
    //   this.viewState =ViewStateConstant.VIEW_STATE_ERROR
    // },3000)
    HomeViewModel.observeState(state => {
      this.viewState = state;
    })
    this.loadNet();

  }

  loadNet() {
    HomeViewModel.getHomeList((result: ItemList[]) => {
      //刷新设置为false
      this.isRefreshing = false;
      //不显示lLoadMore
      this.showLoadMore = false;
      if (HomeViewModel.getDate() == "") {
        this.dataList = result;
      } else {
        // 表达式使用扩展运算符 ... 来展开 this.dataList 数组和 result 数组中的元素，然后再将展开后的数组合并成一个新的数组。
        // 最后，通过赋值操作符 = 将合并后的数组重新赋值给 this.dataList。
        this.dataList = [...this.dataList, ...result]
      }
    })
  }

  build() {
    Column() {
      CommonTopBar({ title: "首页", alpha: 1, backButton: false })
      Stack() {
        StateComponent({ viewState: this.viewState, retryCallback: () => {
          showToast("Error")
        } }) {
          Refresh({ refreshing: this.isRefreshing }) {
            List({ space: 10, initialIndex: 0 }) {
              ForEach(this.dataList, (item: ItemList, index: number) => {
                ListItem() {
                  HomeListItemComponent({ item: item, click: () => {
                    Router.push(RoutePath.DetailPage, { playId: item?.data?.id, playUrl: item?.data?.playUrl })
                  } })
                }
              })
              ListItem() {
                RefreshFooter({ showFooter: this.showLoadMore })
              }
            }.listDirection(Axis.Vertical)
            .onReachEnd(() => {
              this.showLoadMore = true;
              this.loadNet();
            })
          }.onRefreshing(() => {
            HomeViewModel.revertDate()
            this.loadNet()
          }).width("100%").height("100%")
        }
      }.layoutWeight(1)
    }.width("100%").height("100%").justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
  }
}