import { CategoryPage } from '@features/category';
import { HomePage } from '@features/home/src/main/ets/components/HomePage';
import { MinePage } from '@features/mine';
import { CustomTabBar } from '../components/CustomTabBar';
import { AppConstants } from '../constants/AppConstants';
import { TabBarType } from '../model/TabBarModel';

@Entry
@Component
struct Index {
  @State currentIndex: TabBarType = TabBarType.HOME;
  @Provide('appPathStack') appPathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.appPathStack) {
      Stack() {
        Flex({
          direction: FlexDirection.Column,
        }) {
          Tabs({ index: this.currentIndex }) {
            TabContent() {
              HomePage()
            }

            TabContent() {
              CategoryPage()
            }

            TabContent() {
              MinePage()
            }
          }
          .layoutWeight(1)
          .barHeight(0)
          .scrollable(false)
          .onChange((index) => {
            this.currentIndex = index;
          })

          CustomTabBar({ currentIndex: $currentIndex })
        }
        .width(AppConstants.FULL_PERCENT)
        .height(AppConstants.FULL_PERCENT)
        .backgroundColor($r('sys.color.ohos_id_color_sub_background'))
      }
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}