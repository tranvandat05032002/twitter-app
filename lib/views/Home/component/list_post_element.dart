import 'package:flutter/material.dart';
import 'package:meteor_app/viewmodels/tweet_viewmodel.dart';
import 'package:meteor_app/views/Home/component/post_item_element.dart';
import 'package:provider/provider.dart';

class ListPostElement extends StatelessWidget {
  const ListPostElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<TweetViewModel>(builder: (context, viewModel, child) {
      if (viewModel.tweets.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView(
          children: viewModel.tweets
              .map((tweet) => PostItemElement(tweet: tweet))
              .toList());
    }));
  }
}
