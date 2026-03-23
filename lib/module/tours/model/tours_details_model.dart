class ToursDetailModel {
  double? serverTick;
  IplBundle? iplBundle;
  String? mode;

  ToursDetailModel({this.serverTick, this.iplBundle, this.mode});

  ToursDetailModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    iplBundle = json['ipl_bundle'] != null ? IplBundle.fromJson(json['ipl_bundle']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (iplBundle != null) {
      data['ipl_bundle'] = iplBundle!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class IplBundle {
  double? serverTick;
  TourMatchList? seriesList;
  TourSquadMeta? iplSquadMeta;
  TourKeyState? iplKeyState;
  TourPointTableMeta? iplPointTableMeta;
  String? mode;

  IplBundle({this.serverTick, this.seriesList, this.iplSquadMeta, this.iplKeyState, this.iplPointTableMeta, this.mode});

  IplBundle.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    seriesList = json['series_list'] != null ? TourMatchList.fromJson(json['series_list']) : null;
    iplSquadMeta = json['ipl_squad_meta'] != null ? TourSquadMeta.fromJson(json['ipl_squad_meta']) : null;
    iplKeyState = json['ipl_key_state'] != null ? TourKeyState.fromJson(json['ipl_key_state']) : null;
    iplPointTableMeta = json['ipl_point_table_meta'] != null ? TourPointTableMeta.fromJson(json['ipl_point_table_meta']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (seriesList != null) {
      data['series_list'] = seriesList!.toJson();
    }
    if (iplSquadMeta != null) {
      data['ipl_squad_meta'] = iplSquadMeta!.toJson();
    }
    if (iplKeyState != null) {
      data['ipl_key_state'] = iplKeyState!.toJson();
    }
    if (iplPointTableMeta != null) {
      data['ipl_point_table_meta'] = iplPointTableMeta!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

// series_list model

class TourMatchList {
  List<TourLiveM>? live;
  List<TourUpcomingM>? upcoming;
  List<TourResultsM>? results;
  List<TourResultsM>? keyMatches;

  TourMatchList({this.live, this.upcoming, this.results, this.keyMatches});

  TourMatchList.fromJson(Map<String, dynamic> json) {
    if (json['live'] != null) {
      live = <TourLiveM>[];
      json['live'].forEach((v) {
        live!.add(TourLiveM.fromJson(v));
      });
    }
    if (json['upcoming'] != null) {
      upcoming = <TourUpcomingM>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(TourUpcomingM.fromJson(v));
      });
    }
    if (json['results'] != null) {
      results = <TourResultsM>[];
      json['results'].forEach((v) {
        results!.add(TourResultsM.fromJson(v));
      });
    }
    if (json['keyMatches'] != null) {
      results = <TourResultsM>[];
      json['keyMatches'].forEach((v) {
        results!.add(TourResultsM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (live != null) {
      data['live'] = live!.map((v) => v.toJson()).toList();
    }
    if (upcoming != null) {
      data['upcoming'] = upcoming!.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (keyMatches != null) {
      data['keyMatches'] = keyMatches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourLiveM {
  TourMLMatchDetail? matchdetail;
  List<TourMLTeamList>? teamlist;
  String? matchId;
  String? seriesshortname;
  String? tossSelection;
  String? matchStatusId;
  String? tourId;
  String? language;
  String? tossElectedTo;
  List<TourMLInnings>? innings;

  TourLiveM({
    this.matchdetail,
    this.teamlist,
    this.matchId,
    this.seriesshortname,
    this.tossSelection,
    this.matchStatusId,
    this.tourId,
    this.language,
    this.tossElectedTo,
    this.innings,
  });

  TourLiveM.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? TourMLMatchDetail.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <TourMLTeamList>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(TourMLTeamList.fromJson(v));
      });
    }
    matchId = json['matchId'];
    seriesshortname = json['seriesshortname'];
    tossSelection = json['tossSelection'];
    matchStatusId = json['matchStatusId'];
    tourId = json['tourId'];
    language = json['language'];
    tossElectedTo = json['toss_elected_to'];
    if (json['innings'] != null) {
      innings = <TourMLInnings>[];
      json['innings'].forEach((v) {
        innings!.add(TourMLInnings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchdetail != null) {
      data['matchdetail'] = matchdetail!.toJson();
    }
    if (teamlist != null) {
      data['teamlist'] = teamlist!.map((v) => v.toJson()).toList();
    }
    data['matchId'] = matchId;
    data['seriesshortname'] = seriesshortname;
    data['tossSelection'] = tossSelection;
    data['matchStatusId'] = matchStatusId;
    data['tourId'] = tourId;
    data['language'] = language;
    data['toss_elected_to'] = tossElectedTo;
    if (innings != null) {
      data['innings'] = innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourUpcomingM {
  String? daynight;
  String? matchId;
  String? matchfile;
  String? matchnumber;
  String? matchstatus;
  String? matchdateIst;
  String? matchtimeIst;
  String? endMatchdateIst;
  String? endMatchtimeIst;
  String? matchtype;
  String? seriesname;
  String? seriesShortDisplayName;
  String? seriesId;
  String? teama;
  String? teamaId;
  String? teamaShort;
  String? teamb;
  String? teambId;
  String? tourname;
  String? teambShort;
  String? venue;
  String? venueId;
  String? city;
  String? tossWonBy;
  String? tossElectedTo;
  String? matchDay;
  String? language;
  String? league;
  String? teamaEng;
  String? teambEng;
  String? matchnumberEng;
  String? matchtypeEng;
  String? seriesShortDisplayNameEng;
  String? teamaShortEng;
  String? teambShortEng;
  int? matchStartTimestamp;
  int? matchEndTimestamp;
  String? compTypeId;
  String? seriesType;
  String? tourId;
  String? teamaImage;
  String? teambImage;

  TourUpcomingM({
    this.daynight,
    this.matchId,
    this.matchfile,
    this.matchnumber,
    this.matchstatus,
    this.matchdateIst,
    this.matchtimeIst,
    this.endMatchdateIst,
    this.endMatchtimeIst,
    this.matchtype,
    this.seriesname,
    this.seriesShortDisplayName,
    this.seriesId,
    this.teama,
    this.teamaId,
    this.teamaShort,
    this.teamb,
    this.teambId,
    this.tourname,
    this.teambShort,
    this.venue,
    this.venueId,
    this.city,
    this.tossWonBy,
    this.tossElectedTo,
    this.matchDay,
    this.language,
    this.league,
    this.teamaEng,
    this.teambEng,
    this.matchnumberEng,
    this.matchtypeEng,
    this.seriesShortDisplayNameEng,
    this.teamaShortEng,
    this.teambShortEng,
    this.matchStartTimestamp,
    this.matchEndTimestamp,
    this.compTypeId,
    this.seriesType,
    this.tourId,
    this.teamaImage,
    this.teambImage,
  });

  TourUpcomingM.fromJson(Map<String, dynamic> json) {
    daynight = json['daynight'];
    matchId = json['matchId'];
    matchfile = json['matchfile'];
    matchnumber = json['matchnumber'];
    matchstatus = json['matchstatus'];
    matchdateIst = json['matchdate_ist'];
    matchtimeIst = json['matchtime_ist'];
    endMatchdateIst = json['end_matchdate_ist'];
    endMatchtimeIst = json['end_matchtime_ist'];
    matchtype = json['matchtype'];
    seriesname = json['seriesname'];
    seriesShortDisplayName = json['series_short_display_name'];
    seriesId = json['series_Id'];
    teama = json['teama'];
    teamaId = json['teama_Id'];
    teamaShort = json['teama_short'];
    teamb = json['teamb'];
    teambId = json['teamb_Id'];
    tourname = json['tourname'];
    teambShort = json['teamb_short'];
    venue = json['venue'];
    venueId = json['venue_Id'];
    city = json['city'];
    tossWonBy = json['toss_won_by'];
    tossElectedTo = json['toss_elected_to'];
    matchDay = json['match_day'];
    language = json['language'];
    league = json['league'];
    teamaEng = json['teama_eng'];
    teambEng = json['teamb_eng'];
    matchnumberEng = json['matchnumber_eng'];
    matchtypeEng = json['matchtype_eng'];
    seriesShortDisplayNameEng = json['series_short_display_name_eng'];
    teamaShortEng = json['teama_short_eng'];
    teambShortEng = json['teamb_short_eng'];
    matchStartTimestamp = json['matchStartTimestamp'];
    matchEndTimestamp = json['matchEndTimestamp'];
    compTypeId = json['comp_type_id'];
    seriesType = json['series_type'];
    tourId = json['tourId'];
    teamaImage = json['teama_image'];
    teambImage = json['teamb_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['daynight'] = daynight;
    data['matchId'] = matchId;
    data['matchfile'] = matchfile;
    data['matchnumber'] = matchnumber;
    data['matchstatus'] = matchstatus;
    data['matchdate_ist'] = matchdateIst;
    data['matchtime_ist'] = matchtimeIst;
    data['end_matchdate_ist'] = endMatchdateIst;
    data['end_matchtime_ist'] = endMatchtimeIst;
    data['matchtype'] = matchtype;
    data['seriesname'] = seriesname;
    data['series_short_display_name'] = seriesShortDisplayName;
    data['series_Id'] = seriesId;
    data['teama'] = teama;
    data['teama_Id'] = teamaId;
    data['teama_short'] = teamaShort;
    data['teamb'] = teamb;
    data['teamb_Id'] = teambId;
    data['tourname'] = tourname;
    data['teamb_short'] = teambShort;
    data['venue'] = venue;
    data['venue_Id'] = venueId;
    data['city'] = city;
    data['toss_won_by'] = tossWonBy;
    data['toss_elected_to'] = tossElectedTo;
    data['match_day'] = matchDay;
    data['language'] = language;
    data['league'] = league;
    data['teama_eng'] = teamaEng;
    data['teamb_eng'] = teambEng;
    data['matchnumber_eng'] = matchnumberEng;
    data['matchtype_eng'] = matchtypeEng;
    data['series_short_display_name_eng'] = seriesShortDisplayNameEng;
    data['teama_short_eng'] = teamaShortEng;
    data['teamb_short_eng'] = teambShortEng;
    data['matchStartTimestamp'] = matchStartTimestamp;
    data['matchEndTimestamp'] = matchEndTimestamp;
    data['comp_type_id'] = compTypeId;
    data['series_type'] = seriesType;
    data['tourId'] = tourId;
    data['teama_image'] = teamaImage;
    data['teamb_image'] = teambImage;
    return data;
  }
}

class TourResultsM {
  TourMLMatchDetail? matchdetail;
  List<TourMLTeamList>? teamlist;
  String? matchId;
  String? seriesshortname;
  String? tossSelection;
  String? matchStatusId;
  String? tourId;
  String? language;
  String? endMatchDateGMT;
  String? endMatchTimeGMT;
  String? endMatchdateIst;
  String? endMatchtimeIst;
  String? tossElectedTo;
  List<TourMLInnings>? innings;

  TourResultsM({
    this.matchdetail,
    this.teamlist,
    this.matchId,
    this.seriesshortname,
    this.tossSelection,
    this.matchStatusId,
    this.tourId,
    this.language,
    this.endMatchDateGMT,
    this.endMatchTimeGMT,
    this.endMatchdateIst,
    this.endMatchtimeIst,
    this.tossElectedTo,
    this.innings,
  });

  TourResultsM.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? TourMLMatchDetail.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <TourMLTeamList>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(TourMLTeamList.fromJson(v));
      });
    }
    matchId = json['matchId'];
    seriesshortname = json['seriesshortname'];
    tossSelection = json['tossSelection'];
    matchStatusId = json['matchStatusId'];
    tourId = json['tourId'];
    language = json['language'];
    endMatchDateGMT = json['endMatchDateGMT'];
    endMatchTimeGMT = json['endMatchTimeGMT'];
    endMatchdateIst = json['end_matchdate_ist'];
    endMatchtimeIst = json['end_matchtime_ist'];
    tossElectedTo = json['toss_elected_to'];
    if (json['innings'] != null) {
      innings = <TourMLInnings>[];
      json['innings'].forEach((v) {
        innings!.add(TourMLInnings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchdetail != null) {
      data['matchdetail'] = matchdetail!.toJson();
    }
    if (teamlist != null) {
      data['teamlist'] = teamlist!.map((v) => v.toJson()).toList();
    }
    data['matchId'] = matchId;
    data['seriesshortname'] = seriesshortname;
    data['tossSelection'] = tossSelection;
    data['matchStatusId'] = matchStatusId;
    data['tourId'] = tourId;
    data['language'] = language;
    data['endMatchDateGMT'] = endMatchDateGMT;
    data['endMatchTimeGMT'] = endMatchTimeGMT;
    data['end_matchdate_ist'] = endMatchdateIst;
    data['end_matchtime_ist'] = endMatchtimeIst;
    data['toss_elected_to'] = tossElectedTo;
    if (innings != null) {
      data['innings'] = innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourMLInnings {
  String? bowlingteam;
  bool? isdeclared;
  String? allottedOvers;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? number;
  String? penalty;
  String? runrate;
  String? total;
  String? wickets;
  String? overs;
  String? battingteam;
  String? nameShort;
  String? nameFull;
  String? image;
  String? target;
  bool? batting;

  TourMLInnings({
    this.bowlingteam,
    this.isdeclared,
    this.allottedOvers,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.number,
    this.penalty,
    this.runrate,
    this.total,
    this.wickets,
    this.overs,
    this.battingteam,
    this.nameShort,
    this.nameFull,
    this.image,
    this.batting,
    this.target,
  });

  TourMLInnings.fromJson(Map<String, dynamic> json) {
    bowlingteam = json['bowlingteam'];
    isdeclared = json['isdeclared'];
    allottedOvers = json['allottedOvers'];
    byes = json['byes'];
    legbyes = json['legbyes'];
    wides = json['wides'];
    noballs = json['noballs'];
    number = json['number'];
    penalty = json['penalty'];
    runrate = json['runrate'];
    total = json['total'];
    wickets = json['wickets'];
    overs = json['overs'];
    battingteam = json['battingteam'];
    nameShort = json['name_Short'];
    nameFull = json['name_Full'];
    image = json['image'];
    target = json['target'];
    batting = json['batting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bowlingteam'] = bowlingteam;
    data['isdeclared'] = isdeclared;
    data['allottedOvers'] = allottedOvers;
    data['byes'] = byes;
    data['legbyes'] = legbyes;
    data['wides'] = wides;
    data['noballs'] = noballs;
    data['number'] = number;
    data['penalty'] = penalty;
    data['runrate'] = runrate;
    data['total'] = total;
    data['wickets'] = wickets;
    data['overs'] = overs;
    data['battingteam'] = battingteam;
    data['name_Short'] = nameShort;
    data['name_Full'] = nameFull;
    data['image'] = image;
    data['target'] = target;
    data['batting'] = batting;
    return data;
  }
}

class TourMLMatchDetail {
  String? isso;
  TourMatchInfo? match;
  TourSeriesInfo? series;
  TourMatchVenue? venue;
  String? oversRemaining;
  String? tossElectedTo;
  String? teamHome;
  String? statusId;
  String? winmargin;
  String? teamAway;
  String? tosswonby;
  String? equation;
  String? session;
  String? winningteam;
  String? day;
  String? status;
  String? result;
  String? win;
  String? winNew;

  TourMLMatchDetail({
    this.isso,
    this.match,
    this.series,
    this.venue,
    this.oversRemaining,
    this.tossElectedTo,
    this.teamHome,
    this.statusId,
    this.winmargin,
    this.teamAway,
    this.tosswonby,
    this.equation,
    this.session,
    this.winningteam,
    this.day,
    this.status,
    this.result,
    this.win,
    this.winNew,
  });

  TourMLMatchDetail.fromJson(Map<String, dynamic> json) {
    isso = json['isso'];
    match = json['match'] != null ? TourMatchInfo.fromJson(json['match']) : null;
    series = json['series'] != null ? TourSeriesInfo.fromJson(json['series']) : null;
    venue = json['venue'] != null ? TourMatchVenue.fromJson(json['venue']) : null;
    oversRemaining = json['overs_Remaining'];
    tossElectedTo = json['toss_elected_to'];
    teamHome = json['team_Home'];
    statusId = json['status_Id'];
    winmargin = json['winmargin'];
    teamAway = json['team_Away'];
    tosswonby = json['tosswonby'];
    equation = json['equation'];
    session = json['session'];
    winningteam = json['winningteam'];
    day = json['day'];
    status = json['status'];
    result = json['result'];
    win = json['win'];
    winNew = json['win_new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isso'] = isso;
    if (match != null) {
      data['match'] = match!.toJson();
    }
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    data['overs_Remaining'] = oversRemaining;
    data['toss_elected_to'] = tossElectedTo;
    data['team_Home'] = teamHome;
    data['status_Id'] = statusId;
    data['winmargin'] = winmargin;
    data['team_Away'] = teamAway;
    data['tosswonby'] = tosswonby;
    data['equation'] = equation;
    data['session'] = session;
    data['winningteam'] = winningteam;
    data['day'] = day;
    data['status'] = status;
    data['result'] = result;
    data['win'] = win;
    data['win_new'] = winNew;
    return data;
  }
}

class TourMLTeamList {
  String? nameFullEng;
  String? nameShortEng;
  String? nameShort;
  String? teamId;
  String? nameFull;
  String? teamImage;

  TourMLTeamList({this.nameFullEng, this.nameShortEng, this.nameShort, this.teamId, this.nameFull, this.teamImage});

  TourMLTeamList.fromJson(Map<String, dynamic> json) {
    nameFullEng = json['name_Full_Eng'];
    nameShortEng = json['name_Short_Eng'];
    nameShort = json['name_Short'];
    teamId = json['team_Id'];
    nameFull = json['name_Full'];
    teamImage = json['team_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_Full_Eng'] = nameFullEng;
    data['name_Short_Eng'] = nameShortEng;
    data['name_Short'] = nameShort;
    data['team_Id'] = teamId;
    data['name_Full'] = nameFull;
    data['team_image'] = teamImage;
    return data;
  }
}

class TourMatchInfo {
  String? id;
  String? coverageLevelId;
  String? numberEng;
  String? number;
  String? typeEng;
  String? endDate;
  String? endTime;
  String? daynight;
  String? league;
  String? code;
  String? compTypeId;
  String? type;
  String? offset;
  String? time;
  String? date;
  String? city;

  TourMatchInfo({
    this.id,
    this.coverageLevelId,
    this.numberEng,
    this.number,
    this.typeEng,
    this.endDate,
    this.endTime,
    this.daynight,
    this.league,
    this.code,
    this.compTypeId,
    this.type,
    this.offset,
    this.time,
    this.date,
    this.city,
  });

  TourMatchInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coverageLevelId = json['coverage_level_id'];
    numberEng = json['number_eng'];
    number = json['number'];
    typeEng = json['type_eng'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    daynight = json['daynight'];
    league = json['league'];
    code = json['code'];
    compTypeId = json['comp_type_id'];
    type = json['type'];
    offset = json['offset'];
    time = json['time'];
    date = json['date'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['coverage_level_id'] = coverageLevelId;
    data['number_eng'] = numberEng;
    data['number'] = number;
    data['type_eng'] = typeEng;
    data['end_date'] = endDate;
    data['end_time'] = endTime;
    data['daynight'] = daynight;
    data['league'] = league;
    data['code'] = code;
    data['comp_type_id'] = compTypeId;
    data['type'] = type;
    data['offset'] = offset;
    data['time'] = time;
    data['date'] = date;
    data['city'] = city;
    return data;
  }
}

class TourMatchVenue {
  String? id;
  String? name;

  TourMatchVenue({this.id, this.name});

  TourMatchVenue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class TourSeriesInfo {
  String? shortName;
  String? tourName;
  String? seriesShortDisplayNameEng;
  String? seriesShortDisplayName;
  String? status;
  String? id;
  String? name;

  TourSeriesInfo({
    this.shortName,
    this.tourName,
    this.seriesShortDisplayNameEng,
    this.seriesShortDisplayName,
    this.status,
    this.id,
    this.name,
  });

  TourSeriesInfo.fromJson(Map<String, dynamic> json) {
    shortName = json['shortName'];
    tourName = json['tour_Name'];
    seriesShortDisplayNameEng = json['series_short_display_name_eng'];
    seriesShortDisplayName = json['series_short_display_name'];
    status = json['status'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shortName'] = shortName;
    data['tour_Name'] = tourName;
    data['series_short_display_name_eng'] = seriesShortDisplayNameEng;
    data['series_short_display_name'] = seriesShortDisplayName;
    data['status'] = status;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

//  IplSquadMeta
class TourSquadMeta {
  List<TourTeams>? teamsNew;

  TourSquadMeta({this.teamsNew});

  TourSquadMeta.fromJson(Map<String, dynamic> json) {
    if (json['Teams_New'] != null) {
      teamsNew = <TourTeams>[];
      json['Teams_New'].forEach((v) {
        teamsNew!.add(TourTeams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teamsNew != null) {
      data['Teams_New'] = teamsNew!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourTeams {
  String? nameFull;
  String? nameShort;
  String? image;
  List<TourSquadPlayers>? players;

  TourTeams({this.nameFull, this.nameShort, this.image, this.players});

  TourTeams.fromJson(Map<String, dynamic> json) {
    nameFull = json['Name_Full'];
    nameShort = json['Name_Short'];
    image = json['image'];
    if (json['Players'] != null) {
      players = <TourSquadPlayers>[];
      json['Players'].forEach((v) {
        players!.add(TourSquadPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name_Full'] = nameFull;
    data['Name_Short'] = nameShort;
    data['image'] = image;
    if (players != null) {
      data['Players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourSquadPlayers {
  String? id;
  String? name;
  String? shortName;
  String? jerseyNumber;
  String? playerTypeId;
  String? playerType;
  String? skillId;
  String? skillName;
  String? nationalityId;
  String? nationality;
  String? statusId;
  String? status;
  String? dateOfBirth;
  SportSpecificKeys? sportSpecificKeys;
  String? image;

  TourSquadPlayers({
    this.id,
    this.name,
    this.shortName,
    this.jerseyNumber,
    this.playerTypeId,
    this.playerType,
    this.skillId,
    this.skillName,
    this.nationalityId,
    this.nationality,
    this.statusId,
    this.status,
    this.dateOfBirth,
    this.sportSpecificKeys,
    this.image,
  });

  TourSquadPlayers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    jerseyNumber = json['jersey_number'];
    playerTypeId = json['player_type_id'];
    playerType = json['player_type'];
    skillId = json['skill_id'];
    skillName = json['skill_name'];
    nationalityId = json['nationality_id'];
    nationality = json['nationality'];
    statusId = json['status_id'];
    status = json['status'];
    dateOfBirth = json['date_of_birth'];
    sportSpecificKeys = json['sport_specific_keys'] != null ? SportSpecificKeys.fromJson(json['sport_specific_keys']) : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_name'] = shortName;
    data['jersey_number'] = jerseyNumber;
    data['player_type_id'] = playerTypeId;
    data['player_type'] = playerType;
    data['skill_id'] = skillId;
    data['skill_name'] = skillName;
    data['nationality_id'] = nationalityId;
    data['nationality'] = nationality;
    data['status_id'] = statusId;
    data['status'] = status;
    data['date_of_birth'] = dateOfBirth;
    if (sportSpecificKeys != null) {
      data['sport_specific_keys'] = sportSpecificKeys!.toJson();
    }
    data['image'] = image;
    return data;
  }
}

class SportSpecificKeys {
  String? isWicketKeeper;
  String? isProbable;
  String? isSelected;
  String? isCaptain;
  String? bowlingStyle;
  String? battingStyle;
  String? isMarquee;

  SportSpecificKeys({
    this.isWicketKeeper,
    this.isProbable,
    this.isSelected,
    this.isCaptain,
    this.bowlingStyle,
    this.battingStyle,
    this.isMarquee,
  });

  SportSpecificKeys.fromJson(Map<String, dynamic> json) {
    isWicketKeeper = json['is_wicket_keeper'];
    isProbable = json['is_probable'];
    isSelected = json['is_selected'];
    isCaptain = json['is_captain'];
    bowlingStyle = json['bowling_style'];
    battingStyle = json['batting_style'];
    isMarquee = json['is_marquee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_wicket_keeper'] = isWicketKeeper;
    data['is_probable'] = isProbable;
    data['is_selected'] = isSelected;
    data['is_captain'] = isCaptain;
    data['bowling_style'] = bowlingStyle;
    data['batting_style'] = battingStyle;
    data['is_marquee'] = isMarquee;
    return data;
  }
}

//  ipl_key_state
class TourKeyState {
  List<KeyStats>? stats;

  TourKeyState({this.stats});

  TourKeyState.fromJson(Map<String, dynamic> json) {
    if (json['stats'] != null) {
      stats = <KeyStats>[];
      json['stats'].forEach((v) {
        stats!.add(KeyStats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KeyStats {
  int? statId;
  int? seriesId;
  String? statsSeriesId;
  String? seriesShortName;
  String? displayName;
  String? seriesName;
  String? statName;
  String? parentSeriesId;
  List<Leaderboard>? leaderboard;
  String? timestamp;
  String? language;
  int? count;

  KeyStats({
    this.statId,
    this.seriesId,
    this.statsSeriesId,
    this.seriesShortName,
    this.displayName,
    this.seriesName,
    this.statName,
    this.parentSeriesId,
    this.leaderboard,
    this.timestamp,
    this.language,
    this.count,
  });

  KeyStats.fromJson(Map<String, dynamic> json) {
    statId = json['stat_id'];
    seriesId = json['series_id'];
    statsSeriesId = json['statsSeriesId'];
    seriesShortName = json['series_short_name'];
    displayName = json['display_name'];
    seriesName = json['series_name'];
    statName = json['stat_name'];
    parentSeriesId = json['parent_series_id'];
    if (json['leaderboard'] != null) {
      leaderboard = <Leaderboard>[];
      json['leaderboard'].forEach((v) {
        leaderboard!.add(Leaderboard.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
    language = json['language'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stat_id'] = statId;
    data['series_id'] = seriesId;
    data['statsSeriesId'] = statsSeriesId;
    data['series_short_name'] = seriesShortName;
    data['display_name'] = displayName;
    data['series_name'] = seriesName;
    data['stat_name'] = statName;
    data['parent_series_id'] = parentSeriesId;
    if (leaderboard != null) {
      data['leaderboard'] = leaderboard!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    data['language'] = language;
    data['count'] = count;
    return data;
  }
}

class Leaderboard {
  String? playerId;
  String? playerName;
  String? teamName;
  String? teamShortName;
  String? teamId;
  String? vsTeamName;
  String? vsTeamShortName;
  String? vsTeamId;
  String? matchDate;
  String? highestScore;
  String? ballsFaced;
  String? battingStrikeRate;
  String? teamScore;
  String? matchId;
  String? forTeamName;
  String? forTeamShortName;
  String? forTeamId;
  String? fours;
  String? sixes;
  String? venue;
  String? venueId;
  String? forTeamDisplayName;
  String? forTeamShortDisplayName;
  String? againstTeamShortName;
  String? againstTeamDisplayName;
  String? againstTeamShortDisplayName;
  String? gender;
  String? nationality;
  String? nationalityId;
  String? playerImage;
  String? teamImage;
  String? matchesPlayed;
  String? inningsPlayed;
  String? notOuts;
  String? runsScored;
  String? average;
  String? thirties;
  String? fifties;
  String? hundred;
  String? zeroes;
  String? overs;
  String? mostMaidens;
  String? runsGiven;
  String? wickets;
  String? bestBowlingAverage;
  String? bowlingStrikeRate;
  String? economy;
  String? bestBowlingFigures;
  String? ballsBowled;
  String? threeWicketsHaul;
  String? fiveWicketsHaul;
  String? fourWicketsHaul;
  String? innings;
  String? trilling;

  Leaderboard({
    this.playerId,
    this.playerName,
    this.teamName,
    this.teamShortName,
    this.teamId,
    this.vsTeamName,
    this.vsTeamShortName,
    this.vsTeamId,
    this.matchDate,
    this.highestScore,
    this.ballsFaced,
    this.battingStrikeRate,
    this.teamScore,
    this.matchId,
    this.forTeamName,
    this.forTeamShortName,
    this.forTeamId,
    this.fours,
    this.sixes,
    this.venue,
    this.venueId,
    this.forTeamDisplayName,
    this.forTeamShortDisplayName,
    this.againstTeamShortName,
    this.againstTeamDisplayName,
    this.againstTeamShortDisplayName,
    this.gender,
    this.nationality,
    this.nationalityId,
    this.playerImage,
    this.teamImage,
    this.matchesPlayed,
    this.inningsPlayed,
    this.notOuts,
    this.runsScored,
    this.average,
    this.thirties,
    this.fifties,
    this.hundred,
    this.zeroes,
    this.overs,
    this.mostMaidens,
    this.runsGiven,
    this.wickets,
    this.bestBowlingAverage,
    this.bowlingStrikeRate,
    this.economy,
    this.bestBowlingFigures,
    this.ballsBowled,
    this.threeWicketsHaul,
    this.fiveWicketsHaul,
    this.fourWicketsHaul,
    this.innings,
    this.trilling,
  });

  Leaderboard.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    playerName = json['player_name'];
    teamName = json['team_name'];
    teamShortName = json['team_short_name'];
    teamId = json['team_id'];
    vsTeamName = json['vs_team_name'];
    vsTeamShortName = json['vs_team_short_name'];
    vsTeamId = json['vs_team_id'];
    matchDate = json['match_date'];
    highestScore = json['highest_score'];
    ballsFaced = json['balls_faced'];
    battingStrikeRate = json['batting_strike_rate'];
    teamScore = json['team_score'];
    matchId = json['match_id'];
    forTeamName = json['for_team_name'];
    forTeamShortName = json['for_team_short_name'];
    forTeamId = json['for_team_id'];
    fours = json['fours'];
    sixes = json['sixes'];
    venue = json['venue'];
    venueId = json['venue_id'];
    forTeamDisplayName = json['for_team_display_name'];
    forTeamShortDisplayName = json['for_team_short_display_name'];
    againstTeamShortName = json['against_team_short_name'];
    againstTeamDisplayName = json['against_team_display_name'];
    againstTeamShortDisplayName = json['against_team_short_display_name'];
    gender = json['gender'];
    nationality = json['nationality'];
    nationalityId = json['nationality_id'];
    playerImage = json['player_image'];
    teamImage = json['team_image'];
    matchesPlayed = json['matches_played'];
    inningsPlayed = json['innings_played'];
    notOuts = json['not_outs'];
    runsScored = json['runs_scored'];
    average = json['average'];
    thirties = json['thirties'];
    fifties = json['fifties'];
    hundred = json['hundred'];
    zeroes = json['zeroes'];
    overs = json['overs'];
    mostMaidens = json['most_maidens'];
    runsGiven = json['runs_given'];
    wickets = json['wickets'];
    bestBowlingAverage = json['best_bowling_average'];
    bowlingStrikeRate = json['bowling_strike_rate'];
    economy = json['economy'];
    bestBowlingFigures = json['best_bowling_figures'];
    ballsBowled = json['balls_bowled'];
    threeWicketsHaul = json['three_wickets_haul'];
    fiveWicketsHaul = json['five_wickets_haul'];
    fourWicketsHaul = json['four_wickets_haul'];
    innings = json['innings'];
    trilling = json['final'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['player_id'] = playerId;
    data['player_name'] = playerName;
    data['team_name'] = teamName;
    data['team_short_name'] = teamShortName;
    data['team_id'] = teamId;
    data['vs_team_name'] = vsTeamName;
    data['vs_team_short_name'] = vsTeamShortName;
    data['vs_team_id'] = vsTeamId;
    data['match_date'] = matchDate;
    data['highest_score'] = highestScore;
    data['balls_faced'] = ballsFaced;
    data['batting_strike_rate'] = battingStrikeRate;
    data['team_score'] = teamScore;
    data['match_id'] = matchId;
    data['for_team_name'] = forTeamName;
    data['for_team_short_name'] = forTeamShortName;
    data['for_team_id'] = forTeamId;
    data['fours'] = fours;
    data['sixes'] = sixes;
    data['venue'] = venue;
    data['venue_id'] = venueId;
    data['for_team_display_name'] = forTeamDisplayName;
    data['for_team_short_display_name'] = forTeamShortDisplayName;
    data['against_team_short_name'] = againstTeamShortName;
    data['against_team_display_name'] = againstTeamDisplayName;
    data['against_team_short_display_name'] = againstTeamShortDisplayName;
    data['gender'] = gender;
    data['nationality'] = nationality;
    data['nationality_id'] = nationalityId;
    data['player_image'] = playerImage;
    data['team_image'] = teamImage;
    data['matches_played'] = matchesPlayed;
    data['innings_played'] = inningsPlayed;
    data['not_outs'] = notOuts;
    data['runs_scored'] = runsScored;
    data['average'] = average;
    data['thirties'] = thirties;
    data['fifties'] = fifties;
    data['hundred'] = hundred;
    data['zeroes'] = zeroes;
    data['overs'] = overs;
    data['most_maidens'] = mostMaidens;
    data['runs_given'] = runsGiven;
    data['wickets'] = wickets;
    data['best_bowling_average'] = bestBowlingAverage;
    data['bowling_strike_rate'] = bowlingStrikeRate;
    data['economy'] = economy;
    data['best_bowling_figures'] = bestBowlingFigures;
    data['balls_bowled'] = ballsBowled;
    data['three_wickets_haul'] = threeWicketsHaul;
    data['five_wickets_haul'] = fiveWicketsHaul;
    data['four_wickets_haul'] = fourWicketsHaul;
    data['innings'] = innings;
    data['final'] = trilling;
    return data;
  }
}

// ipl_point_table_meta

class TourPointTableMeta {
  List<TourPointsTable>? pointsTable;

  TourPointTableMeta({this.pointsTable});

  TourPointTableMeta.fromJson(Map<String, dynamic> json) {
    if (json['pointsTable'] != null) {
      pointsTable = <TourPointsTable>[];
      json['pointsTable'].forEach((v) {
        pointsTable!.add(TourPointsTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pointsTable != null) {
      data['pointsTable'] = pointsTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TourPointsTable {
  String? tourName;
  List<TourPTData>? pointsTableData;

  TourPointsTable({this.tourName, this.pointsTableData});

  TourPointsTable.fromJson(Map<String, dynamic> json) {
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
