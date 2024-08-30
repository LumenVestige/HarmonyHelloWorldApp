export interface IPremiumProductViewData {
  id: string;
  imgSrc: ResourceStr;
  title: ResourceStr;
  content: ResourceStr;
}


export const premiumProductViewDataSet: IPremiumProductViewData[] = [
  {
    id: "1",
    imgSrc: $r('app.media.tutorial_pic1'),
    title: $r('app.string.enablement_title'),
    content: $r('app.string.enablement_content'),
  },
  {
    id: "2",
    imgSrc: $r('app.media.tutorial_pic2'),
    title: $r('app.string.enablement_title'),
    content: $r('app.string.enablement_content'),
  },
  {
    id: "3",
    imgSrc: $r('app.media.tutorial_pic3'),
    title: $r('app.string.enablement_title'),
    content: $r('app.string.enablement_content'),
  },
  {
    id: "4",
    imgSrc: $r('app.media.tutorial_pic4'),
    title: $r('app.string.enablement_title'),
    content: $r('app.string.enablement_content'),
  },
  {
    id: "5",
    imgSrc: $r('app.media.tutorial_pic5'),
    title: $r('app.string.enablement_title'),
    content: $r('app.string.enablement_content'),
  },
  {
    id: "6",
    imgSrc: $r('app.media.tutorial_pic6'),
    title: $r('app.string.enablement_title'),
    content: $r('app.string.enablement_content'),
  }]