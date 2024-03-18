import { ViewStateConstant } from '../../../../common/constants/ViewStateConstant'
import { getCategories } from '../../http/apiService';
import { BaseDataSourceWrapper } from '../../model/BaseDataSourceWrapper';
import { RoutePath } from '../../route/RoutePath';
import Router from '../../route/Router';
import ImageRegexUtils from '../../utils/ImageRegexUtil';
import { CategoryModel } from '../../viewmodel/CategoryModel';
import CategoryViewModel from '../../viewmodel/CategoryViewModel';
import { StateComponent } from '../../views/StateComponent'

@Preview
@Component
export struct CategoryPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_SUCCESS;
  @State categoryList: CategoryModel[] = [];
  @State dataSource: BaseDataSourceWrapper<CategoryModel> = new BaseDataSourceWrapper<CategoryModel>([])

  aboutToAppear() {

    CategoryViewModel.observeState((state) => {
      this.viewState = state
    })
    this.loadNet()

  }

  loadNet() {
    CategoryViewModel.getCategoryDataList((categoryList: CategoryModel[]) => {
      this.categoryList = categoryList;
      // this.dataSource = new BaseDataSourceWrapper<CategoryModel>(this.categoryList)
    });

  }

  build() {
    StateComponent({ viewState: this.viewState, retryCallback: () => {

    } }) {
      Grid() {
        ForEach(this.categoryList, (item: CategoryModel, index: number) => {
          GridItem() {
            Stack() { //默认居中
              Image(ImageRegexUtils(item.bgPicture)).width("100%").height("100%").borderRadius(10)
              Text(`${item.name}`).fontColor(Color.White).fontSize(12)
            }.width("100%").height(150).borderRadius(10)
          }.padding(10).onClick(()=>{
            Router.push(RoutePath.CategoryDetailPage,{detailId:item.id})
          })
        })
      }.columnsTemplate("1fr 1fr") //不设置rowsTemplate 可以自动
      .height("100%").padding({bottom:100})
    }

  }
}