export class ItemChildList {
    adIndex: number;
    data: Data;
    id: number;
    type: string;
}

export class Follow {
    followed: boolean;
    itemId: number;
    itemType: string;
}

export class Shield {
    itemId: number;
    itemType: string;
    shielded: boolean;
}

export class Author {
    approvedNotReadyVideoCount: number;
    description: string;
    expert: boolean;
    follow: Follow;
    icon: string;
    id: number;
    ifPgc: boolean;
    latestReleaseTime: number;
    link: string;
    name: string;
    recSort: number;
    shield: Shield;
    videoNum: number;
}

export class Consumption {
    collectionCount: number;
    realCollectionCount: number;
    replyCount: number;
    shareCount: number;
}

export class Cover {
    blurred: string;
    detail: string;
    feed: string;
}

export class UrlList {
    name: string;
    size: number;
    url: string;
}

export class PlayInfo {
    height: number;
    name: string;
    type: string;
    url: string;
    urlList: UrlList[];
    width: number;
}

export class Provider {
    alias: string;
    icon: string;
    name: string;
}

export class VideoPosterBean {
    fileSizeStr: string;
    scale: number;
    url: string;
}

export class WebUrl {
    forWeibo: string;
    raw: string;
}

export class Data {
    ad: boolean;
    adTrack: any[];
    author: Author;
    category: string;
    collected: boolean;
    consumption: Consumption;
    cover: Cover;
    dataType: string;
    date: number;
    description: string;
    descriptionEditor: string;
    descriptionPgc: string;
    duration: number;
    id: number;
    idx: number;
    ifLimitVideo: boolean;
    labelList: any[];
    library: string;
    playInfo: PlayInfo[];
    playUrl: string;
    played: boolean;
    provider: Provider;
    reallyCollected: boolean;
    releaseTime: number;
    remark: string;
    resourceType: string;
    searchWeight: number;
    subtitles: any[];
    tags: any[];
    title: string;
    titlePgc: string;
    type: string;
    videoPosterBean: VideoPosterBean;
    webUrl: WebUrl;
}