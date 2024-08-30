import { CommonConstants, LazyDataSource } from '@commons/utils';
import { BannerView } from '../views/banner/BannerView'
import { bannerViewDataSet } from '../views/banner/BannerViewData';
import { HotFeedsView } from '../views/hot/HotProductView';
import { hotProductViewDataSet } from '../views/hot/HotProductViewData';
import { PremiumProductView } from '../views/premium/PremiumProductView';
import { IPremiumProductViewData, premiumProductViewDataSet } from '../views/premium/PremiumProductViewData';


@Component
export struct HomePage {
  @State message: string = 'HomeComponent';

  @Builder
  feedTitleBuilder() {
    Row() {
      Text($r('app.string.hot_products'))
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontWeight(FontWeight.Bold)
        .fontWeight(FontWeight.Medium)
        .fontFamily(CommonConstants.HARMONY_HEITI_MEDIUM_FONT_FAMILY)
    }
    .alignItems(VerticalAlign.Center)
    .padding({
      right: $r('app.float.xxl_padding_margin'),
      left: $r('app.float.xxl_padding_margin'),
      top: $r('app.float.sm_padding_margin'),
      bottom: $r('app.float.sm_padding_margin')
    })
    .width(CommonConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  premiumProductsTitleBuilder() {
    Text($r('app.string.premium_products'))
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width(CommonConstants.FULL_PERCENT)
      .fontFamily(CommonConstants.HARMONY_HEITI_MEDIUM_FONT_FAMILY)
      .fontWeight(FontWeight.Medium)
      .padding({
        right: $r('app.float.xxl_padding_margin'),
        left: $r('app.float.xxl_padding_margin'),
        top: $r('app.float.sm_padding_margin'),
        bottom: $r('app.float.sm_padding_margin')
      })
  }

  build() {
    Navigation() {
      Column() {
        Row() {
          Text($r('app.string.home_label'))
            .fontSize($r('app.float.header_font_size'))
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start)
            .fontFamily(CommonConstants.HARMONY_HEITI_BOLD_FONT_FAMILY)
            .margin({ right: $r('app.float.sm_padding_margin') })
        }
        .padding({ left: $r('app.float.xxl_padding_margin'), right: $r('app.float.lg_padding_margin') })
        .justifyContent(FlexAlign.SpaceBetween)
        .width(CommonConstants.FULL_PERCENT)
        .height($r('app.float.top_navigation_height'))

        List({ space: CommonConstants.SPACE_16 }) {
          ListItem() {
            BannerView({
              swiperData: bannerViewDataSet
            })
          }

          ListItemGroup({ header: this.feedTitleBuilder() }) {
            HotFeedsView({
              hotFeedList: hotProductViewDataSet
            })
          }

          ListItemGroup({ header: this.premiumProductsTitleBuilder() }) {
            PremiumProductView({
              articlesDataSource: new LazyDataSource<IPremiumProductViewData>(premiumProductViewDataSet)
            })
          }
        }
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .height(CommonConstants.FULL_PERCENT)
        .width(CommonConstants.FULL_PERCENT)

      }
      .padding({
        top: AppStorage.get<number>('statusBarHeight')
      })
      .height(CommonConstants.FULL_PERCENT)
      .width(CommonConstants.FULL_PERCENT)
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}


