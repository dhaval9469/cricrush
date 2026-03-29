class TourWSModel {
  double? serverTick;
  TourMatches? ipl;
  String? mode;

  TourWSModel({this.serverTick, this.ipl, this.mode});

  TourWSModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    ipl = json['ipl'] != null ? TourMatches.fromJson(json['ipl']) : null;

    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (ipl != null) {
      data['ipl'] = ipl!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

// IPLMatches

class TourMatches {
  List<TourAllMatches>? matches;
  int? liveCount;
  String? tourId;

  TourMatches({this.matches, this.liveCount, this.tourId});

  TourMatches.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = <TourAllMatches>[];
      json['matches'].forEach((v) {
        matches!.add(TourAllMatches.fromJson(v));
      });
    }
    liveCount = json['live_count'];
    tourId = json['tourId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    data['live_count'] = liveCount;
    data['tourId'] = tourId;
    return data;
  }
}

class TourAllMatches {
  TourMatchDetails? matchdetail;
  List<TourTeamList>? teamlist;
  String? matchId;
  String? seriesshortname;
  String? tossSelection;
  String? matchStatusId;
  String? tourId;
  String? language;
  String? tossElectedTo;
  List<TourInnings>? innings;
  String? type;
  String? matchfile;
  String? endMatchDateGMT;
  String? endMatchTimeGMT;
  String? daynight;
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
  String? matchDay;
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
  String? teamaImage;
  String? teambImage;

  TourAllMatches({
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
    this.type,
    this.matchfile,
    this.endMatchDateGMT,
    this.endMatchTimeGMT,
    this.daynight,
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
    this.matchDay,
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
    this.teamaImage,
    this.teambImage,
  });

  TourAllMatches.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? TourMatchDetails.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <TourTeamList>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(TourTeamList.fromJson(v));
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
      innings = <TourInnings>[];
      json['innings'].forEach((v) {
        innings!.add(TourInnings.fromJson(v));
      });
    }
    type = json['type'];
    matchfile = json['matchfile'];
    endMatchDateGMT = json['endMatchDateGMT'];
    endMatchTimeGMT = json['endMatchTimeGMT'];
    daynight = json['daynight'];
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
    matchDay = json['match_day'];
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
    teamaImage = json['teama_image'];
    teambImage = json['teamb_image'];
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
    data['type'] = type;
    data['matchfile'] = matchfile;
    data['endMatchDateGMT'] = endMatchDateGMT;
    data['endMatchTimeGMT'] = endMatchTimeGMT;
    data['daynight'] = daynight;
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
    data['match_day'] = matchDay;
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
    data['teama_image'] = teamaImage;
    data['teamb_image'] = teambImage;
    return data;
  }
}

class TourMatchDetails {
  String? isso;
  TourMatchInfo? match;
  TourSeries? series;
  TourVenue? venue;
  String? tossElectedTo;
  String? oversRemaining;
  String? statusId;
  String? winmargin;
  String? teamHome;
  String? teamAway;
  String? tosswonby;
  String? equation;
  String? day;
  String? winningteam;
  String? session;
  String? status;
  String? result;
  String? win;
  String? winNew;

  TourMatchDetails({
    this.isso,
    this.match,
    this.series,
    this.venue,
    this.tossElectedTo,
    this.oversRemaining,
    this.statusId,
    this.winmargin,
    this.teamHome,
    this.teamAway,
    this.tosswonby,
    this.equation,
    this.day,
    this.winningteam,
    this.session,
    this.status,
    this.result,
    this.win,
    this.winNew,
  });

  TourMatchDetails.fromJson(Map<String, dynamic> json) {
    isso = json['isso'];
    match = json['match'] != null ? TourMatchInfo.fromJson(json['match']) : null;
    series = json['series'] != null ? TourSeries.fromJson(json['series']) : null;
    venue = json['venue'] != null ? TourVenue.fromJson(json['venue']) : null;
    tossElectedTo = json['toss_elected_to'];
    oversRemaining = json['overs_Remaining'];
    statusId = json['status_Id'];
    winmargin = json['winmargin'];
    teamHome = json['team_Home'];
    teamAway = json['team_Away'];
    tosswonby = json['tosswonby'];
    equation = json['equation'];
    day = json['day'];
    winningteam = json['winningteam'];
    session = json['session'];
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
    data['toss_elected_to'] = tossElectedTo;
    data['overs_Remaining'] = oversRemaining;
    data['status_Id'] = statusId;
    data['winmargin'] = winmargin;
    data['team_Home'] = teamHome;
    data['team_Away'] = teamAway;
    data['tosswonby'] = tosswonby;
    data['equation'] = equation;
    data['day'] = day;
    data['winningteam'] = winningteam;
    data['session'] = session;
    data['status'] = status;
    data['result'] = result;
    data['win'] = win;
    data['win_new'] = winNew;
    return data;
  }
}

