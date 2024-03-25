import { ViewStateConstant } from '../../../../common/constants/ViewStateConstant';
import { ItemList } from '../../model/FocusModel';
import { ItemChildList } from '../../model/ItemChildList';
import { RoutePath } from '../../route/RoutePath';
import Router from '../../route/Router';
import { LogUtils } from '../../utils/LogUtils';
import ToastUtils from '../../utils/ToastUtils';
import showToast from '../../utils/ToastUtils';

import FocusViewModel from '../../viewmodel/FocusViewModel';
import { RefreshFooter } from '../../views/RefreshFooter';
import { StateComponent } from '../../views/StateComponent';

@Preview
@Component
export struct FocusPage {
  // @Consume @Watch("onHomeTabSelected") homeTabSelected: number;
  // @Consume @Watch("onFindTabSelected") currentIndex: number;
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING;
  @State isRefreshing: boolean = false;
  tempList: string[] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  @State valueList: ItemList[] = [];
  @State showLoadMore:boolean=false;
  pageIndex:number=0;
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number

  @Consume @Watch("onFindTabSelected") findCurrentIndex: number
  private hasInit = false

  onHomeTabSelected() {
    if(!this.hasInit&&this.homeTabSelected==1&&this.findCurrentIndex==0){
      this.loadNet()
      this.hasInit=true;
    }
    LogUtils.debug("Focus-homeTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)

  }

  onFindTabSelected() {
    if(!this.hasInit&&this.homeTabSelected==1&&this.findCurrentIndex==0){
      this.loadNet()
      this.hasInit=true;
    }
    LogUtils.debug("Focus-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
  }

  aboutToAppear() {
    FocusViewModel.observeState((state)=>{
      this.viewState=state;
    })
   // this.loadNet();
  }

  loadNet() {
    FocusViewModel.getFocusData(this.pageIndex, (valueList: ItemList[]) => {
      //刷新设置为false
      this.isRefreshing = false;
      //不显示lLoadMore
      this.showLoadMore = false;
      if(this.pageIndex==0){
        this.valueList = valueList;
      }else{
        this.valueList=[...this.valueList,...valueList]
      }
    })
  }

  build() {
    StateComponent({ viewState: this.viewState, retryCallback: () => {
      this.loadNet();
    } }) {
      Refresh({ refreshing: this.isRefreshing }) {
        List() {
          ForEach(this.valueList, (item0: ItemList, index: number) => {
            ListItem() {
              Column() {
                Row() {
                  Image(`${item0.data.header.icon}`)
                    .width(50)
                    .height(50).borderRadius(25)

                  Column() {
                    Text(`${item0.data.header.title}`)
                      .fontSize(16)
                      .fontColor("#333333")
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text(`${item0.data.header.description}`)
                      .fontSize(14)
                      .fontColor("#999999")
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .margin({ top: 5 })
                  }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Start).padding({ left: 5 })
                  .layoutWeight(1)
                }.width("100%").height(60).alignItems(VerticalAlign.Center)
                //(): RelativeContainerAttribute;：这是接口中的一个方法签名，但这个方法没有名字。
                // 在 TypeScript 中，这样的方法通常被称为“可调用的签名”或“索引签名”，但它实际上表示一个函数。
                // interface RelativeContainerInterface {
                //   (): RelativeContainerAttribute;
                // }
                List({ space: 10 }) {
                  ForEach(item0.data.itemList, (item: ItemChildList, index: number) => {
                    ListItem() {
                      RelativeContainer() {
                        Image(`${item.data.cover.feed}`)
                          .id("iv_bg")
                          .width("100%")
                          .height("100%")
                          .borderRadius(10)
                          .alignRules({
                            middle: { anchor: "__container__", align: HorizontalAlign.Center },
                            center: { anchor: "__container__", align: VerticalAlign.Center },
                          })
                        Text(`${item.data.category}`)
                          .width(40)
                          .height(20)
                          .backgroundColor(Color.Red)
                          .id("tv_1")
                          .alignRules({
                            top: { anchor: "__container__", align: VerticalAlign.Top },
                            right: { anchor: "__container__", align: HorizontalAlign.End },
                          })
                          .border({ radius: { topRight: 10, bottomLeft: 10 } })
                          .fontSize(10)
                          .fontColor(Color.White)
                          .textAlign(TextAlign.Center)

                      }.width("45%").height(110)
                    }.onClick(()=>{
                        Router.push(RoutePath.DetailPage, { playId: item?.data?.id, playUrl: item?.data?.playUrl})
                    })
                  })
                }.width("100%").height(120).listDirection(Axis.Horizontal)

              }.padding({ left: 10, right: 10 })
            }
          })
          ListItem(){
            RefreshFooter({showFooter:this.showLoadMore})
          }
        }.listDirection(Axis.Vertical)
        .onReachEnd(() => {
          this.showLoadMore=true
          this.pageIndex++;
          setTimeout(()=>{
            this.loadNet();
          },1000)
        }).padding({bottom:20})
      }.width("100%").height("100%").onRefreshing(() => {
        this.isRefreshing = true;
        this.loadNet();
      })
    }
  }
}