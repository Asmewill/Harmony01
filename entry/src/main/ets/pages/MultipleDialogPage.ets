import router from '@ohos.router'
import promptAction from '@ohos.promptAction';
import CommonConstants from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger';
import TextCommonWidget from '../view/TextCommonWidget';
import TextInputWidget from '../view/TextInputWidget';
import Context from '@ohos.app.ability.common';
import CustomDialogWidget from '../view/CustomDialogWidget';
import CommonUtils from '../common/utils/CommonUtils';

const TAG = '[MultipleDialogPage]';

@Entry
@Component
struct MultipleDialogPage {
  @State message: string = CommonConstants.INDEX_MESSAGE
  @State birthday:string="";
  @State sex:string='';
  @State hobbies:string='';

  private sexArray:Resource =$r("app.strarray.sex_array")
  customDialogController:CustomDialogController=new CustomDialogController({
    builder:CustomDialogWidget({
      hobbies:$hobbies
    }),
    alignment:DialogAlignment.Bottom,
    customStyle:true,
    offset:{
      dx:0,
      dy:-20
    }
  });

  aboutToAppear(){
    let date=new Date();
    let year=date.getFullYear();
    let month=date.getMonth()+1;
    let day=date.getDate();
    this.birthday=CommonUtils.getBirthDateValue(year,month,day);
    Logger.info(TAG,this.birthday)
  }

  build() {
    Scroll() {
      Column() {
        Image($r("app.media.ic_back"))
          .width(26).height(26)
          .alignSelf(ItemAlign.Start)
          .margin({left:20,top:20}).onClick(()=>{
          let context = getContext(this) as Context.UIAbilityContext;
          CommonUtils.alertDialog(context);
        })

        Image($r("app.media.ic_avatar"))
          .width(56).height(56).margin({top:20})


        Text($r("app.string.text_personal_title"))

        TextInputWidget({inputImage:$r("app.media.ic_nickname"), hintText:$r("app.string.text_input_hint")})

        TextCommonWidget({
          inputImage:$r("app.media.ic_birthdate"),
          title:$r("app.string.title_birthdate"),
          content:$birthday,
          onItemClick:()=>{
            CommonUtils.datePickerDialog((birthdate:string)=>{
                this.birthday=birthdate;
            })
          }
        })

        TextCommonWidget({
          inputImage:$r("app.media.ic_sex"),
          title:$r("app.string.title_sex"),
          content:$sex,
          onItemClick:()=>{
             CommonUtils.textPickerDialog(this.sexArray,(sexValue:string)=>{
               this.sex=sexValue;
             });
          }
        })


        TextInputWidget({inputImage:$r("app.media.ic_signature"),
          hintText:$r("app.string.text_input_signature")})


        TextCommonWidget({
          inputImage:$r("app.media.ic_hobbies"),
          title:$r("app.string.title_hobbies"),
          content:$hobbies,
          onItemClick:()=>{
            this.customDialogController.open();
          }
        })

      }.width("100%")

    }
    .height("100%")
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
    .backgroundColor($r("app.color.page_bg"))

  }

}
