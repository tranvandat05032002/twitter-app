import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileStatus extends StatelessWidget {
  const ProfileStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/en/thumb/c/c7/Chill_guy_original_artwork.jpg/220px-Chill_guy_original_artwork.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.grey,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bạn đang nghĩ gì?",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      FaIcon(
                        Icons.videocam_outlined,
                        color: Colors.red,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Video trực tiếp",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.image,
                        color: Colors.green,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Ảnh/video",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
