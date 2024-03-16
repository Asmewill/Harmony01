import { getHomeListAxios } from '../http/apiService';
import { HomeModel, ItemList } from '../model/HomeModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';


export class HomeViewModel extends BaseViewModel {
  private date: string = ""
  revertDate() {
    this.date = ""
  }
  getDate() {
    return this.date;
  }

  async getHomeList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getHomeListAxios(this.date), this.date == "" ? true : false)
      .then((result: HomeModel) => {
        //filter((temp)=>{ temp.type=="video"})这样写,将不会返回 数组列表
        let tempList:ItemList[]=result.issueList[0].itemList.filter((temp)=>(temp.type=="video"||temp.type=="banner2"));
        resultCallback?.(tempList)
        //下一页的日期
        this.spliteData(result.nextPageUrl)
      })
  }

  private spliteData(nextUrl:string){
    let split=nextUrl.split("?");
    let split2=split[1];
    let split3=split2.split("&");
    let split4=split3[0].split("=");
    this.date=split4[1];
  }
}

export default new HomeViewModel();