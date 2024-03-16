import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import CommonConstants from '../common/constants/CommonConstants'
import DayDataItem from '../viewmodel/DayDataItem'
import RepeatDialog from '../view/dialog/RepeatDialog'
import RenameDialog from '../view/dialog/RenameDialog'
import DurationDialog from '../view/dialog/DurationDialog'
import IntervalDialog from '../view/dialog/IntervalDialog'
import AlarmItem from '../viewmodel/AlarmItem'
import { GlobalContext } from '../common/utils/GlobalContext'
import PreferencesHandler from '../common/database/PreferencesHandler'
import DataTypeUtils from '../common/utils/DataTypeUtils'

@Entry
@Component
struct ClockSettingPage {

  @Watch('onAlarmItemChange') @Provide(CommonConstants.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem = new AlarmItem();
  @State alarm: AlarmItem = new AlarmItem();

  private alarms:Array<AlarmItem> =new Array;
  private index: number = 0;
  //用来开关Dialog
  repeatDialogController: CustomDialogController = new CustomDialogController({
    builder: RepeatDialog(), //DialogUI
    autoCancel: true
  });
  renameDialogController: CustomDialogController = new CustomDialogController({
    builder: RenameDialog(), //DialogUI
    autoCancel: true
  });
  durationDialogController: CustomDialogController = new CustomDialogController({
    builder: DurationDialog(), //DialogUI
    autoCancel: true
  });

  intervalDialogController: CustomDialogController = new CustomDialogController({
    builder: IntervalDialog(), //DialogUI
    autoCancel: true
  });


  aboutToAppear(){
    let params = router.getParams() as Record<string,Object>;
    if(params!==undefined){//修改闹钟
      let tempItem:AlarmItem = params.alarmItem as AlarmItem;
      if(tempItem.ampm==="下午"){
        CommonConstants.DAY_DATA[0].delSelect=1;
      }else {
        CommonConstants.DAY_DATA[0].delSelect=0;
      }

      CommonConstants.DAY_DATA[1].delSelect=tempItem.hour -1;
      CommonConstants.DAY_DATA[2].delSelect=tempItem.minute-1;
      this.alarm=this.alarmItem=tempItem;

    }else{ //新建闹钟
      //设置默认值
      let date = new Date();
      let hour:number = date.getHours();
      let minute:number = date.getMinutes();
      this.alarmItem.hour=(hour>12?hour-12:hour);
      this.alarmItem.minute=minute;


      //第一个WheelView选中 （上午&下午）
      if(hour>=12){
         CommonConstants.DAY_DATA[0].delSelect=1;
         this.alarmItem.ampm="下午";
      }else{
         CommonConstants.DAY_DATA[0].delSelect=0;
         this.alarmItem.ampm="上午";
      }
      //第二个WheelView选中 (时钟)
      if(hour === 0){//处理特殊情况
        CommonConstants.DAY_DATA[1].delSelect=12 -1;
      }else{
        if(hour>12){
          CommonConstants.DAY_DATA[1].delSelect=(hour-12)-1;
        }else{
          CommonConstants.DAY_DATA[1].delSelect=hour-1;
        }
      }
      //第三个WheelView选中 (分针)
      if(minute===0){ //处理特殊情况
        CommonConstants.DAY_DATA[2].delSelect=60-1;
      }else{
        CommonConstants.DAY_DATA[2].delSelect=minute-1
      }
    }
  }

  onAlarmItemChange(){
    this.alarm=this.alarmItem;
  }

  build() {
    Column() {
      //TopView
      Row() {
        Image($r("app.media.ic_cancel")).width(25).height(25).onClick(() => {
          router.back();
        })
        Text("新建闹钟").fontColor(Color.Black).fontSize(20)
        //保存
        Image($r("app.media.ic_confirm")).width(25).height(25).onClick(() => {
          //先获取列表数据
          let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
          preference.get(CommonConstants.ALARM_KEY).then((data:string)=>{
            if(!DataTypeUtils.isNull(data)) {
              this.alarms = JSON.parse(data);
            }
            //保存新加的Item
            if(!JSON.stringify(this.alarms).includes(JSON.stringify(this.alarm))){
              this.alarms.push(this.alarm)
              preference.set(CommonConstants.ALARM_KEY, JSON.stringify(this.alarms));//然后把数组转换成String,存储到preference
            }
          })
          router.back();
        })
      }.width("100%").height("60")
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 15, right: 15 })

      //WheelView 中间滑轮控件
      Stack() {
        Row() {
          ForEach(CommonConstants.DAY_DATA, (item: DayDataItem, positionIndex: number) => {
            TextPicker({ range: item.data, selected: item.delSelect }).layoutWeight(1).backgroundColor("#f1f3f5")
              .onChange((value, index: number) => {
                item.delSelect = index;
                switch (positionIndex) {
                  case 0:
                    this.alarmItem.ampm=value;
                    break;
                  case 1:
                    this.alarmItem.hour=Number.parseInt(value)
                    break;
                  case 2:
                    this.alarmItem.minute=Number.parseInt(value)
                    break;
                  default:
                    break;
                }
                promptAction.showToast({ message: value })
              })
          })
        }.width("88%")
      }


      Row() {
        Text("重复").fontSize(16).fontColor(Color.Black)
        Row() {
          Text(this.alarm.isRepeat ? "重复 "+this.getRepeatStr() :"不重复").fontSize(14).fontColor(Color.Gray)
          Image($r("app.media.ic_right")).width(5).height(10).margin({ left: 2 }).objectFit(ImageFit.Fill)
        }.alignItems(VerticalAlign.Center)

      }
      .height(60)
      .width("90%")
      .borderRadius(30)
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)
      .margin({ top: 10 })
      .padding({ left: 15, right: 15 })
      .onClick(() => {
        this.repeatDialogController.open();

      })


