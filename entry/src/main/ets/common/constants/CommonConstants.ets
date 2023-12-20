
import display from '@ohos.display';
import ClassifyModel from '../../viewmodel/AnimationMode';
import { GlobalContext } from '../utils/GlobalContext';

let deviceDisplay:display.Display=GlobalContext.getContext().getObject("display") as display.Display;

export default   class CommonConstants{
  /**
   * The index page message
   */
  static readonly INDEX_MESSAGE:string='Index Page';

  /**
   * The src msg.
   */
  static  readonly SECOND_SRC_MSG:string='Index页面传来的数据'
  /**
   * The second page url.
   */
  static  readonly  SECOND_URL:string ='pages/SecondPage'
  /**
   * The second page message.
   */
  static  readonly  SECOND_MESSAGE:string='Second Page'

  /**
   * The src param.
   */
  static readonly SECOND_SRC_PARAM: string = 'src';

  /**
   * Full the width.
   */
  static readonly FULL_WIDTH: string = '100%';

  /**
   * Full the height.
   */
  static readonly FULL_HEIGHT: string = '100%';

  /**
   * The hello world font size.
   */
  static readonly FONT_SIZE: string = '38fp';

  /**
   * The param font size.
   */
  static readonly PARAMS_FONT_SIZE: string = '20fp';

  /**
   * The button font size.
   */
  static readonly BUTTON_FONT_SIZE: string = '16fp';

  /**
   * The button width.
   */
  static readonly BUTTON_WIDTH: string = '296vp';

  /**
   * The button height.
   */
  static readonly BUTTON_HEIGHT: string = '40vp';

  /**
   * The layout height.
   */
  static readonly LAYOUT_HEIGHT: string = '140vp';

  /**
   * The param opacity.
   */
  static readonly PARAMS_OPACITY: number = 0.6;
  /**
   * Input length of the account.
   */
  static readonly INPUT_ACCOUNT_LENGTH = 11;

  /**
   *  Input length of the password.
   */
  static readonly INPUT_PASSWORD_LENGTH = 8;

  /**
   *  Left padding of the input box
   */
  static readonly INPUT_PADDING_LEFT = 0;

  /**
   * Delay time of simulated login
   */
  static readonly LOGIN_DELAY_TIME = 2000;

  /**
   * Common Spacing of Components
   */
  static readonly COMMON_SPACE = 12;

  /**
   * Title text of the home page
   */
  static readonly HOME_TITLE = '首页';

  /**
   * Title text of the setting page
   */
  static readonly MINE_TITLE = '我的';

  /**
   * Spacing of other login methods
   */
  static readonly LOGIN_METHODS_SPACE = 44;

  /**
   * The width or height of the component is spread across the parent component.
   */
  static readonly FULL_PARENT = '100%';

  /**
   * The width of setting list
   */
  static readonly SET_LIST_WIDTH = '42%';

  /**
   * Home tab index
   */
  static readonly HOME_TAB_INDEX = 0;

  /**
   * Mine tab index
   */
  static readonly MINE_TAB_INDEX = 1;


  /**
   * Date dialog start time.
   */
  static readonly START_TIME: string = '1900-1-1';

  /**
   * Date dialog select time.
   */
  static readonly SELECT_TIME: string = '1990-1-1';

  /**
   * refresh header item feature
   */
  static readonly IMAGE_MODEL_ARRAY:ClassifyModel[]=[
    new ClassifyModel($r("app.media.ic_loading_game"),  (px2vp(deviceDisplay.width)/2 - 30/2)-100,400),
    new ClassifyModel($r("app.media.ic_loading_heart"), (px2vp(deviceDisplay.width)/2 - 30/2)-50,400),
    new ClassifyModel($r("app.media.ic_loading_louder"),(px2vp(deviceDisplay.width)/2 - 30/2)-0,400),
    new ClassifyModel($r("app.media.ic_loading_bag"),   (px2vp(deviceDisplay.width)/2 - 30/2)+50,400),
    new ClassifyModel($r("app.media.ic_loading_file"),  (px2vp(deviceDisplay.width)/2 - 30/2)+100,400),
  ]



}