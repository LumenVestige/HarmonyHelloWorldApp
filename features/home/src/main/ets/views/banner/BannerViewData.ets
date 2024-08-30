export interface IBannerViewData {
  id: string;
  bannerSrc: ResourceStr;
}


export const bannerViewDataSet: IBannerViewData[] = [
  {
    id: "1",
    bannerSrc: $r('app.media.banner_pic1')
  },
  {
    id: "2",
    bannerSrc: $r('app.media.banner_pic2')
  },
  {
    id: "3",
    bannerSrc: $r('app.media.banner_pic3')
  },
  {
    id: "4",
    bannerSrc: $r('app.media.banner_pic4')
  },
  {
    id: "5",
    bannerSrc: $r('app.media.banner_pic5')
  }]