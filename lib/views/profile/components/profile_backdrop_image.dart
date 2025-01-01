import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBackdropImage extends StatelessWidget {
  const ProfileBackdropImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://cdn.shopify.com/s/files/1/1140/8354/files/Avatar_Movie_480x480.jpg?v=1635265206",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const FaIcon(FontAwesomeIcons.camera),
            ),
          ),
        ],
      ),
    );
  }
}
