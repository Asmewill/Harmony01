import promptAction from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants';
@Component
export default struct ClockArea {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private canvasRenderContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private canvasSize:number=252 //画布大小
  private clockRadius:number=252/2-2;//闹钟半径
  private drawInterval:number=-1;
  @State showClock:boolean=true;

  build() {
    Canvas(this.canvasRenderContext).width(this.canvasSize).aspectRatio(1).onReady(() => {
      //将画笔移动到画布的中心,作为坐标轴（0,0）
      this.canvasRenderContext.translate(this.canvasSize/2,this.canvasSize/2);

      if(this.drawInterval===-1){
        //每隔
      this.drawInterval=setInterval(()=>{
          let date=new Date();
          let hours=date.getHours();
          let minutes=date.getMinutes();
          let seconds=date.getSeconds();
          this.canvasRenderContext.clearRect(-this.canvasSize/2,-this.canvasSize/2,this.canvasSize,this.canvasSize)
          if(this.showClock){
            //绘制时钟区域
            //开始绘制表盘
            this.canvasRenderContext.beginPath();
            let img01=new ImageBitmap(CommonConstants.CLOCK_PAN_IMAGE_URL)
            let imageWidth=this.clockRadius*2;
            this.canvasRenderContext.drawImage(img01,-this.clockRadius,-this.clockRadius,imageWidth,imageWidth)
            this.canvasRenderContext.restore();
            //绘制时针
            this.canvasRenderContext.save();
            //时针转动的角度
            let degree01:number;
            if(hours>12){
              degree01=30*(hours-12)
            }else{
              degree01=30*hours;
            }
            //多余的分钟兑换成时针转换角度 // 绘制时针、分针、秒针
            let degree02:number=minutes*6/12;
            degree01+=degree02;
            //先旋转画布 原来角度 +180度  换算成 3.141592654
            let theta02=(degree01+180)*Math.PI/180;
            this.canvasRenderContext.rotate(theta02);
            this.canvasRenderContext.beginPath();
            let img02 =new ImageBitmap(CommonConstants.HOUR_POINTER_IMAGE_URL)

            this.canvasRenderContext.drawImage(img02,-5,-this.clockRadius,10,this.clockRadius*2)
            this.canvasRenderContext.restore();

            //绘制分针
            this.canvasRenderContext.save();
            //分针转动的角度
            let degree03=minutes*6;
            //先旋转画布 原来角度 +180度  换算成 3.141592654
            let theta03=(degree03+180)*Math.PI/180;
            this.canvasRenderContext.rotate(theta03);
            this.canvasRenderContext.beginPath();
            let img03=new ImageBitmap(CommonConstants.MINUTE_POINTER_IMAGE_URL)
            this.canvasRenderContext.drawImage(img03,-5,-this.clockRadius,10,this.clockRadius*2)
            this.canvasRenderContext.restore();

            //绘制秒针
            this.canvasRenderContext.save();
            //秒针转动的角度
            let degree04=seconds*6;
            //先旋转画布 原来角度 +180度  换算成 3.141592654
            let theta04=(degree04+180)*Math.PI/180;
            this.canvasRenderContext.rotate(theta04);
            this.canvasRenderContext.beginPath();
            let img04=new ImageBitmap(CommonConstants.SECOND_POINTER_IMAGE_URL);
            this.canvasRenderContext.drawImage(img04,-5,-this.clockRadius,10,this.clockRadius*2);
            this.canvasRenderContext.restore();
          }else{
            let time=this.fillZero(hours)+":"+this.fillZero(minutes)+":"+this.fillZero(seconds)
            this.canvasRenderContext.save();
            this.canvasRenderContext.font="60px";
            this.canvasRenderContext.beginPath();
            this.canvasRenderContext.textAlign="center";
            this.canvasRenderContext.fillText(time,0,0);
            this.canvasRenderContext.restore();
          }
        },1000)
      }
    }).backgroundColor(Color.White).onClick(()=>{
      this.showClock=!this.showClock;

    })
  }

  public fillZero(val: number): string {
    return (val >  9
      ? val.toString()
      : ("0"+ val));
  }


}