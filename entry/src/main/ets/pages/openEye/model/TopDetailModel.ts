import { DataChildModel } from './DataChildModel';
export class TopDetailModel {
    brief: string;
    count: number;
    headerImage: string;
    id: number;
    itemList: ItemList[];
    shareLink: string;
    text: string;
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
    adTrack: any[];
    content: Content;
    dataType: string;
    header: Header;
}

export class Content {
    adIndex: number;
    data: DataChildModel;
    id: number;
    type: string;
}

export class Header {
    actionUrl: string;
    followType: string;
    icon: string;
    iconType: string;
    id: number;
    issuerName: string;
    showHateVideo: boolean;
    tagId: number;
    time: number;
    topShow: boolean;
}

export class ItemList {
    adIndex: number;
    data: Data;
    id: number;
    type: string;
}