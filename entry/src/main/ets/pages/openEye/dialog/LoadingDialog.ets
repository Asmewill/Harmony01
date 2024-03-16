@Preview
@CustomDialog
export struct LoadingDialog {
  controller: CustomDialogController;
  private loadingTips?: string = "加载中...";
  @State rotateAngle: number = 0
  private rotateTimeOut:any;//计时器

  aboutToAppear() {
    this.rotateAngle=360
    this.rotateTimeOut = setInterval(() => {
      this.rotateAngle = 0
      animateTo({ duration: 500 }, () => {
        this.rotateAngle = 360
      })
    }, 500)
  }

  aboutToDisappear(){
    clearInterval(this.rotateTimeOut)
  }

  build() {
    Stack() {
      Column() {
        //.animation({ ... }): 这部分代码定义了一个动画效果。
        //
        // duration: 500: 动画的持续时间为500（单位可能是毫秒，即0.5秒）。
        // iterations: -1: 动画的迭代次数为-1，这通常意味着动画会无限次地循环。
        // curve: Curve.Friction: 这定义了动画的运动曲线。Curve.Friction 可能意味着动画会以一个具有摩擦感的曲线运行，可能开始时速度较快，然后逐渐减速。
        Image($r("app.media.common_loading")).width(50).height(50)
          .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
        Text(this.loadingTips).fontSize(12).margin({ top: 10 })
      }
      .justifyContent(FlexAlign.Center)
      .width(150)
      .height(150)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor(Color.White)
      .borderRadius(10)
    }
  }
}