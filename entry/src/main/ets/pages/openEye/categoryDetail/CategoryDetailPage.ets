import router from '@ohos.router'
import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import { HomeListItemComponent } from '../home/component/HomeListItemComponent'
import { HomeModel, ItemList } from '../model/HomeModel'
import CategoryDetailViewModel from '../viewmodel/CategoryDetailViewModel'
import { CommonTopBar } from '../views/CommonTopBar'
import { StateComponent } from '../views/StateComponent'

@Entry
@Component
export struct CategoryDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_SUCCESS
  @State itemList: ItemList[]=[];
  detailId: number = -1;
  pageIndex = 0;
  @State alpha:number=0;

  aboutToAppear() {
    this.detailId = router.getParams()["detailId"];
    this.loadNet()
  }

  loadNet() {
    CategoryDetailViewModel.getCategoryDetailList(this.detailId, this.pageIndex, (homeModel: HomeModel) => {
      this.itemList = homeModel.itemList;
    });
  }

  build() {
    Stack({alignContent:Alignment.Top}) {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet();
      } }) {
        List() {
          ListItem() {
            Image($r("app.media.top")).height(300).width("100%")
          }
          ForEach(this.itemList, (item: ItemList) => {
            ListItem(){
              HomeListItemComponent({ item:item })
            }
          })
        }
      }

      CommonTopBar({ title: "广告", backButton: true,alpha:this.alpha, onBackClick: () => {
        router.back()
      } })
    }
  }
}