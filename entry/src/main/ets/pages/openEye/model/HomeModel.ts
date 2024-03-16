export class HomeModel {
    issueList: IssueList[];
    newestIssueType: string;
    nextPageUrl: string;
    nextPublishTime: number;

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
    actionUrl: string;
    ad: boolean;
    adTrack: any[];
    author: Author;
    autoPlay: boolean;
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
    image: string;
    labelList: any[];
    library: string;
    playInfo: any[];
    playUrl: string;
    played: boolean;
    provider: Provider;
    reallyCollected: boolean;
    releaseTime: number;
    remark: string;
    resourceType: string;
    searchWeight: number;
    shade: boolean;
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

export class IssueList {
    count: number;
    date: number;
    itemList: ItemList[];
    publishTime: number;
    releaseTime: number;
    type: string;
}