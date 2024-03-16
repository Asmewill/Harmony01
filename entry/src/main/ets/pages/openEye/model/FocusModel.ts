import { ItemChildList } from './ItemChildList';
export class FocusModel {
    adExist: boolean;
    count: number;
    itemList: ItemList[];
    lastStartId: number;
    nextPageUrl: string;
    refreshCount: number;
    total: number;
}

export class Follow {
    followed: boolean;
    itemId: number;
    itemType: string;
}

export class Header {
    actionUrl: string;
    description: string;
    expert: boolean;
    follow: Follow;
    icon: string;
    iconType: string;
    id: number;
    ifPgc: boolean;
    ifShowNotificationIcon: boolean;
    title: string;
    uid: number;
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
    count: number;
    dataType: string;
    header: Header;
    itemList: ItemChildList[];
}

export class ItemList {
    adIndex: number;
    data: Data;
    id: number;
    type: string;
}