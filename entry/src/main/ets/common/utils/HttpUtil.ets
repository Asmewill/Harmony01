
import http from '@ohos.net.http';
import { ResponseResult } from '../../viewmodel/NewsViewModel';


export  function httpRequestGet(url:string):Promise<ResponseResult>{

  let httpRequest=http.createHttp();
  let responseResult=httpRequest.request(url,{
    method:http.RequestMethod.GET,
    readTimeout:10000,
    header:{
      'Content-Type':"application/json"
    },
    connectTimeout:10000,
    extraData:{}
  })
  let serverData:ResponseResult =new ResponseResult();

  return responseResult.then((value:http.HttpResponse)=>{
    if (value.responseCode === 200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.code === "success") {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = "网络请求失败，请稍后尝试！"+value.responseCode;
    }
    return serverData;

  }).catch(()=>{
    serverData.msg = "网络请求失败，请稍后尝试！";
    return serverData;
  })
}