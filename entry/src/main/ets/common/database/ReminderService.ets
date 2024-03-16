
import notificationManager from '@ohos.notificationManager';
import Logger from '../utils/Logger';

export default class ReminderService{


  public openNotificationPermission() {
    notificationManager.requestEnableNotification().then(() => {
      Logger.info('Enable notification success');
    }).catch((err: Error) => {
      Logger.error('Enable notification failed because ' + JSON.stringify(err));
    });
  }


}