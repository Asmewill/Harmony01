
import preferences from '@ohos.data.preferences';
import { GlobalContext } from '../utils/GlobalContext';

const KEY_APP_FONT_SIZE="appFontSize";


export class PreferencesUtil{

  saveChangeFontSize(fontSize:number){
    let getFontPreferences:Function = GlobalContext.getContext().getObject("fontPreference") as Function;
    getFontPreferences().then(async (preferences:preferences.Preferences)=>{
      //通过系统preferences存储
      await preferences.put(KEY_APP_FONT_SIZE,fontSize);
      preferences.flush();
    }).catch((error:Error)=>{

    })

  }

}
export default new PreferencesUtil();