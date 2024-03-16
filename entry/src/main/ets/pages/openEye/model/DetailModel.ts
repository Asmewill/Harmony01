export class DetailModel {
    adExist: boolean;
    count: number;
    itemList: ItemList[];
    total: number;
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
    homepage: string;
}

export class Provider {
    alias: string;
    icon: string;
    name: string;
}

export class Tags {
    actionUrl: string;
    bgPicture: string;
    communityIndex: number;
    desc: string;
    haveReward: boolean;
    headerImage: string;
    id: number;
    ifNewest: boolean;
    name: string;
    tagRecType: string;
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
    playInfo: any[];
    playUrl: string;
    played: boolean;
    provider: Provider;
    reallyCollected: boolean;
    releaseTime: number;
    resourceType: string;
    searchWeight: number;
    subtitles: any[];
    tags: Tags[];
    title: string;
    titlePgc: string;
    type: string;
    webUrl: WebUrl;
}

export class ItemList {
    adIndex: number;
    data: Data;
    id: number;
    type: string;
}