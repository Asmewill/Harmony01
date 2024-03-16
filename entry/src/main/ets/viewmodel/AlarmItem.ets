
import DayItem from './DayItem';
import ReminderItem from './ReminderItem';


export default class AlarmItem extends ReminderItem{
  name:string="闹钟";
  isOpen:boolean=true;
  isRepeat:boolean=false;
  duration:number=5;
  intervalMinute:number=10;
  intervalTimes:number=3;
  ampm:string="";
  repeatDayList:Array<DayItem>=[];


}