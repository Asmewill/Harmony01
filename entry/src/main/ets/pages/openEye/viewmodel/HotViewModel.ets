
import defaultAppManager from '@ohos.bundle.defaultAppManager';
import { BaseViewModel } from './BaseViewModel';


interface TabItem{
  index:number,
  title:string,
  rankType:string
}


export class HotViewModel extends BaseViewModel{
  tabTitle:TabItem[]=[
    {
      index:0,
      title:"周排行",
      rankType: "weekly"
    },
    {
      index:1,
      title:"月排行",
      rankType: "monthly"
    },
    {
      index:2,
      title:"总排行",
      rankType: "historical"
    }
  ]
}
export default new HotViewModel()