
import reminderAgentManager from '@ohos.reminderAgentManager';


export default class ReminderItem{
  id:number=0;
  remindType: reminderAgentManager.ReminderType = reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM;
  name: string = '';
  hour: number = 0;
  minute: number = 0;
  duration: number = 0;
  intervalMinute: number = 0;
  intervalTimes: number = 0;
  repeatDays: Array<number> = [];
  notificationId: number = 0;

}