import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteor_app/models/user_model.dart';
import 'package:meteor_app/viewmodels/tweet_viewmodel.dart';
import 'package:meteor_app/viewmodels/user_viewmodel.dart';
import 'package:meteor_app/views/CreatePostSheet.dart';
import 'package:meteor_app/views/Home/component/list_post_element.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

typedef AreaEntry = DropdownButton<String>;

class _MyWidgetState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchUserInfo();
    Provider.of<TweetViewModel>(context, listen: false).fetchTweets();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TweetViewModel>(context, listen: false).fetchTweets();
    });
    // final userInfo = Provider.of<UserInfo>(context);
    return Consumer<UserViewModel>(
      builder: (context, userViewModel, child) {
        if (userViewModel.userInfo == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            SliverCreatePost(userViewModel.userInfo!.result),
            ListPostElement()
          ],
        );
      },
    );
  }

  Widget SliverCreatePost(UserInfo userInfo) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 15),
                child: ClipOval(
                  child: Image.network(
                    userInfo.avatar,
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(360, 45),
                  side: BorderSide(color: Colors.grey, width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Bo tròn nút
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bạn đang nghĩ gì?',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '                                                ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return CreatePostSheet();
                      // return Container(
                      //   height: MediaQuery.of(context).size.height,
                      //   color: Colors.amber,
                      //   child: const Center(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       mainAxisSize: MainAxisSize.min,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
              ),
            ],
          ),
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Icons.image,
              color: Colors.green.shade300,
              size: 30.0, // Điều chỉnh kích thước của icon
            ),
            // icon: FaIcon(
            //   FontAwesomeIcons.image,
            //   color: Colors.green.shade300,
            //   size: 30.0,
            // ),
          )
        ],
      ),
    );
  }
}
