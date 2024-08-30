import { CommonConstants } from '@commons/utils';
import { HomePageConstants } from '../../constants/HomePageConstants';
import { IBannerViewData } from './BannerViewData';


@Component
export struct BannerView {
  @Prop swiperData: IBannerViewData[];
  handleClick: (item: IBannerViewData) => void = () => {
    // ignore
  };
  private swiperController: SwiperController = new SwiperController();
  @State showPrevMargin: boolean = false;
  @State imgHeight: Length = 0;

  build() {
    Stack() {
      Swiper(this.swiperController) {
        ForEach(this.swiperData, (item: IBannerViewData, index: number) => {
          Row() {
            Image(item.bannerSrc)
              .width(CommonConstants.FULL_PERCENT)
              .height(CommonConstants.FULL_PERCENT)
              .borderRadius($r('app.float.lg_border_radius'))
              .onClick(() => this.handleClick(item))
          }
          .aspectRatio(HomePageConstants.SWIPER_ASPECT_RATIO)
          .onAreaChange((oldValue: Area, newValue: Area) => {
            if (index === 0 && !this.showPrevMargin) {
              this.imgHeight = newValue.height;
            }
          })
          .padding({
            left: $r('app.float.md_padding_margin'),
          })
        }, (item: IBannerViewData) => item.id)
      }
      .width(CommonConstants.FULL_PERCENT)
      .displayCount(1)
      .nextMargin(HomePageConstants.SWIPER_MARGIN_MD)
      .width(CommonConstants.FULL_PERCENT)
      .autoPlay(true)
      .loop(true)

      Column()
        .height(this.imgHeight)
        .width($r('app.float.md_padding_margin'))
        .backgroundColor($r('app.color.common_background_color'))
    }
    .alignContent(Alignment.Start)
  }
}

