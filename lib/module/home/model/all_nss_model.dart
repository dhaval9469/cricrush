import 'package:get/get.dart';

class AllNSSModel {
  double? serverTick;
  NewsSortSeri? newsSortSeri;
  String? mode;

  AllNSSModel({this.serverTick, this.newsSortSeri, this.mode});

  AllNSSModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    newsSortSeri = json['news_sort_seri_new'] != null
        ? NewsSortSeri.fromJson(json['news_sort_seri_new'])
        : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (newsSortSeri != null) {
      data['news_sort_seri_new'] = newsSortSeri!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class NewsSortSeri {
  List<NSSNews>? news;
  List<NSSSort>? sort;
  List<NSSSeries>? series;

  NewsSortSeri({this.news, this.sort, this.series});

  NewsSortSeri.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <NSSNews>[];
      json['news'].forEach((v) {
        news!.add(NSSNews.fromJson(v));
      });
    }
    if (json['sort'] != null) {
      sort = <NSSSort>[];
      json['sort'].forEach((v) {
        sort!.add(NSSSort.fromJson(v));
      });
    }
    if (json['series'] != null) {
      series = <NSSSeries>[];
      json['series'].forEach((v) {
        series!.add(NSSSeries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (sort != null) {
      data['sort'] = sort!.map((v) => v.toJson()).toList();
    }
    if (series != null) {
      data['series'] = series!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NSSNews {
  String? title;
  String? type;
  String? description;
  String? date;
  String? dateTime;
  String? image;
  int? sortOrder;

  NSSNews({
    this.title,
    this.type,
    this.description,
    this.date,
    this.dateTime,
    this.image,
    this.sortOrder,
  });

  NSSNews.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    description = json['description'];
    date = json['date'];
    dateTime = json['date_time'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['date'] = date;
    data['date_time'] = dateTime;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    return data;
  }
}

class NSSSort {
  int? id;
  String? title;
  String? type;
  String? description;
  String? image1;
  String? image2;
  String? sortType;
  String? videoLink;
  int? like;
  int? share;
  int? sortOrder;
  String? credit;
  String? date;
  String? dateTime;
  int? adsShow;
  RxBool? checkLick = false.obs;

  NSSSort({
    this.id,
    this.title,
    this.type,
    this.description,
    this.image1,
    this.image2,
    this.sortType,
    this.videoLink,
    this.like,
    this.share,
    this.sortOrder,
    this.credit,
    this.date,
    this.dateTime,
    this.adsShow,
    this.checkLick,
  });

  NSSSort.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    image1 = json['image1'];
    image2 = json['image2'];
    sortType = json['sort_type'];
    videoLink = json['video_link'];
    like = json['like'];
    share = json['share'];
    sortOrder = json['sort_order'];
    credit = json['credit'];
    date = json['date'];
    dateTime = json['date_time'];
    adsShow = json['ads_show'];
    checkLick = json["checkLick"] = false.obs;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['image1'] = image1;
    data['image2'] = image2;
    data['sort_type'] = sortType;
    data['video_link'] = videoLink;
    data['like'] = like;
    data['share'] = share;
    data['sort_order'] = sortOrder;
    data['credit'] = credit;
    data['date'] = date;
    data['date_time'] = dateTime;
    data['ads_show'] = adsShow;
    data['checkLick'] = checkLick = false.obs;

    return data;
  }
}

class NSSSeries {
  String? title;
  String? sortTitle;
  String? description;
  String? image1;
  String? image2;
  String? seriesDisplay;
  String? tourId;
  String? seriesId;
  int? sortOrder;

  NSSSeries({
    this.title,
    this.sortTitle,
    this.description,
    this.image1,
    this.image2,
    this.seriesDisplay,
    this.tourId,
    this.seriesId,
    this.sortOrder,
  });

  NSSSeries.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sortTitle = json['sort_title'];
    description = json['description'];
    image1 = json['image1'];
    image2 = json['image2'];
    seriesDisplay = json['series_display'];
    tourId = json['tour_id'];
    seriesId = json['series_id'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['sort_title'] = sortTitle;
    data['description'] = description;
    data['image1'] = image1;
    data['image2'] = image2;
    data['series_display'] = seriesDisplay;
    data['tour_id'] = tourId;
    data['series_id'] = seriesId;
    data['sort_order'] = sortOrder;
    return data;
  }
}

