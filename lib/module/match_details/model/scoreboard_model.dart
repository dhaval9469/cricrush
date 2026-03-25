class ScoreBoardModel {
  double? serverTick;
  ScoreboardData? scoreboard;
  String? mode;

  ScoreBoardModel({this.serverTick, this.scoreboard, this.mode});

  ScoreBoardModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    scoreboard = json['scoreboard'] != null ? ScoreboardData.fromJson(json['scoreboard']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (scoreboard != null) {
      data['scoreboard'] = scoreboard!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class ScoreboardData {
  List<SBInning>? innings;
  MatchDetailsInfo? matchdetail;

  ScoreboardData({this.innings, this.matchdetail});

  ScoreboardData.fromJson(Map<String, dynamic> json) {
    if (json['Innings'] != null) {
      innings = <SBInning>[];
      json['Innings'].forEach((v) {
        innings!.add(SBInning.fromJson(v));
      });
    }
    matchdetail = json['Matchdetail'] != null ? MatchDetailsInfo.fromJson(json['Matchdetail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (innings != null) {
      data['Innings'] = innings!.map((v) => v.toJson()).toList();
    }
    if (matchdetail != null) {
      data['Matchdetail'] = matchdetail!.toJson();
    }
    return data;
  }
}

class SBInning {
  String? number;
  String? battingteam;
  String? bowlingteam;
  String? total;
  String? wickets;
  String? overs;
  String? totalBallsBowled;
  String? allotedBalls;
  String? runrate;
  String? runsperball;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? penalty;
  String? allottedOvers;
  String? target;
  List<InningBatsman>? batsmen;

  // PartnershipCurrent? partnershipCurrent;
  List<InningBowlers>? bowlers;
  List<InningFallofWickets>? fallofWickets;
  int? statusId;

  // ReviewDetails? reviewDetails;
  String? startTimeStamp;
  String? atThisStage;
  String? overNo;
  String? ballNo;

  // BestPerformers? bestPerformers;
  String? battingteamName;
  String? bowlingteamName;
  String? teamName;
  int? extra;

  // LastOvers? lastOvers;

  SBInning({
    this.number,
    this.battingteam,
    this.bowlingteam,
    this.total,
    this.wickets,
    this.overs,
    this.totalBallsBowled,
    this.allotedBalls,
    this.runrate,
    this.runsperball,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.allottedOvers,
    this.target,
    this.batsmen,
    // this.partnershipCurrent,
    this.bowlers,
    this.fallofWickets,
    // this.partnerships,
    // this.powerPlay,
    // this.powerPlayDetails,
    this.statusId,
    // this.reviewDetails,
    this.startTimeStamp,
    this.atThisStage,
    this.overNo,
    this.ballNo,
    // this.bestPerformers,
    this.battingteamName,
    this.bowlingteamName,
    this.teamName,
    this.extra,
    // this.lastOvers,
  });

  SBInning.fromJson(Map<String, dynamic> json) {
    number = json['Number'];
    battingteam = json['Battingteam'];
    bowlingteam = json['Bowlingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
    totalBallsBowled = json['Total_Balls_Bowled'];
    allotedBalls = json['AllotedBalls'];
    runrate = json['Runrate'];
    runsperball = json['Runsperball'];
    byes = json['Byes'];
    legbyes = json['Legbyes'];
    wides = json['Wides'];
    noballs = json['Noballs'];
    penalty = json['Penalty'];
    allottedOvers = json['AllottedOvers'];
    target = json['Target'];
    if (json['Batsmen'] != null) {
      batsmen = <InningBatsman>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(InningBatsman.fromJson(v));
      });
    }
    // partnershipCurrent = json['Partnership_Current'] != null
    //     ? new PartnershipCurrent.fromJson(json['Partnership_Current'])
    //     : null;
    if (json['Bowlers'] != null) {
      bowlers = <InningBowlers>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(InningBowlers.fromJson(v));
      });
    }
    if (json['FallofWickets'] != null) {
      fallofWickets = <InningFallofWickets>[];
      json['FallofWickets'].forEach((v) {
        fallofWickets!.add(InningFallofWickets.fromJson(v));
      });
    }
    // if (json['Partnerships'] != null) {
    //   partnerships = <InningPartnerships>[];
    //   json['Partnerships'].forEach((v) {
    //     partnerships!.add(InningPartnerships.fromJson(v));
    //   });
    // }
    // powerPlay = json['PowerPlay'] != null ? new PowerPlay.fromJson(json['PowerPlay']) : null;
    // if (json['PowerPlayDetails'] != null) {
    //   powerPlayDetails = <PowerPlayDetails>[];
    //   json['PowerPlayDetails'].forEach((v) {
    //     powerPlayDetails!.add(new PowerPlayDetails.fromJson(v));
    //   });
    // }
    statusId = json['StatusId'];
    // reviewDetails = json['ReviewDetails'] != null ? new ReviewDetails.fromJson(json['ReviewDetails']) : null;
    startTimeStamp = json['StartTimeStamp'];
    atThisStage = json['At_this_stage'];
    overNo = json['OverNo'];
    ballNo = json['BallNo'];
    // bestPerformers =
    //     json['Best_Performers'] != null ? new BestPerformers.fromJson(json['Best_Performers']) : null;
    battingteamName = json['Battingteam_name'];
    bowlingteamName = json['Bowlingteam_name'];
    teamName = json['team_name'];
    extra = json['extra'];
    // lastOvers = json['LastOvers'] != null ? new LastOvers.fromJson(json['LastOvers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Number'] = number;
    data['Battingteam'] = battingteam;
    data['Bowlingteam'] = bowlingteam;
    data['Total'] = total;
    data['Wickets'] = wickets;
    data['Overs'] = overs;
    data['Total_Balls_Bowled'] = totalBallsBowled;
    data['AllotedBalls'] = allotedBalls;
    data['Runrate'] = runrate;
    data['Runsperball'] = runsperball;
    data['Byes'] = byes;
    data['Legbyes'] = legbyes;
    data['Wides'] = wides;
    data['Noballs'] = noballs;
    data['Penalty'] = penalty;
    data['AllottedOvers'] = allottedOvers;
    data['Target'] = target;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    // if (this.partnershipCurrent != null) {
    //   data['Partnership_Current'] = partnershipCurrent!.toJson();
    // }
    if (bowlers != null) {
      data['Bowlers'] = bowlers!.map((v) => v.toJson()).toList();
    }
    if (fallofWickets != null) {
      data['FallofWickets'] = fallofWickets!.map((v) => v.toJson()).toList();
    }
    // if (partnerships != null) {
    //   data['Partnerships'] = partnerships!.map((v) => v.toJson()).toList();
    // }
    // if (powerPlay != null) {
    //   data['PowerPlay'] = powerPlay!.toJson();
    // }
    // if (powerPlayDetails != null) {
    //   data['PowerPlayDetails'] = powerPlayDetails!.map((v) => v.toJson()).toList();
    // }
    data['StatusId'] = statusId;
    // if (reviewDetails != null) {
    //   data['ReviewDetails'] = reviewDetails!.toJson();
    // }
    data['StartTimeStamp'] = startTimeStamp;
    data['At_this_stage'] = atThisStage;
    data['OverNo'] = overNo;
    data['BallNo'] = ballNo;
    // if (bestPerformers != null) {
    //   data['Best_Performers'] = bestPerformers!.toJson();
    // }
    data['Battingteam_name'] = battingteamName;
    data['Bowlingteam_name'] = bowlingteamName;
    data['team_name'] = teamName;
    data['extra'] = extra;
    // if (lastOvers != null) {
    //   data['LastOvers'] = lastOvers!.toJson();
    // }
    return data;
  }
}

class InningBatsman {
  String? batsman;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? dots;
  String? strikerate;
  String? dismissal;
  String? howout;
  String? howoutShort;
  String? bowler;
  String? fielder;
  dynamic runScoredInLastBalls;
  int? number;
  String? dismissalType;
  String? dismissalId;
  String? batsmanName;
  String? batsmanRole;
  bool? iscaptain;
  String? playerImage;
  String? fielder1;
  String? fielder2;

  InningBatsman({
    this.batsman,
    this.runs,
    this.balls,
    this.fours,
    this.sixes,
    this.dots,
    this.strikerate,
    this.dismissal,
    this.howout,
    this.howoutShort,
    this.bowler,
    this.fielder,
    this.runScoredInLastBalls,
    this.number,
    this.dismissalType,
    this.dismissalId,
    this.batsmanName,
    this.batsmanRole,
    this.iscaptain,
    this.playerImage,
    this.fielder1,
    this.fielder2,
  });

  InningBatsman.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    dots = json['Dots'];
    strikerate = json['Strikerate'];
    dismissal = json['Dismissal'];
    howout = json['Howout'];
    howoutShort = json['Howout_short'];
    bowler = json['Bowler'];
    fielder = json['Fielder'];
    runScoredInLastBalls = json['RunScoredInLastBalls'];
    number = json['Number'];
    dismissalType = json['DismissalType'];
    dismissalId = json['DismissalId'];
    batsmanName = json['Batsman_name'];
    batsmanRole = json['Batsman_role'];
    iscaptain = json['Iscaptain'];
    playerImage = json['Player_image'];
    fielder1 = json['Fielder1'];
    fielder2 = json['Fielder2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Runs'] = runs;
    data['Balls'] = balls;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Dots'] = dots;
    data['Strikerate'] = strikerate;
    data['Dismissal'] = dismissal;
    data['Howout'] = howout;
    data['Howout_short'] = howoutShort;
    data['Bowler'] = bowler;
    data['Fielder'] = fielder;
    data['RunScoredInLastBalls'] = runScoredInLastBalls;
    data['Number'] = number;
    data['DismissalType'] = dismissalType;
    data['DismissalId'] = dismissalId;
    data['Batsman_name'] = batsmanName;
    data['Batsman_role'] = batsmanRole;
    data['Iscaptain'] = iscaptain;
    data['Player_image'] = playerImage;
    data['Fielder1'] = fielder1;
    data['Fielder2'] = fielder2;
    return data;
  }
}

