class OversModel {
  double? serverTick;
  OversData? over;
  String? mode;

  OversModel({this.serverTick, this.over, this.mode});

  OversModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    over = json['over'] != null ? OversData.fromJson(json['over']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (over != null) {
      data['over'] = over?.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class OversData {
  List<OBOTeams>? team;
  String? league;
  String? type;
  String? date;
  String? number;
  String? startDate;
  String? matchId;
  String? time;
  String? umpires;
  String? referee;
  String? status;
  int? lineupStatus;
  String? requiredRunrate;
  String? result;
  String? teamHome;
  String? teamAway;
  List<OBOInings>? ing;

  OversData({
    this.team,
    this.league,
    this.type,
    this.date,
    this.number,
    this.startDate,
    this.matchId,
    this.time,
    this.umpires,
    this.referee,
    this.status,
    this.lineupStatus,
    this.requiredRunrate,
    this.result,
    this.teamHome,
    this.teamAway,
    this.ing,
  });

  OversData.fromJson(Map<String, dynamic> json) {
    if (json['team'] != null) {
      team = <OBOTeams>[];
      json['team'].forEach((v) {
        team!.add(OBOTeams.fromJson(v));
      });
    }
    league = json['League'];
    type = json['Type'];
    date = json['Date'];
    number = json['Number'];
    startDate = json['StartDate'];
    matchId = json['match_id'];
    time = json['Time'];
    umpires = json['Umpires'];
    referee = json['Referee'];
    status = json['Status'];
    lineupStatus = json['Lineup_status'];
    requiredRunrate = json['Required_Runrate'];
    result = json['Result'];
    teamHome = json['Team_Home'];
    teamAway = json['Team_Away'];
    // json['ing'].forEach((v) {
    //   ing?.add(OBOInings.fromJson(v));
    // });
    if (json['ing'] != null) {
      ing = <OBOInings>[];
      json['ing'].forEach((v) {
        ing!.add(OBOInings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.map((v) => v.toJson()).toList();
    }
    data['League'] = league;
    data['Type'] = type;
    data['Date'] = date;
    data['Number'] = number;
    data['StartDate'] = startDate;
    data['match_id'] = matchId;
    data['Time'] = time;
    data['Umpires'] = umpires;
    data['Referee'] = referee;
    data['Status'] = status;
    data['Lineup_status'] = lineupStatus;
    data['Required_Runrate'] = requiredRunrate;
    data['Result'] = result;
    data['Team_Home'] = teamHome;
    data['Team_Away'] = teamAway;
    if (ing != null) {
      data['ing'] = ing!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OBOTeams {
  String? battingteam;
  String? total;
  String? wickets;
  String? overs;

  OBOTeams({this.battingteam, this.total, this.wickets, this.overs});

  OBOTeams.fromJson(Map<String, dynamic> json) {
    battingteam = json['Battingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Battingteam'] = battingteam;
    data['Total'] = total;
    data['Wickets'] = wickets;
    data['Overs'] = overs;
    return data;
  }
}

class OBOInings {
  String? battingteam;
  String? battingTeamSort;
  String? battingTeamId;
  List<OBOOverbyover>? overbyover;
  String? color;

  OBOInings({this.battingteam, this.battingTeamSort, this.overbyover, this.battingTeamId, this.color});

  OBOInings.fromJson(Map<String, dynamic> json) {
    battingteam = json['Battingteam'];
    battingTeamSort = json['Battingteam_sort'];
    battingTeamId = json['Battingteam_Id'];
    if (json['Overbyover'] != null) {
      overbyover = <OBOOverbyover>[];
      json['Overbyover'].forEach((v) {
        overbyover!.add(OBOOverbyover.fromJson(v));
      });
    }
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Battingteam'] = battingteam;
    data['Battingteam_sort'] = battingTeamSort;
    data['Battingteam_Id'] = battingTeamId;
    if (overbyover != null) {
      data['Overbyover'] = overbyover!.map((v) => v.toJson()).toList();
    }
    data['color'] = color;
    return data;
  }
}

class OBOOverbyover {
  int? over;
  int? ball;
  String? runs;
  String? wickets;
  String? thisover;
  int? totalRun;
  bool? adsDisplay;
  String? thisOverNew;
  String? bowler;
  String? euation;

  OBOOverbyover({
    this.over,
    this.ball,
    this.runs,
    this.wickets,
    this.thisover,
    this.totalRun,
    this.adsDisplay,
    this.thisOverNew,
    this.bowler,
    this.euation,
  });

  OBOOverbyover.fromJson(Map<String, dynamic> json) {
    over = json['Over'];
    ball = json['Ball'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    thisover = json['Thisover'];
    totalRun = json['total_run'];
    adsDisplay = json['ads_display'];
    thisOverNew = json['This_Over_new'];
    bowler = json['Bowler'];
    euation = json['euation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Over'] = over;
    data['Ball'] = ball;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    data['Thisover'] = thisover;
    data['total_run'] = totalRun;
    data['ads_display'] = adsDisplay;
    data['This_Over_new'] = thisOverNew;
    data['Bowler'] = bowler;
    data['euation'] = euation;
    return data;
  }
}
