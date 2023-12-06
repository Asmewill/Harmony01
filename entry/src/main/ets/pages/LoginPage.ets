import router from '@ohos.router'
import Prompt from '@system.prompt'
import prompt from '@ohos.prompt'
import promptAction from '@ohos.promptAction'



@Extend(TextInput)
function inputStyle(){
  .placeholderColor($r("app.color.placeholder_color"))
  .height(45)
  .fontSize(18)
  .backgroundColor($r("app.color.background"))
  .width("100%")
  .padding({left:0})
  .margin({top:"12vp"})
}
@Extend(Line)
function lineStyle(){
  .width("100%")
  .height(1)
  .backgroundColor($r("app.color.line_color"))
}
@Extend(Text)
function blueTextStyle(){
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize(14).fontWeight(FontWeight.Medium)
}





@Entry
@Component
struct LoginPage {
  @State account:string='';
  @State password:string='';
  @State isShowProgress:boolean=false;
  private timeOutId:number=-1;

  @Builder
  imageButton(src:Resource){
    Button({type:ButtonType.Circle,stateEffect:true}){
      Image(src)
    }
    .height(48).width(48)
    .backgroundColor($r("app.color.background"))
  }

  login():void{
    if(this.account===''||this.password===''){
      promptAction.showToast({
        message: $r('app.string.input_empty_tips')
      })
    }else{
      this.isShowProgress=true;
      if(this.timeOutId===-1){
        this.timeOutId=setTimeout(()=>{
          this.isShowProgress=false;
          this.timeOutId=-1;
          router.replaceUrl({url:'pages/MainPage'})
        },2000)
      }
    }
  }

  build() {
      Column(){
        Image($r('app.media.logo'))
          .width(74).height(74)
          .margin({top:100,bottom:8})
        Text("登录界面").fontSize(24)
          .fontWeight(FontWeight.Medium)
          .fontColor($r("app.color.title_text_color"))

        Text("登录账号以使用更多服务").fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r("app.color.login_more_text_color"))
          .margin({bottom:30,top:8})

        TextInput({placeholder:$r('app.string.account')})
          .maxLength(11)
          .type(InputType.Number)
          .inputStyle()
          .onChange((value:string)=>{
            this.account=value;
          })
        Line().lineStyle()

        TextInput({placeholder:$r("app.string.password")})
          .maxLength(8)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value:string)=>{
               this.password=value;
          })
        Line().lineStyle().margin({top:0.2})
        Row(){
          Text($r("app.string.message_login")).blueTextStyle()
         // Blank()
          Text($r("app.string.forgot_password")).blueTextStyle()
        }
        .width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top:8})

       Button($r('app.string.login'), { type: ButtonType.Capsule })
         .width("90%").height(40).fontSize(16)
         .fontWeight(FontWeight.Medium)
         .margin({ top:80 })
         .onClick(()=>{
           this.login();
         })

        Text($r("app.string.register_account")).margin({top:10})
          .fontSize(16).fontColor($r("app.color.login_blue_text_color"))
          .fontWeight(FontWeight.Medium)
        if(this.isShowProgress){
          LoadingProgress().color($r('app.color.loading_color'))
            .width(30).height(30).margin({top:20})
        }
        Blank()
        Text($r("app.string.other_login_method"))
          .fontWeight(FontWeight.Medium)
          .fontColor($r("app.color.other_login_text_color"))
          .margin({bottom:15})

        Row({space:44}){
          this.imageButton($r("app.media.login_method1"));
          this.imageButton($r("app.media.login_method2"))
          this.imageButton($r("app.media.login_method3"))
        }
      }
      .backgroundColor($r("app.color.background"))
       .height("100%").width("100%")
       .padding({left:12,right:12,bottom:24})
  }


}