class InningBowlers {
  String? bowler;
  String? overs;
  String? ballsBowled;
  String? maidens;
  String? runs;
  String? wickets;
  String? fours;
  String? sixes;
  String? economyrate;
  String? runsperball;
  String? noballs;
  String? wides;
  String? dots;
  dynamic rungivenInLastBalls;
  int? number;
  int? hattrickCount;
  double? avgSpeed;
  String? bowlersName;
  String? bowlersRole;
  String? playerImage;
  bool? isbowlingnow;

  InningBowlers({
    this.bowler,
    this.overs,
    this.ballsBowled,
    this.maidens,
    this.runs,
    this.wickets,
    this.fours,
    this.sixes,
    this.economyrate,
    this.runsperball,
    this.noballs,
    this.wides,
    this.dots,
    this.rungivenInLastBalls,
    this.number,
    this.hattrickCount,
    this.avgSpeed,
    this.bowlersName,
    this.bowlersRole,
    this.playerImage,
    this.isbowlingnow,
  });

  InningBowlers.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    overs = json['Overs'];
    ballsBowled = json['Balls_Bowled'];
    maidens = json['Maidens'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    economyrate = json['Economyrate'];
    runsperball = json['Runsperball'];
    noballs = json['Noballs'];
    wides = json['Wides'];
    dots = json['Dots'];
    rungivenInLastBalls = json['RungivenInLastBalls'];
    number = json['Number'];
    hattrickCount = json['Hattrick_Count'];
    avgSpeed = json['Avg_Speed'];
    bowlersName = json['Bowlers_name'];
    bowlersRole = json['Bowlers_role'];
    playerImage = json['Player_image'];
    isbowlingnow = json["Isbowlingnow"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bowler'] = bowler;
    data['Overs'] = overs;
    data['Balls_Bowled'] = ballsBowled;
    data['Maidens'] = maidens;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Economyrate'] = economyrate;
    data['Runsperball'] = runsperball;
    data['Noballs'] = noballs;
    data['Wides'] = wides;
    data['Dots'] = dots;
    data['RungivenInLastBalls'] = rungivenInLastBalls;
    data['Number'] = number;
    data['Hattrick_Count'] = hattrickCount;
    data['Avg_Speed'] = avgSpeed;
    data['Bowlers_name'] = bowlersName;
    data['Bowlers_role'] = bowlersRole;
    data['Player_image'] = playerImage;
    data['Isbowlingnow'] = isbowlingnow;
    return data;
  }
}

class InningFallofWickets {
  String? batsman;
  String? score;
  String? overs;
  int? wicketNo;
  int? reviewStatusId;
  String? ballNumber;
  String? batsmanName;
  String? playerImage;

