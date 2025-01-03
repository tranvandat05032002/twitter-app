import 'package:flutter/material.dart';
import 'package:meteor_app/API/ApiClient.dart';
import 'package:meteor_app/models/tweet_model.dart';
import 'package:meteor_app/utils/app_shared.dart';

class TweetViewModel extends ChangeNotifier {
  List<TweetElement> _tweets = [];
  bool _isLoading = false;
  int _currentPage = 1;
  int _totalPages = 1;

  List<TweetElement> get tweets => _tweets;
  bool get isLoading => _isLoading;

  Future<void> fetchTweets({int limit = 30, int page = 1}) async {
    final String? accessToken = await TokenManager.getAccessToken();
    if (_isLoading) return;
    if (accessToken == null) return;
    _isLoading = true;
    notifyListeners();

    try {
      final result = await ApiClient.getTweets(
          limit: limit, page: page, accessToken: accessToken);

      List<TweetElement> flattenedTweets =
          result.tweet.tweets as List<TweetElement>;
      _tweets = flattenedTweets;
      _currentPage = result.page;
      _totalPages = result.totalPage;
    } catch (error) {
      print('Error fetching tweets: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTweet({
    required String content,
    required int type,
    required int audience,
    List<String>? hashtags,
    List<String>? mentions,
    List<String>? medias,
  }) async {
    print("Adding tweet...");

    final String? accessToken = await TokenManager.getAccessToken();
    if (_isLoading) return;
    if (accessToken == null) return;
    _isLoading = true;
    notifyListeners();

    try {
      bool checkAddTweet = await ApiClient.postTweet(
        content: content,
        type: type,
        audience: audience,
        hashtags: hashtags ?? [],
        mentions: mentions ?? [],
        medias: medias ?? [],
        accessToken: accessToken,
      );

      // Assuming the result contains the newly added tweet
      if (checkAddTweet) {
        // _tweets.insert(0, result); // Add the new tweet to the top of the list
        notifyListeners(); // Notify UI to refresh
      }
    } catch (error) {
      print('Error adding tweet: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
