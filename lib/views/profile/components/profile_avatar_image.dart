import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAvatarImage extends StatelessWidget {
  const ProfileAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://play-lh.googleusercontent.com/VMPS_t-CGBp-NVqefuMvMOGEDfmovBcGiepmAAF1I9hkdjLOjsfVjEV5d41DTAy3qI_akNaJKTdmaNwMRIs",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              child: FaIcon(FontAwesomeIcons.camera, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}