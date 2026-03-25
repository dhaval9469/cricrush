class PointTableModel {
  double? serverTick;
  PointTableData? iplPointTableMeta;
  String? mode;

  PointTableModel({this.serverTick, this.iplPointTableMeta, this.mode});

  PointTableModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    iplPointTableMeta = json['ipl_point_table_meta'] != null
        ? PointTableData.fromJson(json['ipl_point_table_meta'])
        : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (iplPointTableMeta != null) {
      data['ipl_point_table_meta'] = iplPointTableMeta!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class PointTableData {
  List<PointsTable>? pointsTable;

  PointTableData({this.pointsTable});

  PointTableData.fromJson(Map<String, dynamic> json) {
    pointsTable = json['pointsTable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pointsTable'] = pointsTable;
    return data;
  }
}
class PointsTable {
  String? tourName;
  List<TourPTData>? pointsTableData;

  PointsTable({this.tourName, this.pointsTableData});

  PointsTable.fromJson(Map<String, dynamic> json) {
    tourName = json['tour_name'];
    if (json['data'] != null) {
      pointsTableData = <TourPTData>[];
      json['data'].forEach((v) {
        pointsTableData!.add(TourPTData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tour_name'] = tourName;
    if (pointsTableData != null) {
      data['data'] = pointsTableData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourPTData {
  String? team;
  String? shortName;
  String? teamId;
  String? matches;
  String? won;
  String? lost;
  String? tied;
  String? nR;
  String? points;
  String? nRR;
  String? isQualified;
  String? teamImage;

  TourPTData({
    this.team,
    this.shortName,
    this.teamId,
    this.matches,
    this.won,
    this.lost,
    this.tied,
    this.nR,
    this.points,
    this.nRR,
    this.isQualified,
    this.teamImage,
  });

  TourPTData.fromJson(Map<String, dynamic> json) {
    team = json['Team'];
    shortName = json['short_name'];
    teamId = json['teamId'];
    matches = json['Matches'];
    won = json['Won'];
    lost = json['Lost'];
    tied = json['Tied'];
    nR = json['NR'];
    points = json['Points'];
    nRR = json['NRR'];
    isQualified = json['is_qualified'];
    teamImage = json['team_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Team'] = team;
    data['short_name'] = shortName;
    data['teamId'] = teamId;
    data['Matches'] = matches;
    data['Won'] = won;
    data['Lost'] = lost;
    data['Tied'] = tied;
    data['NR'] = nR;
    data['Points'] = points;
    data['NRR'] = nRR;
    data['is_qualified'] = isQualified;
    data['team_image'] = teamImage;
    return data;
  }
}
