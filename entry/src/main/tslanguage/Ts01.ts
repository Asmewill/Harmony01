//第一种形式
let a:Function=function():void{
}
//第二种形式
function b():Function{
  return function(string):void{

  }
}
let c:Function=b();
c();
//第三种形式 箭头函数 箭头函数
let d:(para:string) =>void;
let d1:(para:string)=>{}
let d2=function(){};
let d3=function (para:string){}

//第四种形式 类型别名 箭头函数
type e=(para:string)=>string;
const f:e=function (pass:string):string{
  return pass;
}

//第五种形式 接口
interface g{
  (para:string):string;

}
//g("1");

const h:g=function (pars:string):string{
  return pars;
}
h("1")




class Ts01{

  //在 TypeScript 类中不能使用 let 关键字的原因是因为类的成员变量必须在类的作用域内声明，并且它们的可见性是整个类范围内的。
  //let 方法名: (参数类型) => 返回类型 = function(方法类型): 返回类型{ 方法体}
  //   let lamAdd: (x: number, y: number) => number
  //   = function (x: number, y: number): number {
  //   return x + y;
  // }

  test(){
    if(a instanceof   Function){
      return true;
    }else{
      return false;
    }
    for(let i=0; i<10; i++){
      console.log(i.toString());
    }
  }





  // 所有的对象都被当作 true。
  // 当且仅当字符串为空时，该字符串被当作 false。
  // null 和 undefined 被当作 false。
  // 当且仅当数字为零（0）时，该数字被当作 false。
  // if(event){
  //
  // }


}