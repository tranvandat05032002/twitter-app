class UserInfo {
  String id;
  String name;
  String email;
  DateTime dateOfBirth;
  DateTime createdAt;
  DateTime updatedAt;
  int verify;
  List<dynamic> twitterCircle;
  String bio;
  String location;
  String website;
  String username;
  String avatar;
  String coverPhoto;

  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.createdAt,
    required this.updatedAt,
    required this.verify,
    required this.twitterCircle,
    required this.bio,
    required this.location,
    required this.website,
    required this.username,
    required this.avatar,
    required this.coverPhoto,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      verify: json['verify'] as int,
      twitterCircle: json['twitter_circle'] as List<dynamic>,
      bio: json['bio'] as String,
      location: json['location'] as String,
      website: json['website'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      coverPhoto: json['cover_photo'] as String,
    );
  }
}
