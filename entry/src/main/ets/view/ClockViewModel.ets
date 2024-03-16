
import ReminderService from '../common/database/ReminderService';
import AlarmItem from '../viewmodel/AlarmItem';

export default class ClockViewModel{
  public static instant:ClockViewModel=new ClockViewModel();
  private reminderService:ReminderService;
  private alarms:Array<AlarmItem>;


  constructor() {
    this.alarms=new Array<AlarmItem>();
    this.reminderService=new ReminderService();
    //开启通知
    this.reminderService.openNotificationPermission();
  }
}