      Column() {
        Row() {
          Text("闹钟名").fontSize(16).fontColor(Color.Black)
          Row() {
            Text(this.alarm.name).fontSize(14).fontColor(Color.Gray)
            Image($r("app.media.ic_right")).width(5).height(10).margin({ left: 2 }).objectFit(ImageFit.Fill)
          }.alignItems(VerticalAlign.Center)

        }
        .height(60)
        .width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor(Color.White)
        .padding({ left: 15, right: 15 })
        .borderRadius({ topLeft: 20, topRight: 20 }).onClick(() => {
          this.renameDialogController.open();
        })


        Line()
            .width("90%")
            .backgroundColor(Color.Gray)
            .height(0.2)
            .opacity(0.1)
            .visibility(Visibility.Hidden)



        Row() {
          Text("闹铃时长").fontSize(16).fontColor(Color.Black)
          Row() {
            Text(this.alarm.duration+"分钟").fontSize(14).fontColor(Color.Gray)
            Image($r("app.media.ic_right")).width(5).height(10).margin({ left: 2 }).objectFit(ImageFit.Fill)
          }.alignItems(VerticalAlign.Center)

        }
        .height(60)
        .width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor(Color.White)
        .padding({ left: 15, right: 15 }).onClick(()=>{
          this.durationDialogController.open();
        })


        Line().width("90%").backgroundColor(Color.Gray).height(0.2)
        Row() {
          Text("再响间隔").fontSize(16).fontColor(Color.Black)
          Row() {
            Text(Math.floor(this.alarm.intervalMinute)+"分钟,"+this.alarmItem.intervalTimes+"次").fontSize(14).fontColor(Color.Gray)
            Image($r("app.media.ic_right")).width(5).height(10).margin({ left: 2 }).objectFit(ImageFit.Fill)
          }.alignItems(VerticalAlign.Center)
        }
        .height(60)
        .width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor(Color.White)
        .padding({ left: 15, right: 15 })
        .borderRadius({ bottomLeft: 20, bottomRight: 20 }).onClick(()=>{
          this.intervalDialogController.open();
        })

      }.width("90%").margin({ top: 10 })

    }.width("100%").height("100%").backgroundColor("#F1F3F5")
  }

  public getRepeatStr():string{
    let tempList:Array<string>=[];

    for(let i=0;i<this.alarmItem.repeatDayList.length;i++){
      if(this.alarmItem.repeatDayList[i].isChecked){
        tempList.push(this.alarmItem.repeatDayList[i].label);
      }
    }
    if(tempList.length>=2){
      return tempList.join(",")
    }else if(tempList.length==1){
      return tempList[0];
    }else{
      return "";
    }
  }






}