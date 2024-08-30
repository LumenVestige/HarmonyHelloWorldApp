import { CommonConstants, LazyDataSource } from '@commons/utils';
import { IPremiumProductViewData, premiumProductViewDataSet } from './PremiumProductViewData';


@Component
export struct PremiumProductView {
  @Prop articlesDataSource: LazyDataSource<IPremiumProductViewData>;

  build() {
    Column() {
      List({ space: CommonConstants.SPACE_12 }) {
        LazyForEach(this.articlesDataSource,
          (item: IPremiumProductViewData, index: number) => {
            ListItem() {
              ArticleCardView({
                articleItem: item,
              }).reuseId('product')
            }
            .padding({ right: $r('app.float.md_padding_margin') })
          }, (item: IPremiumProductViewData, index: number) => JSON.stringify(item) + index)

      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .nestedScroll({
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      })
    }
    .padding({
      left: 8,
      right: 8
    })
  }
}

@Reusable
@Component
export struct ArticleCardView {
  @Prop articleItem: IPremiumProductViewData

  aboutToReuse(params: Record<string, Object>): void {
    this.articleItem = params.articleItem as IPremiumProductViewData;
  }

  build() {
    Row({ space: CommonConstants.SPACE_16 }) {

      Column() {
        Text(this.articleItem.title)
          .fontWeight(FontWeight.Bold)
          .fontSize($r('app.float.md_font_size'))
          .fontFamily(CommonConstants.HARMONY_HEI_TI_FONT_FAMILY)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .opacity(CommonConstants.FIRST_LEVEL_OPACITY)
          .maxLines(CommonConstants.MAX_LINE_TWO)
          .margin({ bottom: $r('app.float.xs_padding_margin') })

        Text(this.articleItem.content)
          .fontSize($r('app.float.md_font_size'))
          .fontFamily(CommonConstants.HARMONY_HEI_TI_FONT_FAMILY)
          .opacity(CommonConstants.SECOND_LEVEL_OPACITY)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textAlign(TextAlign.Start)
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)
      .height(CommonConstants.FULL_PERCENT)
      .layoutWeight(1)


      Image(this.articleItem.imgSrc)
        .interpolation(ImageInterpolation.High)
        .height($r('app.float.article_card_image_height'))
        .width($r('app.float.article_card_image_width'))
        .borderRadius($r('app.float.md_border_radius'))
        .alt($r('app.media.img_placeholder'))
        .objectFit(ImageFit.Cover)
    }
    .padding({
      top: $r('app.float.md_padding_margin'),
      left: $r('app.float.md_padding_margin'),
      right: $r('app.float.md_padding_margin'),
      bottom: $r('app.float.xs_padding_margin')
    })
    .borderRadius($r('app.float.lg_border_radius'))
    .backgroundColor($r('app.color.hmos_article_card_color_white'))
    .alignItems(VerticalAlign.Center)
    .width(CommonConstants.FULL_PERCENT)
    .height($r('app.float.article_card_height'))
  }
}