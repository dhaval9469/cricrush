class UnitIdModel {
  String? appOpen;
  String? interstitial;
  String? native;
  String? banner;
  String? adaptiveBanner;
  int? interstitialCount;
  int? interstitialBackCount;
  int? adOver;
  int? sortIndex;
  bool? isNative;
  String? appLink;
  String? appPP;
  String? appVersion;

  UnitIdModel({
    this.appOpen,
    this.interstitial,
    this.native,
    this.banner,
    this.adaptiveBanner,
    this.interstitialCount,
    this.interstitialBackCount,
    this.adOver,
    this.sortIndex,
    this.isNative,
    this.appLink,
    this.appPP,
    this.appVersion,
  });

  UnitIdModel.fromJson(Map<String, dynamic> json) {
    appOpen = json['app_open'];
    interstitial = json['interstitial'];
    native = json['native'];
    banner = json['banner'];
    adaptiveBanner = json['adaptive_banner'];
    interstitialCount = json['interstitial_count'];
    interstitialBackCount = json['interstitial_backcount'];
    adOver = json['ad_over'];
    sortIndex = json['sort_index'];
    isNative = json['is_native'];
    appLink = json['app_link'];
    appPP = json['app_privacypolicy'];
    appVersion = json['app_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_open'] = appOpen;
    data['interstitial'] = interstitial;
    data['native'] = native;
    data['banner'] = banner;
    data['adaptive_banner'] = adaptiveBanner;
    data['interstitial_count'] = interstitialCount;
    data['interstitial_backcount'] = interstitialBackCount;
    data['ad_over'] = adOver;
    data['sort_index'] = sortIndex;
    data['is_native'] = isNative;
    data['app_link'] = appLink;
    data['app_privacypolicy'] = appPP;
    data['app_version'] = appVersion;
    return data;
  }
}

class EndPointModel {
  String? wsBaseurl;
  String? baseurlTwo;
  String? wsAllNew;
  String? wsIplLive;
  String? wsLmd;
  String? pyIpl;
  String? pyScoreboard;
  String? pyCommentary;
  String? pySquad;
  String? pyOver;
  String? pyPointTable;
  String? pyNewsSortSeri;
  String? pyPlayers;
  String? pyIplSetting;
  String? pyAllRanking;
  String? pyLive;
  String? seriesHeader;
  String? seriesFooter;
  int? tourId;
  int? seriesId;
  List<SubPlan>? subPlan;

  EndPointModel({
    this.wsBaseurl,
    this.baseurlTwo,
    this.wsAllNew,
    this.wsIplLive,
    this.wsLmd,
    this.pyIpl,
    this.pyScoreboard,
    this.pyCommentary,
    this.pySquad,
    this.pyOver,
    this.pyPointTable,
    this.pyNewsSortSeri,
    this.pyPlayers,
    this.pyIplSetting,
    this.pyAllRanking,
    this.pyLive,
    this.tourId,
    this.seriesHeader,
    this.seriesFooter,
    this.seriesId,
    this.subPlan,
  });

  EndPointModel.fromJson(Map<String, dynamic> json) {
    wsBaseurl = json['wsBaseurl'];
    baseurlTwo = json['baseurlTwo'];
    wsAllNew = json['wsAllNew'];
    wsIplLive = json['wsIplLive'];
    wsLmd = json['wsLmd'];
    pyIpl = json['pyIpl'];
    pyScoreboard = json['pyScoreboard'];
    pyCommentary = json['pyCommentary'];
    pySquad = json['pySquad'];
    pyOver = json['pyOver'];
    pyPointTable = json['pyPointTable'];
    pyNewsSortSeri = json['pyNewsSortSeri'];
    pyPlayers = json['pyPlayers'];
    pyIplSetting = json['pyIplSetting'];
    pyAllRanking = json['pyAllRanking'];
    pyLive = json['pyLive'];
    seriesHeader = json['seriesHeader'];
    seriesFooter = json['seriesFooter'];
    tourId = json['tourId'];
    seriesId = json['seriesId'];
    if (json['sub_plan'] != null) {
      subPlan = <SubPlan>[];
      json['sub_plan'].forEach((v) {
        subPlan!.add(SubPlan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wsBaseurl'] = wsBaseurl;
    data['baseurlTwo'] = baseurlTwo;
    data['wsAllNew'] = wsAllNew;
    data['wsIplLive'] = wsIplLive;
    data['wsLmd'] = wsLmd;
    data['pyIpl'] = pyIpl;
    data['pyScoreboard'] = pyScoreboard;
    data['pyCommentary'] = pyCommentary;
    data['pySquad'] = pySquad;
    data['pyOver'] = pyOver;
    data['pyPointTable'] = pyPointTable;
    data['pyNewsSortSeri'] = pyNewsSortSeri;
    data['pyPlayers'] = pyPlayers;
    data['pyIplSetting'] = pyIplSetting;
    data['pyAllRanking'] = pyAllRanking;
    data['pyLive'] = pyLive;
    data['seriesHeader'] = seriesHeader;
    data['seriesFooter'] = seriesFooter;
    data['tourId'] = tourId;
    data['seriesId'] = seriesId;
    if (subPlan != null) {
      data['sub_plan'] = subPlan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubPlan {
  String? productId;
  String? title;
  String? durationLabel;
  int? billingPeriod;
  int? price;
  int? originalPrice;
  String? discount;
  String? showPrice;

  SubPlan({
    this.productId,
    this.title,
    this.durationLabel,
    this.billingPeriod,
    this.price,
    this.originalPrice,
    this.discount,
    this.showPrice,
  });

  SubPlan copyWith({
    String? productId,
    String? title,
    String? durationLabel,
    int? billingPeriod,
    int? price,
    int? originalPrice,
    String? discount,
    String? showPrice,
  }) {
    return SubPlan(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      durationLabel: durationLabel ?? this.durationLabel,
      billingPeriod: billingPeriod ?? this.billingPeriod,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      discount: discount ?? this.discount,
      showPrice: showPrice ?? this.showPrice,
    );
  }

  SubPlan.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    title = json['title'];
    durationLabel = json['durationLabel'];
    billingPeriod = json['billingPeriod'];
    price = json['price'];
    originalPrice = json['originalPrice'];
    discount = json['discount'];
    showPrice = json['showPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['title'] = title;
    data['durationLabel'] = durationLabel;
    data['billingPeriod'] = billingPeriod;
    data['price'] = price;
    data['originalPrice'] = originalPrice;
    data['discount'] = discount;
    data['showPrice'] = showPrice;
    return data;
  }

}
