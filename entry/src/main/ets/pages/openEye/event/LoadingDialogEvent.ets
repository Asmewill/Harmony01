
export default  interface  LoadingEvent{
  data:Data;
}
interface Data{
  showLoading:boolean,
  loadingTips:string
}

export function LoadingDialogEvent(showLoading:boolean,loadingTips:string="加载中..."):LoadingEvent{
  return {
    data:{
      "showLoading":showLoading,
      "loadingTips":loadingTips
    }
  }
}