class TourTeamList {
  String? nameFull;
  String? nameShort;
  String? nameFullEng;
  String? nameShortEng;
  String? teamId;
  String? teamImage;

  TourTeamList({this.nameFull, this.nameShort, this.nameFullEng, this.nameShortEng, this.teamId, this.teamImage});

  TourTeamList.fromJson(Map<String, dynamic> json) {
    nameFull = json['name_Full'];
    nameShort = json['name_Short'];
    nameFullEng = json['name_Full_Eng'];
    nameShortEng = json['name_Short_Eng'];
    teamId = json['team_Id'];
    teamImage = json['team_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_Full'] = nameFull;
    data['name_Short'] = nameShort;
    data['name_Full_Eng'] = nameFullEng;
    data['name_Short_Eng'] = nameShortEng;
    data['team_Id'] = teamId;
    data['team_image'] = teamImage;
    return data;
  }
}

class TourInnings {
  String? allottedOvers;
  String? bowlingteam;
  bool? isdeclared;
  String? number;
  String? runrate;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? penalty;
  String? total;
  String? wickets;
  String? overs;
  String? battingteam;
  String? target;
  bool? batting;
  String? nameShort;
  String? nameFull;
  String? image;

  TourInnings({
    this.allottedOvers,
    this.bowlingteam,
    this.isdeclared,
    this.number,
    this.runrate,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.total,
    this.wickets,
    this.overs,
    this.battingteam,
    this.target,
    this.batting,
    this.nameShort,
    this.nameFull,
    this.image,
  });

  TourInnings.fromJson(Map<String, dynamic> json) {
    allottedOvers = json['allottedOvers'];
    bowlingteam = json['bowlingteam'];
    isdeclared = json['isdeclared'];
    number = json['number'];
    runrate = json['runrate'];
    byes = json['byes'];
    legbyes = json['legbyes'];
    wides = json['wides'];
    noballs = json['noballs'];
    penalty = json['penalty'];
    total = json['total'];
    wickets = json['wickets'];
    overs = json['overs'];
    battingteam = json['battingteam'];
    target = json['target'];
    batting = json['batting'];
    nameShort = json['name_Short'];
    nameFull = json['name_Full'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allottedOvers'] = allottedOvers;
    data['bowlingteam'] = bowlingteam;
    data['isdeclared'] = isdeclared;
    data['number'] = number;
    data['runrate'] = runrate;
    data['byes'] = byes;
    data['legbyes'] = legbyes;
    data['wides'] = wides;
    data['noballs'] = noballs;
    data['penalty'] = penalty;
    data['total'] = total;
    data['wickets'] = wickets;
    data['overs'] = overs;
    data['battingteam'] = battingteam;
    data['target'] = target;
    data['batting'] = batting;
    data['name_Short'] = nameShort;
    data['name_Full'] = nameFull;
    data['image'] = image;

    return data;
  }
}

class TourMatchInfo {
  String? id;
  String? typeEng;
  String? endDate;
  String? endTime;
  String? coverageLevelId;
  String? numberEng;
  String? number;
  String? code;
  String? daynight;
  String? league;
  String? compTypeId;
  String? type;
  String? offset;
  String? time;
  String? date;
  String? city;

  TourMatchInfo({
    this.id,
    this.typeEng,
    this.endDate,
    this.endTime,
    this.coverageLevelId,
    this.numberEng,
    this.number,
    this.code,
    this.daynight,
    this.league,
    this.compTypeId,
    this.type,
    this.offset,
    this.time,
    this.date,
    this.city,
  });

  TourMatchInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeEng = json['type_eng'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    coverageLevelId = json['coverage_level_id'];
    numberEng = json['number_eng'];
    number = json['number'];
    code = json['code'];
    daynight = json['daynight'];
    league = json['league'];
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
    data['type_eng'] = typeEng;
    data['end_date'] = endDate;
    data['end_time'] = endTime;
    data['coverage_level_id'] = coverageLevelId;
    data['number_eng'] = numberEng;
    data['number'] = number;
    data['code'] = code;
    data['daynight'] = daynight;
    data['league'] = league;
    data['comp_type_id'] = compTypeId;
    data['type'] = type;
    data['offset'] = offset;
    data['time'] = time;
    data['date'] = date;
    data['city'] = city;
    return data;
  }
}

class TourSeries {
  String? shortName;
  String? tourName;
  String? seriesShortDisplayNameEng;
  String? seriesShortDisplayName;
  String? status;
  String? id;
  String? name;

  TourSeries({
    this.shortName,
    this.tourName,
    this.seriesShortDisplayNameEng,
    this.seriesShortDisplayName,
    this.status,
    this.id,
    this.name,
  });

  TourSeries.fromJson(Map<String, dynamic> json) {
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

class TourVenue {
  String? id;
  String? name;

  TourVenue({this.id, this.name});

  TourVenue.fromJson(Map<String, dynamic> json) {
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
