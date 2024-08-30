import { CommonConstants, ObservedArray } from '@commons/utils';
import { IHotProductViewData } from './HotProductViewData';
import { HomePageConstants } from '../../constants/HomePageConstants';

@Component
export struct HotFeedsView {
  @ObjectLink hotFeedList: ObservedArray<IHotProductViewData>;
  handleClick: (item: IHotProductViewData) => void = () => {
  };

  build() {
    Column({ space: CommonConstants.SPACE_8 }) {
      List() {
        ForEach(this.hotFeedList,
          (item: IHotProductViewData, index: number) => {
            ListItem() {
              FeedFlowItem({ feedItem: item })
                .onClick(() => this.handleClick(item))
            }
            .margin({
              left: index === 0 ? $r('app.float.md_padding_margin') : 0,
              right: index === HomePageConstants.FEEDS_VISIBLE_LENGTH - 1 ? $r('app.float.md_padding_margin') :
              $r('app.float.md_padding_margin')
            })
            .width(HomePageConstants.FEED_CARD_WIDTH_MD)
          }, (item: IHotProductViewData) => item.id)
      }
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
  }
}

@Reusable
@Component
struct FeedFlowItem {
  @Prop feedItem: IHotProductViewData;

  aboutToReuse(params: Record<string, Object>): void {
    this.feedItem = params.feedItem as IHotProductViewData;
  }

  build() {
    Column() {
      Image(this.feedItem.imgSrc)
        .alt($r('app.media.img_placeholder'))
        .borderRadius({
          topLeft: $r('app.float.lg_border_radius'),
          topRight: $r('app.float.lg_border_radius')
        })
        .width(CommonConstants.FULL_PERCENT)
        .height(CommonConstants.FULL_PERCENT)
        .aspectRatio(1.4)

      Text(this.feedItem.title)
        .width(CommonConstants.FULL_PERCENT)
        .fontWeight(FontWeight.Bold)
        .fontSize($r('app.float.md_font_size'))
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(CommonConstants.MAX_LINE_ONE)
        .padding({
          top: $r('app.float.xs_padding_margin'),
          bottom: $r('app.float.xs_padding_margin'),
          left: 8,
          right: $r('app.float.xs_padding_margin')
        })
      Text(this.feedItem.content)
        .width(CommonConstants.FULL_PERCENT)
        .fontSize($r('app.float.md_font_size'))
        .fontColor($r('app.color.hot_feed_content_color'))
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(CommonConstants.MAX_LINE_TWO)
        .padding({
          bottom: 15,
          left: 8,
          right: $r('app.float.xs_padding_margin')
        })

    }
    .width(CommonConstants.FULL_PERCENT)
    .height('auto')
    .backgroundColor($r('app.color.hmos_article_card_color_white'))
    .borderRadius($r('app.float.lg_border_radius'))
  }
}