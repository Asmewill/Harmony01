/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import CommonConstants from '../../common/constants/CommonConstants';
import AlarmItem from '../../viewmodel/AlarmItem';
import DayItem from '../../viewmodel/DayItem';
import HobbyItem from '../../viewmodel/HobbyItem';


@Preview
@CustomDialog
export default struct RepeatDialog {
  @Consume(CommonConstants.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem;

  controller:CustomDialogController=new CustomDialogController({
    builder:RepeatDialog(),
    autoCancel:true
  })

  aboutToAppear(){
    if(this.alarmItem.repeatDayList.length===0){
      for(let i=0;i<7;i++){
        switch (i) {
          case 0:
            this.alarmItem.repeatDayList.push(new DayItem("周一",false))
            break;
          case 1:
            this.alarmItem.repeatDayList.push(new DayItem("周二",false))
            break;
          case 2:
            this.alarmItem.repeatDayList.push(new DayItem("周三",false))
            break;
          case 3:
            this.alarmItem.repeatDayList.push(new DayItem("周四",false))
            break;
          case 4:
            this.alarmItem.repeatDayList.push(new DayItem("周五",false))
            break;
          case 5:
            this.alarmItem.repeatDayList.push(new DayItem("周六",false))
            break;
          case 6:
            this.alarmItem.repeatDayList.push(new DayItem("周日",false))
            break;
          default:
            break;
        }
      }
    }

  }


  build() {
    Column(){
      Text("重复").fontSize(20).width("100%").fontColor("#182431")
        .margin({ left:20,top:20 })
      ForEach(this.alarmItem.repeatDayList,(item:HobbyItem,index:number)=>{
        Row(){
          Text(item.label).fontSize(20).fontColor(Color.Black)
          Checkbox({name:"AAA"}).width(20).height(20).select(item.isChecked)
            .onChange((value:boolean)=>{
              item.isChecked=value;

          })
        }.width("100%").justifyContent(FlexAlign.SpaceBetween).padding({right:10})
      })
      Divider().color(Color.Grey).opacity(0.1).margin({top:10})
      Flex(){
        Text("取消").layoutWeight(1).height(50).textAlign(TextAlign.Center).onClick(()=>{

          this.controller.close();
        })
        Line().height(50).width(1).backgroundColor(Color.Grey).opacity(0.1)
        Text("确定").layoutWeight(1).height(50).textAlign(TextAlign.Center).onClick(()=>{
          if(JSON.stringify(this.alarmItem.repeatDayList).includes("true")){
            this.alarmItem.isRepeat=true;
          }else{
            this.alarmItem.isRepeat=false;
          }
          //重新赋值
          let temp:Array<DayItem>=  this.alarmItem.repeatDayList;
          this.alarmItem.repeatDayList=[];
          this.alarmItem.repeatDayList=temp;
          this.controller.close();
        })
      }.height(50)
    }.padding({left:15})

  }



}