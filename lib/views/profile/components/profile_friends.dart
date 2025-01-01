import 'package:flutter/material.dart';

class ProfileFriends extends StatelessWidget {
  const ProfileFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bạn bè",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Xem tất cả bạn bè",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "300 người bạn",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 3 / 4),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/en/thumb/c/c7/Chill_guy_original_artwork.jpg/220px-Chill_guy_original_artwork.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Nguyễn Văn Mạnh Cường",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}