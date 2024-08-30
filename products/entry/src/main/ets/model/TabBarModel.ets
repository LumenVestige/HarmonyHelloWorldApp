export interface TabBarData {
  id: TabBarType;
  title: ResourceStr;
  activeIcon: ResourceStr;
  defaultIcon: ResourceStr;
}

export enum TabBarType {
  HOME = 0,
  CATEGORY,
  MINE
}

export const TabsInfo: TabBarData[] = [
  {
    id: TabBarType.HOME,
    title: $r('app.string.tab_home'),
    activeIcon: $r('app.media.home_selected'),
    defaultIcon: $r('app.media.home_normal')
  },
  {
    id: TabBarType.CATEGORY,
    title: $r('app.string.category'),
    activeIcon: $r('app.media.sorter_selected'),
    defaultIcon: $r('app.media.sorter_normal')
  },
  {
    id: TabBarType.MINE,
    title: $r('app.string.mine'),
    activeIcon: $r('app.media.mine_selected'),
    defaultIcon: $r('app.media.mine_normal')
  }
]