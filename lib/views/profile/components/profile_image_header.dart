import 'package:flutter/widgets.dart';
import 'package:meteor_app/views/profile/components/profile_avatar_image.dart';
import 'package:meteor_app/views/profile/components/profile_backdrop_image.dart';

class ProfileImageHeader extends StatelessWidget {
  const ProfileImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          ProfileBackdropImage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ProfileAvatarImage()
          )
        ],
      ),
    );
  }
}