  InningFallofWickets({
    this.batsman,
    this.score,
    this.overs,
    this.wicketNo,
    this.reviewStatusId,
    this.ballNumber,
    this.batsmanName,
    this.playerImage,
  });

  InningFallofWickets.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    score = json['Score'];
    overs = json['Overs'];
    wicketNo = json['Wicket_No'];
    reviewStatusId = json['Review_status_id'];
    ballNumber = json['Ball_number'];
    batsmanName = json['Batsman_name'];
    playerImage = json['Player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Score'] = score;
    data['Overs'] = overs;
    data['Wicket_No'] = wicketNo;
    data['Review_status_id'] = reviewStatusId;
    data['Ball_number'] = ballNumber;
    data['Batsman_name'] = batsmanName;
    data['Player_image'] = playerImage;
    return data;
  }
}

class MatchDetailsInfo {
  String? team1;
  String? team2;
  Venue? venue;
  String? status;
  String? result;
  String? series;
  String? date;
  String? time;
  String? umpires;
  String? referee;
  String? weather;
  String? tosswonby;
  String? tossElectedTo;

  MatchDetailsInfo({
    this.team1,
    this.team2,
    this.venue,
    this.status,
    this.result,
    this.series,
    this.date,
    this.time,
    this.umpires,
    this.referee,
    this.weather,
    this.tosswonby,
    this.tossElectedTo,
  });

