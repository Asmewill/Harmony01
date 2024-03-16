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
export default struct DurationDialog {
  @Consume(CommonConstants.DEFAULT_PROVIDER_KEY) alarmItem: AlarmItem;
  private title:string;
  array:number[]=CommonConstants.RING_DURATION;

  controller:CustomDialogController=new CustomDialogController({
    builder:DurationDialog(),
    autoCancel:true
  })

  aboutToAppear(){

  }


  build() {
    Column(){

      Text("闹铃时长").fontSize(20).width("100%").fontColor("#182431")
        .margin({ left:20,top:20 })

      ForEach(this.array,(item:number,index:number)=>{
        Row(){
          Text(item+" 分钟").layoutWeight(1).fontSize(18)

          Radio({value:item.toString(),group:"radioGroup"}).onChange(()=>{
            this.alarmItem.duration=item
          }).checked(item==this.alarmItem.duration)

        }.margin({top:10,left:10,right:10})

      })

      Divider().color(Color.Grey).opacity(0.1).margin({top:10})
      Flex(){
        Text("取消").layoutWeight(1).height(50).textAlign(TextAlign.Center).onClick(()=>{
           this.controller.close();
        })
        Line().height(50).width(1).backgroundColor(Color.Grey).opacity(0.1)
        Text("确定").layoutWeight(1).height(50).textAlign(TextAlign.Center).onClick(()=>{
          this.controller.close();
        })
      }.height(50)

    }.padding({left:10,right:10})

  }



}