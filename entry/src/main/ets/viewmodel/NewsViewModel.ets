
import CommonConstants from '../common/constants/CommonConstants';
import { httpRequestGet } from '../common/utils/HttpUtil';


class NewsViewModel{
  /**
   * Get news type list from server.
   *
   * @return NewsTypeBean[] newsTypeList
   */
  getNewsTypeList():Promise<NewsTypeBean[]>{
    return new Promise((resolve:Function)=>{
      let url=CommonConstants.SERVER+"/"+CommonConstants.GET_NEWS_TYPE;
      httpRequestGet(url).then((data:ResponseResult)=>{
        if(data.code==="success"){
          resolve(data.data);
        }else{
          resolve(CommonConstants.TabBars_DEFAULT_NEWS_TYPES);//如果返回失败,给予默认数组
        }
      }).catch(()=>{
        resolve(CommonConstants.TabBars_DEFAULT_NEWS_TYPES);
      })
    })
  }


  getDefaultTypeList():NewsTypeBean[]{
    return CommonConstants.TabBars_DEFAULT_NEWS_TYPES;
  }
}
export default  new NewsViewModel();


export class NewsTypeBean{
  id: number =0;
  name: ResourceStr = '';
}



export class ResponseResult {
  /**
   * Code returned by the network request: success, fail.
   */
  code: string;

  /**
   * Message returned by the network request.
   */
  msg: string | Resource;

  /**
   * Data returned by the network request.
   */
  data: string | Object | ArrayBuffer;

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}