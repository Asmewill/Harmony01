export class TopicModel {
    adExist: boolean;
    count: number;
    itemList: ItemList[];
    nextPageUrl: string;
    total: number;
}

export class Label {
    card: string;
    text: string;
}

export class Data {
    actionUrl: string;
    adTrack: any[];
    autoPlay: boolean;
    dataType: string;
    description: string;
    id: number;
    image: string;
    label: Label;
    labelList: any[];
    shade: boolean;
    title: string;
}

export class ItemList {
    adIndex: number;
    data: Data;
    id: number;
    type: string;
}