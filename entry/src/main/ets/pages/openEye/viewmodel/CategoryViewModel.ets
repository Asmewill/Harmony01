import defaultAppManager from '@ohos.bundle.defaultAppManager';
import { getCategories } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
import { CategoryModel } from './CategoryModel';


export class CategoryViewModel extends BaseViewModel {
  async getCategoryDataList(callBack?: ResultCallback) {
    await this.httpRequest().promise(getCategories(), true).then((result: CategoryModel[]) => {
      callBack?.(result)
    })
  }
}

export default new CategoryViewModel();