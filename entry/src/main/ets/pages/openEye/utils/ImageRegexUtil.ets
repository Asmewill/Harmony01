

const regex=/^(https?:\/\/)img\.(.*)$/
const replacement="$1ali-img.$2"
const ImageRegexUtils = (imageUrl:string|undefined)=>{
  if(imageUrl===undefined){
    return ""
  }
  return imageUrl.replace(regex,replacement)
}
export default  ImageRegexUtils