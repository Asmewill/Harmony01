
import CommonConstants from '../common/constants/CommonConstants';
import { httpRequestGet } from '../common/utils/HttpUtil';
import Logger from '../common/utils/Logger';


class NewsViewModel{
  /**
   * Get news type list from server.
   *
   * @return NewsTypeBean[] newsTypeList
   */
  getNewsTypeList():Promise<NewsTypeBean[]>{
    return new Promise((resolve:Function,reject:Function)=>{
      let url=CommonConstants.SERVER+"/"+CommonConstants.GET_NEWS_TYPE;
      Logger.info("NewsViewModel","请求URL:"+url)
      httpRequestGet(url).then((data:ResponseResult)=>{
        Logger.info("NewsViewModel","请求result:"+JSON.stringify(data))
        if(data.code==="success"){
          resolve(data.data);
        }else{
          //resolve(CommonConstants.TabBars_DEFAULT_NEWS_TYPES);//如果返回失败,给予默认数组
          reject(data.msg)
        }
      }).catch((error:Error)=>{
        Logger.info("NewsViewModel","请求result:"+"Error")
        reject("Error:"+JSON.stringify(error));
      //  resolve(CommonConstants.TabBars_DEFAULT_NEWS_TYPES);
      })
    })
  }


  getDefaultTypeList():NewsTypeBean[]{
    return CommonConstants.TabBars_DEFAULT_NEWS_TYPES;
  }


  getNewsList(currentPage:number,pageSize:number,path:string):Promise<NewsData[]>{
    return new Promise(async(resolve:Function,reject:Function)=>{
      let url=CommonConstants.SERVER+"/"+path;
      url+="?currentPage="+currentPage+"&pageSize="+pageSize;
      httpRequestGet(url).then((data:ResponseResult)=>{
        if(data.code==="success"){
          resolve(data.data);
        }else{
          reject($r("app.string.page_none_msg"))
        }
      }).catch((error:Error)=>{
        Logger.error("getNewsList failed",JSON.stringify(error));
        reject($r("app.string.http_error_message"));
      })
    })
  }
}

export default  new NewsViewModel();


export class NewsData{
  title:string="";
  content:string="";
  imagesUrl:Array<NewsFile>=[new NewsFile()];
  source:string="";
}


export class NewsFile{
  id:number=0;
  url:string="";
  type:number=0;
  newsId:number=0;
}


export class NewsTypeBean{
  id: number =0;
  name: ResourceStr = '';
}

export class ResponseResult {
  code: string;
  msg: string | Resource;
  data: string | Object | ArrayBuffer;
  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}


@Observed
export  class LayoutItem{
  isVisible:boolean;
  imageSrc:Resource;
  textValue:Resource;
  heightValue:number;

  constructor(isVisible:boolean,imageSrc:Resource,textValue:Resource,heightValue:number) {
    this.isVisible=isVisible;
    this.imageSrc=imageSrc;
    this.textValue=textValue;
    this.heightValue=heightValue;
  }




}