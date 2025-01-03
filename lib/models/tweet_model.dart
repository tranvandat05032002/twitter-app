import 'package:meteor_app/models/user_model.dart';

//Output

class Result {
  int limit;
  int page;
  int totalPage;
  ResultTweet tweet;

  Result({
    required this.limit,
    required this.page,
    required this.totalPage,
    required this.tweet,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      limit: json['limit'] as int,
      page: json['page'] as int,
      totalPage: json['total_page'] as int,
      tweet: json['tweet'] != null
          ? ResultTweet.fromJson(json['tweet'])
          : ResultTweet.empty(),
    );
  }
}

class ResultTweet {
  int? total;
  List<TweetElement>? tweets;

  ResultTweet({
    this.total,
    this.tweets,
  });

  factory ResultTweet.fromJson(Map<String, dynamic> json) {
    return ResultTweet(
      total: json['total'] as int,
      tweets: (json['tweets'] as List<dynamic>)
          .map((tweet) => TweetElement.fromJson(tweet))
          .toList(),
    );
  }
  factory ResultTweet.empty() {
    return ResultTweet(
      total: 0,
      tweets: [],
    );
  }
}

class TweetElement {
  String? id;
  String? userId;
  int? type;
  int? audience;
  String? content;
  dynamic parentId;
  List<Hashtag>? hashtags;
  List<dynamic>? mentions;
  List<dynamic>? medias;
  int? guestViews;
  int? userViews;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  int? bookmarks;
  int? likes;
  int? views;
  int? retweetCount;
  int? commentCount;
  int? quoteCount;

  TweetElement({
    this.id,
    this.userId,
    this.type,
    this.audience,
    this.content,
    this.parentId,
    this.hashtags,
    this.mentions,
    this.medias,
    this.guestViews,
    this.userViews,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.bookmarks,
    this.likes,
    this.views,
    this.retweetCount,
    this.commentCount,
    this.quoteCount,
  });

  factory TweetElement.fromJson(Map<String, dynamic> json) {
    return TweetElement(
      id: json['_id'] as String,
      userId: json['user_id'] as String,
      type: json['type'] as int,
      audience: json['audience'] as int,
      content: json['content'] as String,
      // parentId: json['parent_id'],
      parentId: json['parent_id'] != null ? json['parent_id'] as String : '',
      hashtags: (json['hashtags'] as List<dynamic>)
          .map((hashtag) => Hashtag.fromJson(hashtag))
          .toList(),
      mentions: json['mentions'] as List<dynamic>,
      medias: json['medias'] as List<dynamic>,
      guestViews: json['guest_views'] as int,
      userViews: json['user_views'] as int,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: User.fromJson(json['user']),
      bookmarks: json['bookmarks'] as int,
      likes: json['likes'] as int,
      views: json['views'] as int,
      retweetCount: json['retweet_count'] as int,
      commentCount: json['comment_count'] as int,
      quoteCount: json['quote_count'] as int,
    );
  }
}

class Hashtag {
  String? id;
  String? name;

  Hashtag({
    this.id,
    this.name,
  });

  factory Hashtag.fromJson(Map<String, dynamic> json) {
    return Hashtag(
      id: json['_id'] as String,
      name: json['name'] as String,
    );
  }
}

class User {
  String id;
  String name;
  String email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? verify;
  String? bio;
  String? location;
  String? website;
  String? username;
  String avatar;
  String? coverPhoto;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.verify,
    this.bio,
    this.location,
    this.website,
    this.username,
    required this.avatar,
    this.coverPhoto,
  });

  // Phương thức từ JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      verify: json['verify'] as int?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String,
      coverPhoto: json['cover_photo'] as String?,
    );
  }
}

// Input
class TweetInput {
  int type;
  int audience;
  String content;
  String? parentId;
  List<String> hashtags;
  List<String> mentions;
  List<String> medias;

  TweetInput({
    required this.type,
    required this.audience,
    required this.content,
    this.parentId,
    required this.hashtags,
    required this.mentions,
    required this.medias,
  });

  // Convert object to json format
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'audience': audience,
      'content': content,
      'parent_id': parentId,
      'hashtags': hashtags,
      'mentions': mentions,
      'medias': medias,
    };
  }
}
