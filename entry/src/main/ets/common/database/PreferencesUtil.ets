
import preferences from '@ohos.data.preferences';
import AlarmItem from '../../viewmodel/AlarmItem';

import { GlobalContext } from '../utils/GlobalContext';

const KEY_APP_FONT_SIZE="appFontSize";
const PREFERENCES_NAME="myPreferences"
const ALARM_LIST_DATA="alarm_list_data";

export class PreferencesUtil{

  //创建Preferences
  createFontPreferences(context:Context){

    let preferencesFunction:Function=()=>{ //函数体
      //获取Promise<preferences.Preferences> 对象
      let preferencesInstance:Promise<preferences.Preferences>=preferences.getPreferences(context,PREFERENCES_NAME)
      //返回Promise<preferences.Preferences>对象
      return preferencesInstance;
    }
    //保存一个函数
    GlobalContext.getContext().setObject("getFontPreferences",preferencesFunction)
  }


  saveChangeFontSize(fontSize:number){
    let preferencesFunction:Function = GlobalContext.getContext().getObject("getFontPreferences") as Function;
    preferencesFunction().then(async (preferences:preferences.Preferences)=>{
      //通过系统preferences存储
      await preferences.put(KEY_APP_FONT_SIZE,fontSize);
      preferences.flush();
    }).catch((error:Error)=>{
      console.log("error:"+error.message);
    })
  }

  async  getChangeFontSize(){
    let fontSize:number=0;
    let preferencesFunction:Function=GlobalContext.getContext().getObject("getFontPreferences") as Function;
    //获取preferencesFunction要异步操作，通过get获取appFontSize也要异步操作
    fontSize= await (await preferencesFunction()).get(KEY_APP_FONT_SIZE,fontSize);
    return fontSize;
  }



}
export default new PreferencesUtil();