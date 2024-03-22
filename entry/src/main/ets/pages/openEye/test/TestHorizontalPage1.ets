import router from '@ohos.router'
import { LogUtils } from '../utils/LogUtils'
import { CommonTopBar } from '../views/CommonTopBar'

@Entry
@Component
struct TestHorizontalPage1 {
  @State message: string = 'Hello World'
  private scrollScroller: Scroller = new Scroller()
  private rightScroller: Scroller = new Scroller()
  private leftScroller: Scroller = new Scroller()
  tempList: number[] = []
  private scrollFlag = -1 // 1=左边   2=右边
  aboutToAppear() {
    for (let i = 0;i < 50; i++) {
      this.tempList.push(i);
    }
  }

  build() {
    Column() {
      CommonTopBar({ title: "联动滚动1", alpha: 1, backButton: true, onBackClick: () => {
        router.back()
      } })
      Row() {

        //左边部分
        List({ scroller: this.leftScroller }) {
          ForEach(this.tempList, (item) => {
            ListItem() {
              Text("item"+item).width(100).height(100).backgroundColor(Color.Blue).textAlign(TextAlign.Center)
            }
          })
        }.width(100).height("100%")
        .onScrollStart(() => {
          if (this.scrollFlag == -1) {
            this.scrollFlag = 1 //// 1=左边   2=右边
          }
          LogUtils.debug(`滚动-左边--Start${this.scrollFlag}`)
        })
        .onScroll((scrollOffset, state) => {
          let yOffset = this.leftScroller.currentOffset().yOffset; //垂直方向滑动的距离
          LogUtils.debug(`滚动-左边>${yOffset}`)
          if(this.scrollFlag==1){
            this.rightScroller.scrollBy(0,scrollOffset)
          }
        }) .edgeEffect(EdgeEffect.None) //去掉List下拉，上拉回弹动画
        .onScrollStop(()=>{
          if(this.scrollFlag==1){
            let yOffset=this.leftScroller.currentOffset().yOffset // 垂直方向滑动的距离
            this.rightScroller.scrollTo({xOffset:0,yOffset:yOffset})
          }
          LogUtils.debug(`滚动-左边--Stop${this.scrollFlag}`)
          this.scrollFlag = -1
        })



        //右边部分
        Scroll(this.scrollScroller) {
          List({ scroller: this.rightScroller }) {
            ForEach(this.tempList, (item) => {
              ListItem() {
                Row() {
                  Text(`第一列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                  Text(`第二列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                  Text(`第三列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                  Text(`第四列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                  Text(`第五列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                  Text(`第六列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                  Text(`第七列${item}`).width(100).textAlign(TextAlign.Center).height(100)
                }
              }
            })
          }.width(700).height("100%") //必须指定宽度才能左右滑动
          .onScrollStart(() => {
            if (this.scrollFlag == -1) {
              this.scrollFlag = 2 //// 1=左边   2=右边
            }
            LogUtils.debug(`滚动-右边--Start${this.scrollFlag}`)
          })
          .onScroll((scrollOffset, state) => {
            let yOffset = this.rightScroller.currentOffset().yOffset; //右边向上滑动的距离
            LogUtils.debug(`滚动-右边>${yOffset}`)
            if(this.scrollFlag==2){
              this.leftScroller.scrollBy(0,scrollOffset)
            }
          }) .edgeEffect(EdgeEffect.None) //去掉List下拉，上拉回弹动画
          .onScrollStop(()=>{
            if(this.scrollFlag==2){
              let yOffset=this.rightScroller.currentOffset().yOffset
              this.leftScroller.scrollTo({yOffset:yOffset,xOffset:0}) //左边List 垂直方向滑动
            }
            LogUtils.debug(`滚动-右边--Stop${this.scrollFlag}`)
            this.scrollFlag = -1
          })


        }.layoutWeight(1).scrollable(ScrollDirection.Horizontal).flexShrink(1)

      }.width("100%").justifyContent(FlexAlign.Start).layoutWeight(1)

    }.width("100%").height("100%")
  }
}