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


@Preview
@CustomDialog
export default struct IntervalDialog {

  @Consume(CommonConstants.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem;
  @State value1:number=0;
  @State value2:number=0;
  array: number[] = CommonConstants.RING_DURATION;
  controller: CustomDialogController = new CustomDialogController({
    builder: IntervalDialog(),
    autoCancel: true
  })

  aboutToAppear() {
    this.value1=this.alarmItem.intervalMinute;
    this.value2=this.alarmItem.intervalTimes;

  }

  build() {
    Column() {

      Text("再响间隔").fontSize(20).width("100%").fontColor("#182431")
        .margin({ left: 20, top: 20 })

      Text("响铃间隔时间（分钟）").fontSize(16).width("100%").textAlign(TextAlign.Start).margin({top:10})
      Row() {
        Slider({
          value:this.value1,
          min:0,
          max:30,
          step:1,
          style:SliderStyle.OutSet
        })
          .blockColor(Color.Blue)
          .trackColor(Color.Gray)
          .selectedColor(Color.Blue)
          .showSteps(true)
          .showTips(false)
          .onChange((value: number) => {
            this.value1=value;

          }).width("93%")
        Text(Math.floor(this.value1)+"").fontSize(16)
      }

      Text("重复响铃次数").fontSize(16).width("100%").textAlign(TextAlign.Start).margin({ top: 10 })
      Row() {
        Slider({
          value:this.value2,
          min:0,
          max:10,
          step:1,
          style:SliderStyle.OutSet
        })
          .blockColor(Color.Blue)
          .trackColor(Color.Gray)
          .selectedColor(Color.Blue)
          .showSteps(true)
          .showTips(false)
          .onChange((value: number) => {
            this.value2=value;

          }).width("93%")
        Text(this.value2+"").fontSize(16)
      }


      Divider().color(Color.Grey).opacity(0.1).margin({ top: 10 })
      Flex() {
        Text("取消").layoutWeight(1).height(50).textAlign(TextAlign.Center).onClick(() => {
          this.controller.close();
        })
        Line().height(50).width(1).backgroundColor(Color.Grey).opacity(0.1)
        Text("确定").layoutWeight(1).height(50).textAlign(TextAlign.Center).onClick(() => {
          this.controller.close();
          this.alarmItem.intervalMinute=this.value1;
          this.alarmItem.intervalTimes=this.value2;
        })
      }.height(50)

    }.padding({ left: 10, right: 10 })

  }


}