import showToast from '../utils/ToastUtils'
@CustomDialog
export struct CommonDialog {
  //弹窗控制器
  customDialogController: CustomDialogController
  title:string="标题";
  content:string="this is content...";

  cancel:string="cancel"
  sure:string="sure"
  build() {
    Stack() {
      Column() {
        Text(this.title).fontSize(14).fontColor(Color.Black).height(45).fontColor(Color.Red)
        Divider().strokeWidth(0.5).color(Color.Gray).opacity(0.1)
        Text(this.content).padding(20)
        Divider().strokeWidth(0.5).color(Color.Gray).opacity(0.1)
        Row() {
          Text(this.cancel).height(45).layoutWeight(1).fontColor(Color.Black).fontSize(14).onClick(() => {
            this.customDialogController.close()
          }).textAlign(TextAlign.Center)
          Text(this.sure).height(45).layoutWeight(1).fontColor(Color.Black).fontSize(14).onClick(() => {
            this.customDialogController.close()
          }).textAlign(TextAlign.Center)
        }
      }
    }

  }
}