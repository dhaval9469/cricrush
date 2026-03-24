class CommentaryModel {
  double? serverTick;
  CommentaryData? commentry;
  String? mode;

  CommentaryModel({this.serverTick, this.commentry, this.mode});

  CommentaryModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    commentry = json['commentry'] != null ?  CommentaryData.fromJson(json['commentry']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (commentry != null) {
      data['scoreboard'] = commentry!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}


class CommentaryData {
  List<TeamCommentary>? team;
  int? totalIng;
  int? currentIng;
  int? count;
  List<MatchCommentary>? commentary;

  CommentaryData({
    this.team,
    this.totalIng,
    this.currentIng,
    this.count,
    this.commentary,
  });

  CommentaryData.fromJson(Map<String, dynamic> json) {
    if (json['team'] != null) {
      team = <TeamCommentary>[];
      json['team'].forEach((v) {
        team!.add(TeamCommentary.fromJson(v));
      });
    }
    totalIng = json['total_ing'];
    currentIng = json['current_ing'];
    count = json['count'];
    if (json['Commentary'] != null) {
      commentary = <MatchCommentary>[];
      json['Commentary'].forEach((v) {
        commentary!.add(MatchCommentary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.map((v) => v.toJson()).toList();
    }
    data['total_ing'] = totalIng;
    data['current_ing'] = currentIng;
    data['count'] = count;
    if (commentary != null) {
      data['Commentary'] = commentary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamCommentary {
  String? battingteam;
  String? total;
  String? wickets;
  String? overs;

  TeamCommentary(
      {this.battingteam,
        this.total,
        this.wickets,
        this.overs,});

  TeamCommentary.fromJson(Map<String, dynamic> json) {
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

class MatchCommentary {
  bool? adsDisplay;
  String? battingTeam;
  String? over;
  String? ball;
  String? runs;
  String? commentary;
  String? defaultCommentary;
  String? thisOver;
  String? thisOverNew;
  String? score;
  String? totalOver;
  String? totaRuns;
  String? wickets;
  List<CommentaryBatsmen>? batsmen;
  List<CommentaryBowlers>? bowlers;
  String? equation;

  MatchCommentary(
      {this.adsDisplay,
        this.battingTeam,
        this.over,
        this.ball,
        this.runs,
        this.commentary,
        this.defaultCommentary,
        this.thisOver,
        this.thisOverNew,
        this.score,
        this.totalOver,
        this.totaRuns,
        this.wickets,
        this.batsmen,
        this.bowlers,
        this.equation,});

  MatchCommentary.fromJson(Map<String, dynamic> json) {
    adsDisplay = json['ads_display'];
    battingTeam = json['BattingTeam'];
    over = json['Over'];
    ball = json['Ball'];
    runs = json['Runs'];
    commentary = json['Commentary'];
    defaultCommentary = json['Default_Commentary'];
    thisOver = json['This_Over'];
    thisOverNew = json['This_Over_new'];
    score = json['Score'];
    totalOver = json['Total_Over'];
    totaRuns = json['Tota_Runs'];
    wickets = json['Wickets'];
    if (json['Batsmen'] != null) {
      batsmen = <CommentaryBatsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(CommentaryBatsmen.fromJson(v));
      });
    }
    if (json['Bowlers'] != null) {
      bowlers = <CommentaryBowlers>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(CommentaryBowlers.fromJson(v));
      });
    }
    equation = json['Equation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ads_display'] = adsDisplay;
    data['BattingTeam'] = battingTeam;
    data['Over'] = over;
    data['Ball'] = ball;
    data['Runs'] = runs;
    data['Commentary'] = commentary;
    data['Default_Commentary'] = defaultCommentary;
    data['This_Over'] = thisOver;
    data['This_Over_new'] = thisOverNew;
    data['Score'] = score;
    data['Total_Over'] = totalOver;
    data['Tota_Runs'] = totaRuns;
    data['Wickets'] = wickets;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    if (bowlers != null) {
      data['Bowlers'] = bowlers!.map((v) => v.toJson()).toList();
    }
    data['Equation'] = equation;
    return data;
  }
}

class CommentaryBatsmen {
  String? batsman;
  bool? isonstrike;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? batsmenName;
  String? nonStrikerName;

  CommentaryBatsmen(
      {this.batsman,
        this.isonstrike,
        this.runs,
        this.balls,
        this.fours,
        this.sixes,
        this.batsmenName,
        this.nonStrikerName,});

  CommentaryBatsmen.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    isonstrike = json['Isonstrike'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    batsmenName = json['Batsmen_Name'];
    nonStrikerName = json['Non_Striker_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Isonstrike'] = isonstrike;
    data['Runs'] = runs;
    data['Balls'] = balls;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Batsmen_Name'] = batsmenName;
    data['Non_Striker_Name'] = nonStrikerName;
    return data;
  }
}

class CommentaryBowlers {
  String? bowler;
  String? overs;
  String? maidens;
  String? runs;
  String? wickets;
  String? ballBowled;
  String? dotBalls;
  String? bowlersName;

  CommentaryBowlers(
      {this.bowler,
        this.overs,
        this.maidens,
        this.runs,
        this.wickets,
        this.ballBowled,
        this.dotBalls,
        this.bowlersName,});

  CommentaryBowlers.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    overs = json['Overs'];
    maidens = json['Maidens'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    ballBowled = json['Ball_bowled'];
    dotBalls = json['Dot_balls'];
    bowlersName = json['Bowlers_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bowler'] = bowler;
    data['Overs'] = overs;
    data['Maidens'] = maidens;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    data['Ball_bowled'] = ballBowled;
    data['Dot_balls'] = dotBalls;
    data['Bowlers_Name'] = bowlersName;
    return data;
  }
}