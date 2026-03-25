class SquadModel {
  double? serverTick;
  SquadData? squad;
  String? mode;

  SquadModel({this.serverTick, this.squad, this.mode});

  SquadModel.fromJson(Map<String, dynamic> json) {
    serverTick = json['server_tick'];
    squad = json['squad'] != null ? SquadData.fromJson(json['squad']) : null;
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_tick'] = serverTick;
    if (squad != null) {
      data['squad'] = squad!.toJson();
    }
    data['mode'] = mode;
    return data;
  }
}

class SquadData {
  List<TeamSquad>? teamsNew;

  SquadData({this.teamsNew});

  SquadData.fromJson(Map<String, dynamic> json) {
    if (json['Teams_New'] != null) {
      teamsNew = <TeamSquad>[];
      json['Teams_New'].forEach((v) {
        teamsNew!.add(TeamSquad.fromJson(v));
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

class TeamSquad {
  String? nameFull;
  String? nameShort;
  List<SquadPlayers>? players;

  TeamSquad({this.nameFull, this.nameShort, this.players});

  TeamSquad.fromJson(Map<String, dynamic> json) {
    nameFull = json['Name_Full'];
    nameShort = json['Name_Short'];
    if (json['Players'] != null) {
      players = <SquadPlayers>[];
      json['Players'].forEach((v) {
        players!.add(SquadPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name_Full'] = nameFull;
    data['Name_Short'] = nameShort;
    if (players != null) {
      data['Players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SquadPlayers {
  String? position;
  String? nameFull;
  String? nameShort;
  bool? iscaptain;
  String? skill;
  String? skillName;
  String? role;
  bool? confirmXI;
  String? matches;
  int? statusId;
  String? status;
  int? nationalityId;
  String? nationality;
  String? image;
  bool? iskeeper;

  SquadPlayers({
    this.position,
    this.nameFull,
    this.nameShort,
    this.iscaptain,
    this.skill,
    this.skillName,
    this.role,
    this.confirmXI,
    this.matches,
    this.statusId,
    this.status,
    this.nationalityId,
    this.nationality,
    this.image,
    this.iskeeper,
  });

  SquadPlayers.fromJson(Map<String, dynamic> json) {
    position = json['Position'];
    nameFull = json['Name_Full'];
    nameShort = json['Name_Short'];
    iscaptain = json['Iscaptain'];
    skill = json['Skill'];
    skillName = json['Skill_Name'];
    role = json['Role'];
    confirmXI = json['Confirm_XI'];
    matches = json['Matches'];
    statusId = json['status_id'];
    status = json['status'];
    nationalityId = json['nationality_id'];
    nationality = json['nationality'];
    image = json['image'];
    iskeeper = json['Iskeeper'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Position'] = position;
    data['Name_Full'] = nameFull;
    data['Name_Short'] = nameShort;
    data['Iscaptain'] = iscaptain;
    data['Skill'] = skill;
    data['Skill_Name'] = skillName;
    data['Role'] = role;
    data['Confirm_XI'] = confirmXI;
    data['Matches'] = matches;
    data['status_id'] = statusId;
    data['status'] = status;
    data['nationality_id'] = nationalityId;
    data['nationality'] = nationality;
    data['image'] = image;
    data['Iskeeper'] = iskeeper;
    return data;
  }
}