  MatchDetailsInfo.fromJson(Map<String, dynamic> json) {
    team1 = json['team1'];
    team2 = json['team2'];
    venue = json['Venue'] != null ? Venue.fromJson(json['Venue']) : null;
    status = json['Status'];
    result = json['Result'];
    series = json['Series'];
    date = json['Date'];
    time = json['Time'];
    umpires = json['Umpires'];
    referee = json['Referee'];
    weather = json['Weather'];
    tosswonby = json['Tosswonby'];
    tossElectedTo = json['Toss_elected_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team1'] = team1;
    data['team2'] = team2;
    if (venue != null) {
      data['Venue'] = venue!.toJson();
    }
    data['Status'] = status;
    data['Result'] = result;
    data['Series'] = series;
    data['Date'] = date;
    data['Time'] = time;
    data['Umpires'] = umpires;
    data['Referee'] = referee;
    data['Weather'] = weather;
    data['Tosswonby'] = tosswonby;
    data['Toss_elected_to'] = tossElectedTo;
    return data;
  }
}

class VenueWeather {
  String? weatherId;
  String? weather;
  String? description;
  String? humidity;
  String? temperature;
  String? visibility;
  String? windSpeed;
  String? rain;

  VenueWeather({
    this.weatherId,
    this.weather,
    this.description,
    this.humidity,
    this.temperature,
    this.visibility,
    this.windSpeed,
    this.rain,
  });

  VenueWeather.fromJson(Map<String, dynamic> json) {
    weatherId = json['Weather_Id'];
    weather = json['Weather'];
    description = json['Description'];
    humidity = json['Humidity'];
    temperature = json['Temperature'];
    visibility = json['Visibility'];
    windSpeed = json['Wind_Speed'];
    rain = json['Rain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Weather_Id'] = weatherId;
    data['Weather'] = weather;
    data['Description'] = description;
    data['Humidity'] = humidity;
    data['Temperature'] = temperature;
    data['Visibility'] = visibility;
    data['Wind_Speed'] = windSpeed;
    data['Rain'] = rain;
    return data;
  }
}

class PitchDetail {
  String? pitchSuitedForId;
  String? pitchSuitedFor;
  String? pitchSurfaceId;
  String? pitchSurface;

  PitchDetail({this.pitchSuitedForId, this.pitchSuitedFor, this.pitchSurfaceId, this.pitchSurface});

  PitchDetail.fromJson(Map<String, dynamic> json) {
    pitchSuitedForId = json['Pitch_Suited_For_Id'];
    pitchSuitedFor = json['Pitch_Suited_For'];
    pitchSurfaceId = json['Pitch_Surface_Id'];
    pitchSurface = json['Pitch_Surface'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Pitch_Suited_For_Id'] = pitchSuitedForId;
    data['Pitch_Suited_For'] = pitchSuitedFor;
    data['Pitch_Surface_Id'] = pitchSurfaceId;
    data['Pitch_Surface'] = pitchSurface;
    return data;
  }
}

class Venue {
  String? name;
  String? country;
  String? city;
  VenueWeather? venueWeather;
  PitchDetail? pitchDetail;

  Venue({this.name, this.country, this.city, this.venueWeather, this.pitchDetail});

  Venue.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    country = json['Country'];
    city = json['City'];
    venueWeather = json['Venue_Weather'] != null ? VenueWeather.fromJson(json['Venue_Weather']) : null;
    pitchDetail = json['Pitch_Detail'] != null ? PitchDetail.fromJson(json['Pitch_Detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Country'] = country;
    data['City'] = city;
    if (venueWeather != null) {
      data['Venue_Weather'] = venueWeather!.toJson();
    }
    if (pitchDetail != null) {
      data['Pitch_Detail'] = pitchDetail!.toJson();
    }
    return data;
  }
}
