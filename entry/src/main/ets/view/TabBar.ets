
import promptAction from '@ohos.promptAction';
import NewsViewModel, { NewsTypeBean } from '../viewmodel/NewsViewModel'
import NewsList from './NewsList';
@Component
export default struct TabBar   {
    private tabsController: TabsController = new TabsController();
    @State tabBarArray:NewsTypeBean[]=[];

    @State currentIndex:number=0;

    aboutToAppear(){
        // Request news category.
        NewsViewModel.getNewsTypeList().then((typeList:NewsTypeBean[])=>{
            this.tabBarArray=typeList;
        }).catch((error:Error)=>{
            promptAction.showToast({message:JSON.stringify(error)})
        })
    }

    @Builder TabBuilder(index:number){
        Column(){
            Text(this.tabBarArray[index].name)
                .height("100%")
                .padding({left:15,right:15})
                .fontSize(this.currentIndex===index?20:16)
                .fontWeight(this.currentIndex===index?700:400)
                .fontColor("#182431").onClick(()=>{
                this.currentIndex=index;
                this.tabsController.changeIndex(this.currentIndex);
            })
        }.height(56)
    }

    build(){
        Tabs({
            barPosition: BarPosition.Start,
            controller: this.tabsController
        }){
            ForEach(this.tabBarArray,(tabsItem:NewsTypeBean)=>{
                TabContent(){
                    Column(){
                       NewsList({currentIndex:$currentIndex});
                    }
                }.tabBar(this.TabBuilder(tabsItem.id))

            },(item: NewsTypeBean) => JSON.stringify(item))
        }
        .barHeight("7.2%")
        .barMode(BarMode.Scrollable)
        .barWidth("100%")
        .onChange((index:number)=>{
            this.currentIndex=index;
        }).vertical(false)
    }

}
