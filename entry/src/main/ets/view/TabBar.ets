
import NewsViewModel, { NewsTypeBean } from '../viewmodel/NewsViewModel'
@Component
export default struct TabBar   {
    @State tabBarArray:NewsTypeBean[] =NewsViewModel.getDefaultTypeList();
    @State currentIndex:number=0;
    aboutToAppear(){
        // Request news category.
        NewsViewModel.getNewsTypeList().then((typeList:NewsTypeBean[])=>{
            this.tabBarArray=typeList;
        }).catch((typeList:NewsTypeBean[])=>{
            this.tabBarArray=typeList;
        })
    }
    build(){
        Tabs(){
            ForEach(this.tabBarArray,(tabsItem:NewsTypeBean)=>{
                TabContent(){
                    Column(){
                        Text("AAAAAAAAAAA")
                    }
                }
            })
        }
        .barHeight("7.2%")
        .barMode(BarMode.Scrollable)
        .barWidth("100%")
        .onChange((index:number)=>{
            this.currentIndex=index;
        }).vertical(false)
    }

}
