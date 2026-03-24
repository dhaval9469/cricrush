class LMWModel {
  double? serverTick;
  WSLSDetailsModel? data;
  String? mode;

  LMWModel({this.serverTick, this.data, this.mode});

  LMWModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    data = json['data'] != null ? WSLSDetailsModel.fromJson(json['data']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class WSLSDetailsModel {
  String? overNo;
  int? ballNo;
  bool? live;
  String? weather;
  String? team1Name;
  String? team1NameSort;
  String? team1Image;
  String? team2Name;
  String? team2NameSort;
  String? team2Image;
  String? equation;
  String? rawMatchresult;
  String? eqType;
  String? win;
  String? league;
  String? type;
  String? date;
  String? number;
  String? startDate;
  String? matchId;
  String? time;
  String? umpires;
  String? referee;
  String? seriesShortDisplayName;
  String? seriesId;
  String? tourId;
  String? tourName;
  String? status;
  int? lineupStatus;
  String? requiredRunrate;
  String? teamHome;
  String? teamAway;
  String? tosswonby;
  String? tossElectedTo;
  List<WSLMTeam>? team;
  bool? dataUpdate;
  String? battingTeam;
  List<WSLMMatchdetail>? matchdetail;
  List<WSLMAwards>? awards;
  List<WSLMNotes>? notes;
  List<WSLMOverDetails>? overDetails;
  List<WSLMUPCMatch>? matches;
  List<WSLMMatchesFinal>? matchesFinal;
  List<WSLMCommentry>? commentry;

  WSLSDetailsModel({
    this.overNo,
    this.ballNo,
    this.live,
    this.weather,
    this.team1Name,
    this.team1NameSort,
    this.team1Image,
    this.team2Name,
    this.team2NameSort,
    this.team2Image,
    this.equation,
    this.rawMatchresult,
    this.eqType,
    this.win,
    this.league,
    this.type,
    this.date,
    this.number,
    this.startDate,
    this.matchId,
    this.time,
    this.umpires,
    this.referee,
    this.seriesShortDisplayName,
    this.seriesId,
    this.tourId,
    this.tourName,
    this.status,
    this.lineupStatus,
    this.requiredRunrate,
    this.teamHome,
    this.teamAway,
    this.tosswonby,
    this.tossElectedTo,
    this.team,
    this.dataUpdate,
    this.battingTeam,
    this.matchdetail,
    this.awards,
    this.notes,
    this.overDetails,
    this.matches,
    this.matchesFinal,
    this.commentry,
  });

  WSLSDetailsModel.fromJson(Map<String, dynamic> json) {
    overNo = json['over_no'];
    ballNo = json['BallNo'];
    live = json['Live'];
    weather = json['Weather'];
    team1Name = json['Team1_name'];
    team1NameSort = json['Team1_name_sort'];
    team1Image = json['Team1_image'];
    team2Name = json['Team2_name'];
    team2NameSort = json['Team2_name_sort'];
    team2Image = json['Team2_image'];
    equation = json['Equation'];
    rawMatchresult = json['Raw_matchresult'];
    eqType = json['Eq_type'];
    win = json['win'];
    league = json['League'];
    type = json['Type'];
    date = json['Date'];
    number = json['Number'];
    startDate = json['StartDate'];
    matchId = json['match_id'];
    time = json['Time'];
    umpires = json['Umpires'];
    referee = json['Referee'];
    seriesShortDisplayName = json['Series_short_display_name'];
    seriesId = json['Series_Id'];
    tourId = json['Tour_Id'];
    tourName = json['Tour_Name'];
    status = json['Status'];
    lineupStatus = json['Lineup_status'];
    requiredRunrate = json['Required_Runrate'];
    teamHome = json['Team_Home'];
    teamAway = json['Team_Away'];
    tosswonby = json['Tosswonby'];
    tossElectedTo = json['Toss_elected_to'];
    if (json['team'] != null) {
      team = <WSLMTeam>[];
      json['team'].forEach((v) {
        team?.add(WSLMTeam.fromJson(v));
      });
    }
    dataUpdate = json['data_update'];
    battingTeam = json['batting_team'];
    if (json['Matchdetail'] != null) {
      matchdetail = <WSLMMatchdetail>[];
      json['Matchdetail'].forEach((v) {
        matchdetail?.add(WSLMMatchdetail.fromJson(v));
      });
    }
    if (json['Awards'] != null) {
      awards = <WSLMAwards>[];
      json['Awards'].forEach((v) {
        awards?.add(WSLMAwards.fromJson(v));
      });
    }
    if (json['Notes'] != null) {
      notes = <WSLMNotes>[];
      json['Notes'].forEach((v) {
        notes?.add(WSLMNotes.fromJson(v));
      });
    }
    if (json['Over_Details'] != null) {
      overDetails = <WSLMOverDetails>[];
      json['Over_Details'].forEach((v) {
        overDetails?.add(WSLMOverDetails.fromJson(v));
      });
    }
    if (json['matches'] != null) {
      matches = <WSLMUPCMatch>[];
      json['matches'].forEach((v) {
        matches?.add(WSLMUPCMatch.fromJson(v));
      });
    }
    if (json['matches_final'] != null) {
      matchesFinal = <WSLMMatchesFinal>[];
      json['matches_final'].forEach((v) {
        matchesFinal?.add(WSLMMatchesFinal.fromJson(v));
      });
    }
    if (json['commentry'] != null) {
      commentry = <WSLMCommentry>[];
      json['commentry'].forEach((v) {
        commentry!.add(WSLMCommentry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['over_no'] = overNo;
    data['BallNo'] = ballNo;
    data['Live'] = live;
    data['Weather'] = weather;
    data['Team1_name'] = team1Name;
    data['Team1_name_sort'] = team1NameSort;
    data['Team1_image'] = team1Image;
    data['Team2_name'] = team2Name;
    data['Team2_name_sort'] = team2NameSort;
    data['Team2_image'] = team2Image;
    data['Equation'] = equation;
    data['Raw_matchresult'] = rawMatchresult;
    data['Eq_type'] = eqType;
    data['win'] = win;
    data['League'] = league;
    data['Type'] = type;
    data['Date'] = date;
    data['Number'] = number;
    data['StartDate'] = startDate;
    data['match_id'] = matchId;
    data['Time'] = time;
    data['Umpires'] = umpires;
    data['Referee'] = referee;
    data['Series_short_display_name'] = seriesShortDisplayName;
    data['Series_Id'] = seriesId;
    data['Tour_Id'] = tourId;
    data['Tour_Name'] = tourName;
    data['Status'] = status;
    data['Lineup_status'] = lineupStatus;
    data['Required_Runrate'] = requiredRunrate;
    data['Team_Home'] = teamHome;
    data['Team_Away'] = teamAway;
    data['Tosswonby'] = tosswonby;
    data['Toss_elected_to'] = tossElectedTo;
    if (team != null) {
      data['team'] = team!.map((v) => v.toJson()).toList();
    }
    data['data_update'] = dataUpdate;
    data['batting_team'] = battingTeam;
    if (matchdetail != null) {
      data['Matchdetail'] = matchdetail!.map((v) => v.toJson()).toList();
    }
    if (awards != null) {
      data['Awards'] = awards!.map((v) => v.toJson()).toList();
    }
    if (notes != null) {
      data['Notes'] = notes!.map((v) => v.toJson()).toList();
    }
    if (overDetails != null) {
      data['Over_Details'] = overDetails!.map((v) => v.toJson()).toList();
    }
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    if (matchesFinal != null) {
      data['matches_final'] = matchesFinal!.map((v) => v.toJson()).toList();
    }
    if (commentry != null) {
      data['commentry'] = commentry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WSLMTeam {
  String? battingteam;
  String? total;
  String? wickets;
  String? overs;
  String? runrate;
  WSLMBestPerformers? bestPerformers;
  bool? batting;

  WSLMTeam({this.battingteam, this.total, this.wickets, this.overs, this.runrate, this.bestPerformers, this.batting});

  WSLMTeam.fromJson(Map<String, dynamic> json) {
    battingteam = json['Battingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
    runrate = json['Runrate'];
    bestPerformers = json['Best_Performers'] != null ? WSLMBestPerformers.fromJson(json['Best_Performers']) : null;
    batting = json['batting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Battingteam'] = battingteam;
    data['Total'] = total;
    data['Wickets'] = wickets;
    data['Overs'] = overs;
    data['Runrate'] = runrate;
    if (bestPerformers != null) {
      data['Best_Performers'] = bestPerformers!.toJson();
    }
    data['batting'] = batting;
    return data;
  }
}

class WSLMBestPerformers {
  List<WSLMBPBatsmen>? batsmen;
  List<WSLMBPBowlers>? bowlers;

  WSLMBestPerformers({this.batsmen, this.bowlers});

  WSLMBestPerformers.fromJson(Map<String, dynamic> json) {
    if (json['Batsmen'] != null) {
      batsmen = <WSLMBPBatsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(WSLMBPBatsmen.fromJson(v));
      });
    }
    if (json['Bowlers'] != null) {
      bowlers = <WSLMBPBowlers>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(WSLMBPBowlers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    if (bowlers != null) {
      data['Bowlers'] = bowlers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WSLMBPBatsmen {
  String? playerId;
  String? playerName;
  String? teamId;
  String? teamName;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? strikerate;
  String? playerImage;

  WSLMBPBatsmen({
    this.playerId,
    this.playerName,
    this.teamId,
    this.teamName,
    this.runs,
    this.balls,
    this.fours,
    this.sixes,
    this.strikerate,
    this.playerImage,
  });

  WSLMBPBatsmen.fromJson(Map<String, dynamic> json) {
    playerId = json['Player_Id'];
    playerName = json['Player_Name'];
    teamId = json['Team_Id'];
    teamName = json['Team_Name'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    strikerate = json['Strikerate'];
    playerImage = json['Player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Player_Id'] = playerId;
    data['Player_Name'] = playerName;
    data['Team_Id'] = teamId;
    data['Team_Name'] = teamName;
    data['Runs'] = runs;
    data['Balls'] = balls;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Strikerate'] = strikerate;
    data['Player_image'] = playerImage;
    return data;
  }
}

class WSLMBPBowlers {
  String? playerId;
  String? playerName;
  String? teamId;
  String? teamName;
  String? wickets;
  String? ballsBowled;
  String? economyrate;
  String? overs;
  String? runs;
  String? fours;
  String? sixes;
  String? playerImage;

  WSLMBPBowlers({
    this.playerId,
    this.playerName,
    this.teamId,
    this.teamName,
    this.wickets,
    this.ballsBowled,
    this.economyrate,
    this.overs,
    this.runs,
    this.fours,
    this.sixes,
    this.playerImage,
  });

  WSLMBPBowlers.fromJson(Map<String, dynamic> json) {
    playerId = json['Player_Id'];
    playerName = json['Player_Name'];
    teamId = json['Team_Id'];
    teamName = json['Team_Name'];
    wickets = json['Wickets'];
    ballsBowled = json['Balls_Bowled'];
    economyrate = json['Economyrate'];
    overs = json['Overs'];
    runs = json['Runs'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    playerImage = json['Player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Player_Id'] = playerId;
    data['Player_Name'] = playerName;
    data['Team_Id'] = teamId;
    data['Team_Name'] = teamName;
    data['Wickets'] = wickets;
    data['Balls_Bowled'] = ballsBowled;
    data['Economyrate'] = economyrate;
    data['Overs'] = overs;
    data['Runs'] = runs;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Player_image'] = playerImage;
    return data;
  }
}

class WSLMMatchdetail {
  String? battingteam;
  String? bowlingteam;
  String? total;
  String? wickets;
  String? overs;
  String? runrate;
  List<WSLMBatsmen>? batsmen;
  List<WSLMBowlers>? bowlers;
  List<WSLMThisOver>? thisOver;
  List<WSLMFallofWickets>? fallofWickets;
  List<WSLMPowerPlay>? powerPlay;
  List<WSLMPowerPlayDetails>? powerPlayDetails;

  WSLMMatchdetail({
    this.battingteam,
    this.bowlingteam,
    this.total,
    this.wickets,
    this.overs,
    this.runrate,
    this.batsmen,
    this.bowlers,
    this.thisOver,
    this.fallofWickets,
    this.powerPlay,
    this.powerPlayDetails,
  });

  WSLMMatchdetail.fromJson(Map<String, dynamic> json) {
    battingteam = json['Battingteam'];
    bowlingteam = json['Bowlingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
    runrate = json['Runrate'];
    if (json['Batsmen'] != null) {
      batsmen = <WSLMBatsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(WSLMBatsmen.fromJson(v));
      });
    }
    if (json['Bowlers'] != null) {
      bowlers = <WSLMBowlers>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(WSLMBowlers.fromJson(v));
      });
    }
    if (json['ThisOver'] != null) {
      thisOver = <WSLMThisOver>[];
      json['ThisOver'].forEach((v) {
        thisOver!.add(WSLMThisOver.fromJson(v));
      });
    }
    if (json['FallofWickets'] != null) {
      fallofWickets = <WSLMFallofWickets>[];
      json['FallofWickets'].forEach((v) {
        fallofWickets!.add(WSLMFallofWickets.fromJson(v));
      });
    }
    if (json['PowerPlay'] != null) {
      powerPlay = <WSLMPowerPlay>[];
      json['PowerPlay'].forEach((v) {
        powerPlay!.add(WSLMPowerPlay.fromJson(v));
      });
    }
    if (json['PowerPlayDetails'] != null) {
      powerPlayDetails = <WSLMPowerPlayDetails>[];
      json['PowerPlayDetails'].forEach((v) {
        powerPlayDetails!.add(WSLMPowerPlayDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Battingteam'] = battingteam;
    data['Bowlingteam'] = bowlingteam;
    data['Total'] = total;
    data['Wickets'] = wickets;
    data['Overs'] = overs;
    data['Runrate'] = runrate;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    if (bowlers != null) {
      data['Bowlers'] = bowlers!.map((v) => v.toJson()).toList();
    }
    if (thisOver != null) {
      data['ThisOver'] = thisOver!.map((v) => v.toJson()).toList();
    }
    if (fallofWickets != null) {
      data['FallofWickets'] = fallofWickets!.map((v) => v.toJson()).toList();
    }
    if (powerPlay != null) {
      data['PowerPlay'] = powerPlay!.map((v) => v.toJson()).toList();
    }
    if (powerPlayDetails != null) {
      data['PowerPlayDetails'] = powerPlayDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WSLMBatsmen {
  String? batsman;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? strikerate;
  String? playerImage;
  bool? isonstrike;

  WSLMBatsmen({this.batsman, this.runs, this.balls, this.fours, this.sixes, this.strikerate, this.playerImage, this.isonstrike});

  WSLMBatsmen.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    strikerate = json['Strikerate'];
    playerImage = json['Player_image'];
    isonstrike = json['Isonstrike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Runs'] = runs;
    data['Balls'] = balls;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Strikerate'] = strikerate;
    data['Player_image'] = playerImage;
    data['Isonstrike'] = isonstrike;
    return data;
  }
}

class WSLMBowlers {
  String? bowler;
  String? overs;
  String? runs;
  String? wickets;
  String? economyrate;
  String? maidens;
  String? playerImage;
  bool? isbowlingnow;

  WSLMBowlers({
    this.bowler,
    this.overs,
    this.runs,
    this.wickets,
    this.economyrate,
    this.maidens,
    this.playerImage,
    this.isbowlingnow,
  });

  WSLMBowlers.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    overs = json['Overs'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    economyrate = json['Economyrate'];
    maidens = json['Maidens'];
    playerImage = json['Player_image'];
    isbowlingnow = json['Isbowlingnow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bowler'] = bowler;
    data['Overs'] = overs;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    data['Economyrate'] = economyrate;
    data['Maidens'] = maidens;
    data['Player_image'] = playerImage;
    data['Isbowlingnow'] = isbowlingnow;
    return data;
  }
}

class WSLMThisOver {
  String? t;
  String? b;

  WSLMThisOver({this.t, this.b});

  WSLMThisOver.fromJson(Map<String, dynamic> json) {
    t = json['T'];
    b = json['B'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['T'] = t;
    data['B'] = b;
    return data;
  }
}

class WSLMFallofWickets {
  String? batsman;
  String? score;
  int? wicketNo;
  String? overs;

  WSLMFallofWickets({this.batsman, this.score, this.wicketNo, this.overs});

  WSLMFallofWickets.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    score = json['Score'];
    wicketNo = json['Wicket_No'];
    overs = json['Overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Score'] = score;
    data['Wicket_No'] = wicketNo;
    data['Overs'] = overs;
    return data;
  }
}

class WSLMPowerPlay {
  String? pP1;

  WSLMPowerPlay({this.pP1});

  WSLMPowerPlay.fromJson(Map<String, dynamic> json) {
    pP1 = json['PP1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PP1'] = pP1;
    return data;
  }
}

class WSLMPowerPlayDetails {
  String? name;
  String? overs;
  String? runs;
  String? wickets;

  WSLMPowerPlayDetails({this.name, this.overs, this.runs, this.wickets});

  WSLMPowerPlayDetails.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    overs = json['Overs'];
    runs = json['Runs'];
    wickets = json['Wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Overs'] = overs;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    return data;
  }
}

class WSLMNotes {
  String? teamImage;
  String? team;
  List<String>? desc;

  WSLMNotes({this.teamImage, this.team, this.desc});

  WSLMNotes.fromJson(Map<String, dynamic> json) {
    teamImage = json['team_image'];
    team = json['team'];
    desc = json['desc'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_image'] = teamImage;
    data['team'] = team;
    data['desc'] = desc;
    return data;
  }
}

class WSLMOverDetails {
  int? overNumber;
  String? thisOver;
  String? teamName;
  String? totalRuns;
  String? totalWickets;

  WSLMOverDetails({this.overNumber, this.thisOver, this.teamName, this.totalRuns, this.totalWickets});

  WSLMOverDetails.fromJson(Map<String, dynamic> json) {
    overNumber = json['over_number'];
    thisOver = json['this_over'];
    teamName = json['team_name'];
    totalRuns = json['total_runs'];
    totalWickets = json['total_wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['over_number'] = overNumber;
    data['this_over'] = thisOver;
    data['team_name'] = teamName;
    data['total_runs'] = totalRuns;
    data['total_wickets'] = totalWickets;
    return data;
  }
}

class WSLMUPCMatch {
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
  String? type;

  WSLMUPCMatch({
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
    this.type,
  });

  WSLMUPCMatch.fromJson(Map<String, dynamic> json) {
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
    type = json['type'];
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
    data['type'] = type;
    return data;
  }
}

class WSLMMatchesFinal {
  WSFMMatchdetail? matchdetail;
  List<WSTeamlist>? teamlist;
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
  List<WSFMInning>? innings;
  String? type;

  WSLMMatchesFinal({
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
    this.type,
  });

  WSLMMatchesFinal.fromJson(Map<String, dynamic> json) {
    matchdetail = json['matchdetail'] != null ? WSFMMatchdetail.fromJson(json['matchdetail']) : null;
    if (json['teamlist'] != null) {
      teamlist = <WSTeamlist>[];
      json['teamlist'].forEach((v) {
        teamlist!.add(WSTeamlist.fromJson(v));
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
      innings = <WSFMInning>[];
      json['innings'].forEach((v) {
        innings!.add(WSFMInning.fromJson(v));
      });
    }
    type = json['type'];
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
    data['type'] = type;
    return data;
  }
}

class WSFMMatchdetail {
  String? isso;
  LMMatch? match;
  LMSeries? series;
  String? oversRemaining;
  String? statusId;
  String? winmargin;
  String? teamHome;
  String? teamAway;
  String? tosswonby;
  String? equation;
  String? tossElectedTo;
  String? winningteam;
  String? day;
  String? session;
  String? status;
  String? result;
  String? win;
  String? winNew;

  WSFMMatchdetail({
    this.isso,
    this.match,
    this.series,
    this.oversRemaining,
    this.statusId,
    this.winmargin,
    this.teamHome,
    this.teamAway,
    this.tosswonby,
    this.equation,
    this.tossElectedTo,
    this.winningteam,
    this.day,
    this.session,
    this.status,
    this.result,
    this.win,
    this.winNew,
  });

  WSFMMatchdetail.fromJson(Map<String, dynamic> json) {
    isso = json['isso'];
    match = json['match'] != null ? LMMatch.fromJson(json['match']) : null;
    series = json['series'] != null ? LMSeries.fromJson(json['series']) : null;
    oversRemaining = json['overs_Remaining'];
    statusId = json['status_Id'];
    winmargin = json['winmargin'];
    teamHome = json['team_Home'];
    teamAway = json['team_Away'];
    tosswonby = json['tosswonby'];
    equation = json['equation'];

    tossElectedTo = json['toss_elected_to'];
    winningteam = json['winningteam'];
    day = json['day'];
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
    data['overs_Remaining'] = oversRemaining;
    data['status_Id'] = statusId;
    data['winmargin'] = winmargin;
    data['team_Home'] = teamHome;
    data['team_Away'] = teamAway;
    data['tosswonby'] = tosswonby;
    data['equation'] = equation;
    data['toss_elected_to'] = tossElectedTo;
    data['winningteam'] = winningteam;
    data['day'] = day;
    data['session'] = session;
    data['status'] = status;
    data['result'] = result;
    data['win'] = win;
    data['win_new'] = winNew;
    return data;
  }
}

class LMMatch {
  String? id;
  String? coverageLevelId;
  String? numberEng;
  String? typeEng;
  String? endDate;
  String? endTime;
  String? number;
  String? daynight;
  String? league;
  String? code;
  String? compTypeId;
  String? type;
  String? offset;
  String? time;
  String? date;
  String? city;

  LMMatch({
    this.id,
    this.coverageLevelId,
    this.numberEng,
    this.typeEng,
    this.endDate,
    this.endTime,
    this.number,
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

  LMMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coverageLevelId = json['coverage_level_id'];
    numberEng = json['number_eng'];
    typeEng = json['type_eng'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    number = json['number'];
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
    data['type_eng'] = typeEng;
    data['end_date'] = endDate;
    data['end_time'] = endTime;
    data['number'] = number;
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

class LMSeries {
  String? shortName;
  String? tourName;
  String? seriesShortDisplayNameEng;
  String? seriesShortDisplayName;
  String? status;
  String? id;
  String? name;

  LMSeries({
    this.shortName,
    this.tourName,
    this.seriesShortDisplayNameEng,
    this.seriesShortDisplayName,
    this.status,
    this.id,
    this.name,
  });

  LMSeries.fromJson(Map<String, dynamic> json) {
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

class WSLMAwards {
  String? playerName;
  String? playerImage;

  WSLMAwards({this.playerName, this.playerImage});

  WSLMAwards.fromJson(Map<String, dynamic> json) {
    playerName = json['Player_name'];
    playerImage = json['Player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Player_name'] = playerName;
    data['Player_image'] = playerImage;
    return data;
  }
}

class WSTeamlist {
  String? nameShort;
  String? nameFullEng;
  String? nameShortEng;
  String? nameFull;
  String? teamId;
  String? teamImage;

  WSTeamlist({this.nameShort, this.nameFullEng, this.nameShortEng, this.nameFull, this.teamId, this.teamImage});

  WSTeamlist.fromJson(Map<String, dynamic> json) {
    nameShort = json['name_Short'];
    nameFullEng = json['name_Full_Eng'];
    nameShortEng = json['name_Short_Eng'];
    nameFull = json['name_Full'];
    teamId = json['team_Id'];
    teamImage = json['team_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_Short'] = nameShort;
    data['name_Full_Eng'] = nameFullEng;
    data['name_Short_Eng'] = nameShortEng;
    data['name_Full'] = nameFull;
    data['team_Id'] = teamId;
    data['team_image'] = teamImage;
    return data;
  }
}

class WSFMInning {
  String? total;
  String? number;
  bool? isdeclared;
  String? runrate;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? penalty;
  String? wickets;
  String? overs;
  String? allottedOvers;
  String? bowlingteam;
  String? battingteam;
  String? nameShort;
  String? nameFull;
  String? image;
  String? target;

  WSFMInning({
    this.total,
    this.number,
    this.isdeclared,
    this.runrate,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.wickets,
    this.overs,
    this.allottedOvers,
    this.bowlingteam,
    this.battingteam,
    this.nameShort,
    this.nameFull,
    this.image,
    this.target,
  });

  WSFMInning.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    number = json['number'];
    isdeclared = json['isdeclared'];
    runrate = json['runrate'];
    byes = json['byes'];
    legbyes = json['legbyes'];
    wides = json['wides'];
    noballs = json['noballs'];
    penalty = json['penalty'];
    wickets = json['wickets'];
    overs = json['overs'];
    allottedOvers = json['allottedOvers'];
    bowlingteam = json['bowlingteam'];
    battingteam = json['battingteam'];
    nameShort = json['name_Short'];
    nameFull = json['name_Full'];
    image = json['image'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['number'] = number;
    data['isdeclared'] = isdeclared;
    data['runrate'] = runrate;
    data['byes'] = byes;
    data['legbyes'] = legbyes;
    data['wides'] = wides;
    data['noballs'] = noballs;
    data['penalty'] = penalty;
    data['wickets'] = wickets;
    data['overs'] = overs;
    data['allottedOvers'] = allottedOvers;
    data['bowlingteam'] = bowlingteam;
    data['battingteam'] = battingteam;
    data['name_Short'] = nameShort;
    data['name_Full'] = nameFull;
    data['image'] = image;
    data['target'] = target;
    return data;
  }
}

class WSLMCommentry {
  String? over;
  String? commentary;
  String? runs;
  String? defaultCommentary;

  WSLMCommentry({this.over, this.commentary, this.runs, this.defaultCommentary});

  WSLMCommentry.fromJson(Map<String, dynamic> json) {
    over = json['Over'];
    commentary = json['Commentary'];
    runs = json['Runs'];
    defaultCommentary = json['Default_Commentary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Over'] = over;
    data['Commentary'] = commentary;
    data['Runs'] = runs;
    data['Default_Commentary'] = defaultCommentary;
    return data;
  }
}
