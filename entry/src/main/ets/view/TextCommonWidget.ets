import defaultAppManager from '@ohos.bundle.defaultAppManager'
import promptAction from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../viewmodel/ItemData';
import mainViewModel from '../viewmodel/MainViewModel'


@Component
export default struct TextCommonWidget {
  private inputImage?:Resource;
  private title?:Resource;
  @Link content:string;
  //let 方法名: (参数类型) => 返回类型 = function(方法类型): 返回类型{ 方法体}
//   let lamAdd: (x: number, y: number) => number
//   = function (x: number, y: number): number {
//   return x + y;
// }
  onItemClick:(x:number,y:number)=>void;//定义多个参数
  onItemClick1=function():void{};
  onItemClick2:()=>{ };


  build(){
    Row(){
      Image(this.inputImage!=null?this.inputImage:"")
        .width(24).height(24)
        .margin({left:12})
      Text(this.title)
        .fontSize(16)
        .margin({left:12})
        .height("100%")
      Text(this.content)
        .fontSize(16)
        .textAlign(TextAlign.End)
        .layoutWeight(1)
        .margin({right:10})

      Image($r("app.media.ic_arrow"))
        .width(12)
        .height(12)
        .margin({right:14})
    }
    .width("92%")
    .margin({top:24})
    .height(64).backgroundColor(Color.White)
    .borderRadius(24).onClick(()=>{
      this.onItemClick(2, 8) //实际调用
    //  this.onItemClick3();
    })
  }

}