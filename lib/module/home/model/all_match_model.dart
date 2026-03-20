class AllMatchModel {
  MtLive? mtlive;
  MtUpComing? mtupcoming;
  MtResult? mtresult;
  HomeMatches? home;
  String? mode;

  AllMatchModel({this.mtlive, this.mtupcoming, this.mtresult, this.home, this.mode});

  AllMatchModel.fromJson(Map<String, dynamic> json) {
    mtlive = json['mtlive'] != null ? MtLive.fromJson(json['mtlive']) : null;
    mtupcoming = json['mtupcoming'] != null ? MtUpComing.fromJson(json['mtupcoming']) : null;
    mtresult = json['mtresult'] != null ? MtResult.fromJson(json['mtresult']) : null;
    home = json['home'] != null ? HomeMatches.fromJson(json['home']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mtlive != null) {
      data['mtlive'] = mtlive!.toJson();
    }
    if (mtupcoming != null) {
      data['mtupcoming'] = mtupcoming!.toJson();
    }
    if (mtresult != null) {
      data['mtresult'] = mtresult!.toJson();
    }
    if (home != null) {
      data['home'] = home!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

// MTLiveMatch

class MtLive {
  List<LiveSeriesData>? seriesData;
  int? liveCount;

  MtLive({this.seriesData, this.liveCount});

  MtLive.fromJson(Map<String, dynamic> json) {
    if (json['series_data'] != null) {
      seriesData = <LiveSeriesData>[];
      json['series_data'].forEach((v) {
        seriesData!.add(LiveSeriesData.fromJson(v));
      });
    }
    liveCount = json['live_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seriesData != null) {
      data['series_data'] = seriesData!.map((v) => v.toJson()).toList();
    }
    data['live_count'] = liveCount;
    return data;
  }
}

class LiveSeriesData {
  String? seriesName;
  String? tourName;
  String? seriesId;
  String? tourId;
  List<MTLiveMatch>? live;
  String? image;
  String? bigImage;

  LiveSeriesData({this.seriesName, this.tourName, this.seriesId, this.tourId, this.live, this.image, this.bigImage});

  LiveSeriesData.fromJson(Map<String, dynamic> json) {
    seriesName = json['series_name'];
    tourName = json['tour_name'];
    seriesId = json['series_id'];
    tourId = json['tour_id'];
    if (json['live'] != null) {
      live = <MTLiveMatch>[];
      json['live'].forEach((v) {
        live!.add(MTLiveMatch.fromJson(v));
      });
    }
    image = json['Image'];
    bigImage = json['big_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['series_name'] = seriesName;
    data['tour_name'] = tourName;
    data['series_id'] = seriesId;
    data['tour_id'] = tourId;
    if (live != null) {
      data['live'] = live!.map((v) => v.toJson()).toList();
    }
    data['Image'] = image;
    data['big_Image'] = bigImage;
    return data;
  }
}

class MTLiveMatch {
  MatchDetails? matchdetail;
  List<TeamList>? teamlist;
  String? matchId;
  String? seriesshortname;
  String? tossSelection;
  String? matchStatusId;
  String? tourId;
  String? language;
  String? tossElectedTo;
  List<Innings>? innings;

  MTLiveMatch({
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

  MTLiveMatch.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? MatchDetails.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <TeamList>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(TeamList.fromJson(v));
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
      innings = <Innings>[];
      json['innings'].forEach((v) {
        innings!.add(Innings.fromJson(v));
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

class MatchDetails {
  String? isso;
  MatchInfo? match;
  Series? series;
  Venue? venue;
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

  MatchDetails({
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

  MatchDetails.fromJson(Map<String, dynamic> json) {
    isso = json['isso'];
    match = json['match'] != null ? MatchInfo.fromJson(json['match']) : null;
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
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

class MatchInfo {
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

  MatchInfo({
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

  MatchInfo.fromJson(Map<String, dynamic> json) {
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

class Series {
  String? shortName;
  String? tourName;
  String? seriesShortDisplayNameEng;
  String? seriesShortDisplayName;
  String? status;
  String? id;
  String? name;

  Series({
    this.shortName,
    this.tourName,
    this.seriesShortDisplayNameEng,
    this.seriesShortDisplayName,
    this.status,
    this.id,
    this.name,
  });

  Series.fromJson(Map<String, dynamic> json) {
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

class Venue {
  String? id;
  String? name;

  Venue({this.id, this.name});

  Venue.fromJson(Map<String, dynamic> json) {
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

class TeamList {
  String? nameFull;
  String? nameShort;
  String? nameFullEng;
  String? nameShortEng;
  String? teamId;
  String? teamImage;

  TeamList({this.nameFull, this.nameShort, this.nameFullEng, this.nameShortEng, this.teamId, this.teamImage});

  TeamList.fromJson(Map<String, dynamic> json) {
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

class Innings {
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

  Innings({
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

  Innings.fromJson(Map<String, dynamic> json) {
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

// MTUpComingMatch

class MtUpComing {
  List<UCSeriesData>? seriesData;

  MtUpComing({this.seriesData});

  MtUpComing.fromJson(Map<String, dynamic> json) {
    if (json['series_data'] != null) {
      seriesData = <UCSeriesData>[];
      json['series_data'].forEach((v) {
        seriesData!.add(UCSeriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seriesData != null) {
      data['series_data'] = seriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UCSeriesData {
  String? seriesName;
  String? tourName;
  String? seriesId;
  String? tourId;
  List<MTUpComingMatch>? upcoming;
  String? image;
  String? bigImage;

  UCSeriesData({this.seriesName, this.tourName, this.seriesId, this.tourId, this.upcoming, this.image, this.bigImage});

  UCSeriesData.fromJson(Map<String, dynamic> json) {
    seriesName = json['series_name'];
    tourName = json['tour_name'];
    seriesId = json['series_id'];
    tourId = json['tour_id'];
    if (json['upcoming'] != null) {
      upcoming = <MTUpComingMatch>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(MTUpComingMatch.fromJson(v));
      });
    }
    image = json['Image'];
    bigImage = json['big_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['series_name'] = seriesName;
    data['tour_name'] = tourName;
    data['series_id'] = seriesId;
    data['tour_id'] = tourId;
    if (upcoming != null) {
      data['upcoming'] = upcoming!.map((v) => v.toJson()).toList();
    }

    data['Image'] = image;
    data['big_Image'] = bigImage;
    return data;
  }
}

class MTUpComingMatch {
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

  MTUpComingMatch({
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

  MTUpComingMatch.fromJson(Map<String, dynamic> json) {
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

// MTResultsMatch

class MtResult {
  List<RSeriesData>? seriesData;

  MtResult({this.seriesData});

  MtResult.fromJson(Map<String, dynamic> json) {
    if (json['series_data'] != null) {
      seriesData = <RSeriesData>[];
      json['series_data'].forEach((v) {
        seriesData!.add(RSeriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seriesData != null) {
      data['series_data'] = seriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RSeriesData {
  String? seriesName;
  String? tourName;
  String? seriesId;
  String? tourId;
  List<MTResultsMatch>? results;
  String? image;
  String? bigImage;

  RSeriesData({this.seriesName, this.tourName, this.seriesId, this.tourId, this.results, this.image, this.bigImage});

  RSeriesData.fromJson(Map<String, dynamic> json) {
    seriesName = json['series_name'];
    tourName = json['tour_name'];
    seriesId = json['series_id'];
    tourId = json['tour_id'];
    if (json['results'] != null) {
      results = <MTResultsMatch>[];
      json['results'].forEach((v) {
        results!.add(MTResultsMatch.fromJson(v));
      });
    }
    image = json['Image'];
    bigImage = json['big_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['series_name'] = seriesName;
    data['tour_name'] = tourName;
    data['series_id'] = seriesId;
    data['tour_id'] = tourId;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['Image'] = image;
    data['big_Image'] = bigImage;
    return data;
  }
}

class MTResultsMatch {
  MatchDetails? matchdetail;
  List<TeamList>? teamlist;
  String? matchId;
  String? seriesshortname;
  String? tossSelection;
  String? matchStatusId;
  String? tourId;
  String? language;
  String? endMatchDateGMT;
  String? endMatchTimeGMT;
  String? tossElectedTo;
  List<Innings>? innings;

  MTResultsMatch({
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
    this.tossElectedTo,
    this.innings,
  });

  MTResultsMatch.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? MatchDetails.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <TeamList>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(TeamList.fromJson(v));
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
    tossElectedTo = json['toss_elected_to'];
    if (json['innings'] != null) {
      innings = <Innings>[];
      json['innings'].forEach((v) {
        innings!.add(Innings.fromJson(v));
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
    data['toss_elected_to'] = tossElectedTo;
    if (innings != null) {
      data['innings'] = innings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// HomeMatches
class HomeMatches {
  List<HAllMatches>? matches;
  int? liveCount;

  HomeMatches({this.matches, this.liveCount});

  HomeMatches.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = <HAllMatches>[];
      json['matches'].forEach((v) {
        matches!.add(HAllMatches.fromJson(v));
      });
    }
    liveCount = json['live_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    data['live_count'] = liveCount;
    return data;
  }
}

class HAllMatches {
  MatchDetails? matchdetail;
  List<TeamList>? teamlist;
  String? matchId;
  String? seriesshortname;
  String? tossSelection;
  String? matchStatusId;
  String? tourId;
  String? language;
  String? tossElectedTo;
  List<Innings>? innings;
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

  HAllMatches({
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

  HAllMatches.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? MatchDetails.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <TeamList>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(TeamList.fromJson(v));
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
      innings = <Innings>[];
      json['innings'].forEach((v) {
        innings!.add(Innings.fromJson(v));
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
