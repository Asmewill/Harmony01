

@Component
export  struct CommonSkeleton{
  //可以直接使用new 初始化 Array数组
  @State dataList:Array<string>=new Array[5];

  aboutToAppear(){
    for(let i=0;i<3;i++){
      this.dataList.push("")
    }
  }

  build(){
    List(){
      ForEach(this.dataList,(item:String,index:number)=>{
        ListItem(){
          this.itemView()
        }
      })
    }.width("100%").height("100%")
  }
  @Builder
  itemView(){
    Column(){
      Image($r("app.media.back_placeholder"))
        .width("100%").height(200).border({radius:5})
      Stack().width("90%").height(25).backgroundColor("#f5f5f5").margin({top:10})
      Stack().width("70%").height(25).backgroundColor("#f5f5f5").margin({top:5})
    }.alignItems(HorizontalAlign.Start)

  }
}