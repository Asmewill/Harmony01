import {AxiosError,AxiosRequestHeaders,AxiosResponse}   from '@ohos/axios';
import { hideLoadingDialog, showLoadingDialog } from '../utils/DialogUtils';
import { LogUtils } from '../utils/LogUtils';
import showToast from '../utils/ToastUtils';
import AxiosHttpRequest, { HttpRequestConfig } from './AxiosHttp';


export  const axiosClient=new AxiosHttpRequest({
  baseURL:"/api",
  timeout:10*1000,
  checkResultCode:false,
  headers:{
    "Content-Type": "application/json"
  } as AxiosRequestHeaders,
  interceptorHooks:{
    requestInterceptor:async(config:HttpRequestConfig)=>{
      LogUtils.debug("网络请求Request请求方法：",`${config.method}`)
      LogUtils.debug("网络请求Request请求链接：",`${config.url}`)
      LogUtils.debug("网络请求Request Params:",`${JSON.stringify(config.params)}`)
      LogUtils.debug("网络请求Request Data:",`${JSON.stringify(config.data)}`)
      axiosClient.config.showLoading=config.showLoading
      if(config.showLoading){
        //发送Eventbus通知
        showLoadingDialog("加载中...")
      }
      return config;
    },
    requestInterceptorCatch:(error)=>{
      LogUtils.error("网络请求RequestError",error.toString())
      if(axiosClient.config.showLoading){
        hideLoadingDialog()
      }
      return error;
    },
    responseInterceptor:(response:AxiosResponse)=>{
      //优先执行自己的请求响应拦截器，在执行通用请求request的
      if(axiosClient.config.showLoading||axiosClient.config.showLoading==undefined){
        hideLoadingDialog()
      }
      LogUtils.debug("网络请求响应Response:",`\n${JSON.stringify(response.data)}`)
      if(response.status===200){
        return Promise.resolve(response.data);
      }else{
        return Promise.reject(response);
      }
    },
    responseInterceptorCatch:(error:any)=>{
      if(axiosClient.config.showLoading){
        hideLoadingDialog();
      }
      errorHandler(error)
      return Promise.reject(error)
    }
  }
})



export  function errorHandler(error:any){
  if(error instanceof AxiosError){
    showToast(error.message)
  }else if(error!=undefined && error.response!=undefined && error.response.status){
    switch(error.response.status){
    // 401: 未登录
    // 未登录则跳转登录页面，并携带当前页面的路径
    // 在登录成功后返回当前页面，这一步需要在登录页操作。
      case 401:
        break;
    // 403 token过期
    // 登录过期对用户进行提示
    // 清除本地token和清空vuex中token对象
    // 跳转登录页面
      case 403:
        showToast("登录过期,请重新登录")
      // 清除token
      // localStorage.removeItem('token');
        break;
    // 404请求不存在
      case 404:
        showToast("网络请求不存在")
        break;
    //其他错误，直接抛出错误提示
      default:
        showToast(error.response.data.message)
    }
  }
}