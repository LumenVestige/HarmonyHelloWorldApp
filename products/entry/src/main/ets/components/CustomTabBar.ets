/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ConfigurationConstant } from '@kit.AbilityKit';
import { AppConstants } from '../constants/AppConstants';
import { TabBarData, TabBarType, TabsInfo } from '../model/TabBarModel';

@Component
export struct CustomTabBar {
  @Link currentIndex: TabBarType;
  @StorageProp('naviIndicatorHeight') naviIndicatorHeight: number = 0;

  onChange(index: TabBarType): void {
    this.currentIndex = index;
  }

  build() {
    Flex({
      direction: FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround
    }) {
      ForEach(TabsInfo, (item: TabBarData) => {
        TabItem({
          index: item.id,
          selectedIndex: this.currentIndex,
          onChange: (index: number) => this.onChange(index)
        })
      }, (item: TabBarData) => item.id.toString())
    }
    .border({
      width: {
        top: $r('app.float.tab_border_width')
      },
      color: $r('sys.color.ohos_id_color_text_field_sub_bg')
    })
    .padding({ bottom: this.naviIndicatorHeight })
    .clip(false)
    .backgroundColor($r('app.color.hmos_article_card_color_white'))
    .height(AppConstants.TAB_HEIGHT + (this.naviIndicatorHeight || 0))
    .width(AppConstants.FULL_PERCENT)
  }
}

@Component
struct TabItem {
  @Prop index: number
  @Prop selectedIndex: number;
  @State showAnimation: boolean = false;
  onChange: (index: number) => void = () => {
  };
  private mainRenderingSettings: RenderingContextSettings = new RenderingContextSettings(true);
  private mainCanvasRenderingContext: CanvasRenderingContext2D =
    new CanvasRenderingContext2D(this.mainRenderingSettings);

  build() {
    Column() {
      Image(this.selectedIndex === this.index ? TabsInfo[this.index].activeIcon :
      TabsInfo[this.index].defaultIcon)
        .size({ width: $r('app.float.tab_img_size'), height: $r('app.float.tab_img_size') })
        .margin({ top: 0 })
      Text(TabsInfo[this.index].title)
        .fontSize($r('app.float.tab_font_size'))
        .margin({ top: $r('app.float.tab_title_margin') })
        .fontWeight(AppConstants.TAB_FONT_WEIGHT)
        .fontColor(this.index === this.selectedIndex ?
        $r('sys.color.ohos_id_color_bottom_tab_text_on') :
        $r('sys.color.ohos_id_color_bottom_tab_text_off'))
    }
    .clip(false)
    .padding({ left: $r('app.float.ss_padding_margin'), right: $r('app.float.ss_padding_margin') })
    .layoutWeight(1)
    .size({ height: AppConstants.FULL_PERCENT }
    )
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      if (this.selectedIndex !== this.index) {
        this.showAnimation = true;
        this.onChange(this.index);
        setTimeout(() => {
          this.showAnimation = false;
        }, 300)
      }
    })
  }
}