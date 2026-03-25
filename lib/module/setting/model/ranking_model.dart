class AllRankingModel {
  double? serverTick;
  AllRanking? allRanking;
  String? mode;

  AllRankingModel({this.serverTick, this.allRanking, this.mode});

  AllRankingModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    allRanking = json['all_ranking'] != null ? AllRanking.fromJson(json['all_ranking']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (allRanking != null) {
      data['all_ranking'] = allRanking!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class AllRanking {
  List<ManRanking>? men;
  List<WomenRanking>? women;

  AllRanking({this.men, this.women});

  AllRanking.fromJson(Map<String, dynamic> json) {
    if (json['men'] != null) {
      men = <ManRanking>[];
      json['men'].forEach((v) {
        men!.add(ManRanking.fromJson(v));
      });
    }
    if (json['women'] != null) {
      women = <WomenRanking>[];
      json['women'].forEach((v) {
        women!.add(WomenRanking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (men != null) {
      data['men'] = men!.map((v) => v.toJson()).toList();
    }
    if (women != null) {
      data['women'] = women!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ManRanking {
  OdiMatches? odi;
  OdiMatches? t20;
  OdiMatches? test;

  ManRanking({this.odi, this.t20, this.test});

  ManRanking.fromJson(Map<String, dynamic> json) {
    odi = json['odi'] != null ? OdiMatches.fromJson(json['odi']) : null;
    t20 = json['t20'] != null ? OdiMatches.fromJson(json['t20']) : null;
    test = json['test'] != null ? OdiMatches.fromJson(json['test']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (odi != null) {
      data['odi'] = odi!.toJson();
    }
    if (t20 != null) {
      data['t20'] = t20!.toJson();
    }
    if (test != null) {
      data['test'] = test!.toJson();
    }
    return data;
  }
}

class OdiMatches {
  List<Batters>? bat;
  List<TeamRanking>? teamRanking;
  List<Batters>? bowl;
  List<Batters>? allrounder;

  OdiMatches({this.bat, this.teamRanking, this.bowl, this.allrounder});

  OdiMatches.fromJson(Map<String, dynamic> json) {
    if (json['bat'] != null) {
      bat = <Batters>[];
      json['bat'].forEach((v) {
        bat!.add(Batters.fromJson(v));
      });
    }
    if (json['teamRanking'] != null) {
      teamRanking = <TeamRanking>[];
      json['teamRanking'].forEach((v) {
        teamRanking!.add(TeamRanking.fromJson(v));
      });
    }
    if (json['bowl'] != null) {
      bowl = <Batters>[];
      json['bowl'].forEach((v) {
        bowl!.add(Batters.fromJson(v));
      });
    }
    if (json['allrounder'] != null) {
      allrounder = <Batters>[];
      json['allrounder'].forEach((v) {
        allrounder!.add(Batters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bat != null) {
      data['bat'] = bat!.map((v) => v.toJson()).toList();
    }
    if (teamRanking != null) {
      data['teamRanking'] = teamRanking!.map((v) => v.toJson()).toList();
    }
    if (bowl != null) {
      data['bowl'] = bowl!.map((v) => v.toJson()).toList();
    }
    if (allrounder != null) {
      data['allrounder'] = allrounder!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Batters {
  String? no;
  String? country;
  String? playerId;
  String? playerName;
  String? rating;
  String? teamId;
  String? matches;
  String? teamName;
  String? points;
  String? image;

  Batters({
    this.no,
    this.country,
    this.playerId,
    this.playerName,
    this.rating,
    this.teamId,
    this.matches,
    this.teamName,
    this.points,
    this.image,
  });

  Batters.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    country = json['country'];
    playerId = json['player_id'];
    playerName = json['playerName'];
    rating = json['rating'];
    teamId = json['team_id'];
    matches = json['matches'];
    teamName = json['team_name'];
    points = json['points'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['country'] = country;
    data['player_id'] = playerId;
    data['playerName'] = playerName;
    data['rating'] = rating;
    data['team_id'] = teamId;
    data['matches'] = matches;
    data['team_name'] = teamName;
    data['points'] = points;
    data['image'] = image;
    return data;
  }
}

class TeamRanking {
  String? no;
  String? rating;
  String? teamId;
  String? shortname;
  String? matches;
  String? teamName;
  String? points;
  String? image;

  TeamRanking({
    this.no,
    this.rating,
    this.teamId,
    this.shortname,
    this.matches,
    this.teamName,
    this.points,
    this.image,
  });

  TeamRanking.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    rating = json['rating'];
    teamId = json['team_id'];
    shortname = json['shortname'];
    matches = json['matches'];
    teamName = json['team_name'];
    points = json['points'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['rating'] = rating;
    data['team_id'] = teamId;
    data['shortname'] = shortname;
    data['matches'] = matches;
    data['team_name'] = teamName;
    data['points'] = points;
    data['image'] = image;
    return data;
  }
}

class WomenRanking {
  OdiMatches? odiw;
  OdiMatches? t20w;

  WomenRanking({this.odiw, this.t20w});

  WomenRanking.fromJson(Map<String, dynamic> json) {
    odiw = json['odiw'] != null ? OdiMatches.fromJson(json['odiw']) : null;
    t20w = json['t20w'] != null ? OdiMatches.fromJson(json['t20w']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (odiw != null) {
      data['odiw'] = odiw!.toJson();
    }
    if (t20w != null) {
      data['t20w'] = t20w!.toJson();
    }
    return data;
  }
}
