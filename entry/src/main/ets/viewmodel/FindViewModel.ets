
import defaultAppManager from '@ohos.bundle.defaultAppManager';
import { BaseViewModel } from '../pages/openEye/viewmodel/BaseViewModel';


export class FindViewModel extends BaseViewModel{
  tabTitle=[
    {
      index:0,
      title:"关注"
    },
    {
      index:1,
      title:"分类"
    },
    {
      index:2,
      title:"主题"
    }
  ]
}
export default new FindViewModel()