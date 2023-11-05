class StreakModel {
  final int uid;
  final DateTime createdAt;
  final String name;
  final String github_username;
  final int github_streak;
  final String wakatime_api;
  final String wakatime_username;
  final int wakatime_goal;
  final bool wakatime_goal_achieved;
  final String username;
  final String password;
  final int wakatime_streak;
  final String wakatime_lm;

  StreakModel({
    required this.uid,
    required this.createdAt,
    required this.name,
    required this.github_username,
    required this.github_streak,
    required this.wakatime_api,
    required this.wakatime_username,
    required this.wakatime_goal,
    required this.wakatime_goal_achieved,
    required this.username,
    required this.password,
    required this.wakatime_streak,
    required this.wakatime_lm,
  });

  factory StreakModel.fromJson(Map<String, dynamic> json) {
    return StreakModel(
      uid: json['uid'] ?? "",
      createdAt: DateTime.parse(json['created_at']),
      name: json['name'] ?? "",
      github_username: json['github_username'] ?? "",
      github_streak: json['github_streak'] ?? "",
      wakatime_api: json['wakatime_api'] ?? "",
      wakatime_username: json['wakatime_username'] ?? "",
      wakatime_goal: json['wakatime_goal'] ?? "",
      wakatime_goal_achieved: json['wakatime_goal_achieved'] ?? "",
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      wakatime_streak: json['wakatime_streak'] ?? "",
      wakatime_lm: json['wakatime_lm'] ?? "",
    );
  }
}
