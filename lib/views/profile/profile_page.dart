import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meteor_app/views/base/base_widget.dart';
import 'package:meteor_app/views/profile/components/profile_content.dart';
import 'package:meteor_app/views/profile/components/profile_friends.dart';
import 'package:meteor_app/views/profile/components/profile_image_header.dart';
import 'package:meteor_app/views/profile/components/profile_images.dart';
import 'package:meteor_app/views/profile/components/profile_name.dart';
import 'package:meteor_app/views/profile/components/profile_status.dart';
import 'package:meteor_app/views/profile/profile_viewmodel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      viewModel: ProfileViewModel(),
      builder: (context, viewModel, child) {
        return const Scaffold(
          body:SingleChildScrollView(
            child: Column(
              children: [
                ProfileImageHeader(),
                SizedBox(height: 10),
                ProfileName(),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
                ProfileContent(),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
                ProfileImages(),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
                ProfileFriends(),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
                ProfileStatus(),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }
}
