import router from '@ohos.router';
import CommonConstants from '../common/constants/CommonConstants';
import PreferencesHandler from '../common/database/PreferencesHandler';
import DataTypeUtils from '../common/utils/DataTypeUtils';
import { GlobalContext } from '../common/utils/GlobalContext';
import Logger from '../common/utils/Logger';
import ClockArea from '../view/ClockArea'
import AlarmItem from '../viewmodel/AlarmItem';

@Entry
@Component
struct ClockPage {
  @State alarms:Array<AlarmItem>=new Array<AlarmItem>() ;
  aboutToAppear(){


  }

  onPageShow(){
    setTimeout(()=>{
      let preference = GlobalContext.getContext().getObject('preference') as PreferencesHandler;
      preference.get(CommonConstants.ALARM_KEY).then((data: string) => {
        if(!DataTypeUtils.isNull(data)) {
          this.alarms = JSON.parse(data);
        }
      })
    },1000)
  }


  build() {
    Stack({alignContent:Alignment.Bottom}){
      Column() {
        Row() {
          Text("闹钟").fontSize(20).fontColor(Color.Black).margin({ left: 20, top: 20, bottom: 40 })
        }.width("100%").justifyContent(FlexAlign.Center)
        //闹钟控件
        ClockArea()
        List() {
          ForEach(this.alarms,(item:AlarmItem,index:number)=>{
            ListItem(){
              Row(){
                Column(){
                  Row(){
                    Text(item.ampm).fontSize(16).fontColor(Color.Black)

                    Text(item.hour+":"+item.minute).fontSize(20).fontColor(Color.Black)

                  }.justifyContent(FlexAlign.Start).backgroundColor(Color.Green)

                  Text(item.name+(item.isRepeat?("重复 " +this.getRepeatStr(item)):"不重复")).fontSize(16)
                    .fontColor(Color.Grey).margin({top:10}).textAlign(TextAlign.Start)

                }.padding({left:5}).alignItems(HorizontalAlign.Start)

                Toggle({type:ToggleType.Switch,isOn:item.isOpen})
              }.width("100%").height(75).borderRadius(20).backgroundColor(Color.White)
              .justifyContent(FlexAlign.SpaceBetween).padding({left:10,right:10})
            }.margin({left:10,right:10,top:10}).onClick(()=>{
              router.pushUrl({ url: "pages/ClockSettingPage",params:{alarmItem:item}})
                .catch((error: Error) => {
                  Logger.info("ClockPage", "IndexPage push error" + JSON.stringify(error))
                })
            })

          });
        }
        .width("100%")
        .layoutWeight(1).listDirection(Axis.Vertical)
      }
      .width("100%").height("100%")
      .alignItems(HorizontalAlign.Center)
      .backgroundColor("#F1F3F5").margin({top:10})

      Button(){
        Image($r('app.media.ic_add')).objectFit(ImageFit.Fill)
      }.width(80).height(80).margin({ bottom: 20 }).onClick(() => {
        router.pushUrl({ url: "pages/ClockSettingPage"})
          .catch((error: Error) => {
            Logger.info("ClockPage", "IndexPage push error" + JSON.stringify(error))
          })
      })
    }

  }

  public getRepeatStr(alarmItem:AlarmItem):string{
    let tempList:Array<string>=[];

    for(let i=0;i<alarmItem.repeatDayList.length;i++){
      if(alarmItem.repeatDayList[i].isChecked){
        tempList.push(alarmItem.repeatDayList[i].label);
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