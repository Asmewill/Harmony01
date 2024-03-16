import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import { ItemList } from '../model/DetailModel'
import VideoDetailViewModel from '../viewmodel/VideoDetailViewModel'
import { StateComponent } from './StateComponent'

@Preview
@Component
export struct VideoBottomComponent {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State resultList:ItemList[]=[];
  private  onItemClick?:(string)=>void;
  private  playId:string="";
  @State  playIndex:number=-1;

  aboutToAppear(){
    VideoDetailViewModel.observeState((state:string)=>{
      this.viewState=state;
    })
    this.loadNet();
  }

  loadNet(){
    VideoDetailViewModel.getRelationList(Number(this.playId),(resultList:ItemList[])=>{
      this.resultList=resultList;
    })
  }

  build() {
    Stack() { //子元素默认居中显示
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet();
      } }) {
        List() {
          ForEach(this.resultList,(item:ItemList,index:number)=>{
            ListItem() {
              Row() {
                Image(`${item.data?.cover?.feed}`).width(100).height("100%").objectFit(ImageFit.Fill).borderRadius(4)
                Column() {
                  Text(`${item.data?.title}`)
                    .fontSize(15)
                    .fontColor(Color.Black)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  Blank()
                  Text(`${item.data?.description}`)
                    .fontSize(12)
                    .fontColor(Color.Grey)
                    .margin({ bottom: 0 })
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .height("100%")
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1).padding({top:3,bottom:3,left:4})
              }
              .width("100%").height(70)
              .justifyContent(FlexAlign.Start)
              .padding(5).backgroundColor(this.playIndex===index?"#999999":Color.White)
            }.onClick(()=>{
              this.onItemClick?.(item.data.playUrl);
              this.playIndex=index;
            });
          })
        }
      }
    }.width("100%").height("100%")

  }
}