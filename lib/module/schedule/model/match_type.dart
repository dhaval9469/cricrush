class MatchType {
  String? mt;
  List<String>? mtList;

  MatchType({this.mt, this.mtList});

  MatchType.fromJson(Map<String, dynamic> json) {
    mt = json['mt'];
    mtList = json['mt_List'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mt'] = mt;
    data['mt_List'] = mtList;
    return data;
  }
}
