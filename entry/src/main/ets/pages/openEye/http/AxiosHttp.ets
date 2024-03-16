
import axios, {
  AxiosRequestHeaders,
  InternalAxiosRequestConfig,
  AxiosResponse,
  AxiosInstance,
  AxiosError
} from "@ohos/axios"
import { errorHandler } from './AxiosRequest';
/***
 * 定义接口响应包装类
 */
export interface BaseResponse{
  errorCode:number
  errorMsg:string
}
export interface ApiResponse<T= any> extends BaseResponse{
  //wanAndroid-API响应体
  data:T|any;
  //拓展xxx-API响应体
}
/***
 * 自定义拦截器参数
 * requestInterceptor 拦截器
 * requestInterceptorCatch 拦截器异常捕获
 * responseInterceptor 拦截器响应
 * responseInterceptorCatch 拦截器响应异常捕获
 *
 */
interface InterceptorHooks{
  requestInterceptor?:(config:HttpRequestConfig)=>Promise<HttpRequestConfig>;
  requestInterceptorCatch?:(error:any)=>any;
  responseInterceptor?:(response:AxiosResponse)=>AxiosResponse|Promise<AxiosResponse>;
  responseInterceptorCatch?:(error:any)=>any;
}
//这里主要是高版本的axios中设置拦截器的时候里面的Config属性必须是InternalAxiosRequestConfig，
// 但是InternalAxiosRequestConfig里面的headers是必传，所以在实现的子类我设置成非必传会报错，加了个忽略注解
// @ts-ignore
export interface HttpRequestConfig extends InternalAxiosRequestConfig{
  headers?: AxiosRequestHeaders; //定义请求头
  interceptorHooks?: InterceptorHooks;//定义拦截器
  showLoading?: boolean; //是否展示请求loading
  checkResultCode?: boolean; //是否检验响应结果码
  checkLoginState?: boolean; //校验用户登陆状态
  needJumpToLogin?: boolean ;//是否需要跳转到登陆页面
}
/***
 * 网络请求构造
 * 基于axios框架实现
 */
class AxiosHttpRequest{
  config:HttpRequestConfig;
  interceptorHooks?:InterceptorHooks;
  instance:AxiosInstance;
  constructor(config:HttpRequestConfig) {
    this.config=config;
    this.interceptorHooks=config.interceptorHooks;
    this.instance=axios.create(config)
    this.setupInterceptor()
  }
  setupInterceptor():void{
    this.instance.interceptors.request.use(
      //这里主要是高版本的axios中设置拦截器的时候里面的Config属性必须是InternalAxiosRequestConfig，
      // 但是InternalAxiosRequestConfig里面的headers是必传，所以在实现的子类我设置成非必传会报错，加了个忽略注解
      // @ts-ignore
      this.interceptorHooks?.requestInterceptor,
      this.interceptorHooks?.requestInterceptorCatch,
    );
    this.instance.interceptors.response.use(
      this.interceptorHooks?.responseInterceptor,
      this.interceptorHooks?.responseInterceptorCatch,
    )
  }

  request<T=any>(config:HttpRequestConfig):Promise<T>{
    return new Promise<T>((resolve,reject)=>{
      this.instance.request<any,T>(config)
        .then(res=>{
           resolve(res);
         })
        .catch((err:Error)=>{
          errorHandler(err)
          if(err){
            reject(err)
          }
      })
    })
  }

  get<T = any>(config:HttpRequestConfig):Promise<T>{
    //函数体内部，使用扩展运算符 ... 将 config 对象的属性展开
    //并通过设置 method 属性为 'GET'，来构造一个新的 config 对象
    //然后，通过调用 request 函数，使用新构造的 config 对象发送请求
    return this.request({...config,method:"GET"});
  }

  post<T=any>(config:HttpRequestConfig):Promise<T>{
    return this.request({...config,method:"POST"});
  }

  delete<T=any>(config:HttpRequestConfig):Promise<T>{
    return this.request({...config,method:"DELETE"});
  }

  patch<T=any>(config:HttpRequestConfig):Promise<T>{
    return this.request({...config,method:"PATCH"});
  }
}
export default AxiosHttpRequest





