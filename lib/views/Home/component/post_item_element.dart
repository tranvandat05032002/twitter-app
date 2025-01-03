import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteor_app/models/tweet_model.dart';
import 'package:meteor_app/utils/common.dart';

class PostItemElement extends StatefulWidget {
  final TweetElement tweet;

  const PostItemElement({Key? key, required this.tweet}) : super(key: key);

  @override
  State<PostItemElement> createState() => _PostItemElementState();
}

class _PostItemElementState extends State<PostItemElement> {
  bool _isLiked = false;
  TimeUtils time = new TimeUtils();
  @override
  Widget build(BuildContext context) {
    final tweet = widget.tweet;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blueGrey.shade200, // Màu của đường viền
            width: 3, // Độ dày của đường viền
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(right: 15),
                    child: ClipOval(
                      child: Image.network(
                        tweet.user!.avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tweet.user!.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        // direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            TimeUtils.formatTime(tweet.createdAt.toString()),
                          ),
                          SizedBox(width: 8),
                          FaIcon(
                            FontAwesomeIcons.userGroup,
                            size: 12,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Flex(
                direction: Axis.horizontal, // Đặt chiều ngang cho Flex
                children: [
                  FaIcon(
                    FontAwesomeIcons.ellipsis,
                    size: 20,
                  ),
                  SizedBox(width: 16),
                  FaIcon(
                    FontAwesomeIcons.x,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text(tweet.content ?? ""),
            alignment: Alignment.topLeft,
          ),
          SizedBox(height: 10),
          // Kiểm tra nếu medias có ít nhất 1 phần tử
          if (tweet.medias != null && tweet.medias!.isNotEmpty)
            Container(
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  tweet.medias![0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            )
          else
            Container(),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${tweet.likes.toString()} thích"),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisSize:
                              MainAxisSize.min, // Giới hạn kích thước hàng
                          children: [
                            // FaIcon(FontAwesomeIcons.heart, size: 18),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isLiked =
                                      !_isLiked; // Đảo trạng thái khi nhấn vào tim
                                });
                              },
                              child: FaIcon(
                                _isLiked
                                    ? FontAwesomeIcons.solidHeart
                                    : FontAwesomeIcons.heart,
                                size: 18,
                                color: Color(0xFFfd4b50),
                              ),
                            ),
                            const SizedBox(
                                width: 8.0), // Khoảng cách giữa icon và text
                            const Text(
                              'Thích', // Văn bản đi kèm
                              style: TextStyle(
                                fontSize: 14, // Kích thước chữ
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${tweet.commentCount.toString()} bình luận"),
                        SizedBox(height: 15),
                        Row(
                          mainAxisSize:
                              MainAxisSize.min, // Giới hạn kích thước hàng
                          children: [
                            FaIcon(FontAwesomeIcons.comment,
                                size: 18, color: Colors.lightBlue),
                            SizedBox(
                                width: 8.0), // Khoảng cách giữa icon và text
                            Text(
                              'Bình luận', // Văn bản đi kèm
                              style: TextStyle(
                                fontSize: 14, // Kích thước chữ
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${tweet.userViews} lượt chia sẻ"),
                        SizedBox(height: 15),
                        Row(
                          mainAxisSize:
                              MainAxisSize.min, // Giới hạn kích thước hàng
                          children: [
                            // FaIcon(FontAwesomeIcons.share, size: 18),
                            Icon(Icons.share,
                                size: 18, color: Colors.lightGreen),
                            SizedBox(
                                width: 8.0), // Khoảng cách giữa icon và text
                            Text(
                              'Chia sẻ', // Văn bản đi kèm
                              style: TextStyle(
                                fontSize: 14, // Kích thước chữ
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
