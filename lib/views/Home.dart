import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteor_app/views/CreatePostSheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

const List<String> listArea = <String>[
  'Mọi người',
  'Bạn bè',
  'Bạn bè cụ thể',
  'Chỉ mình tôi'
];

typedef AreaEntry = DropdownButton<String>;

class _MyWidgetState extends State<HomePage> {
  bool _isLiked = false;
  String? selectedValue = listArea.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SliverCreatePost(), ListPost()],
    );
  }

  Widget SliverCreatePost() {
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
                    "https://images.unsplash.com/photo-1534590140231-3aff793be63a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Scaffold(
                          appBar: AppBar(
                              backgroundColor: Colors.white,
                              leading: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () => null,
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blue.shade400,
                                        padding: EdgeInsets.only(
                                            top: 16,
                                            bottom: 16,
                                            left: 12,
                                            right: 12),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text("ĐĂNG")),
                                SizedBox(width: 15)
                              ],
                              bottom: PreferredSize(
                                  preferredSize: Size.fromHeight(0.3),
                                  child: Container(
                                      color: Colors.grey, height: 0.3)),
                              title: Text(
                                "Tạo bài viết",
                                style: TextStyle(fontSize: 18),
                              )),
                          body: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(children: [
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(right: 15),
                                      child: ClipOval(
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1534590140231-3aff793be63a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Trần Văn Đạt",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 100, // Chiều rộng menu
                                          height: 30, // Chiều cao menu
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.blue.shade100, // Màu nền
                                            borderRadius: BorderRadius.circular(
                                                8.0), // Bo góc
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedValue = newValue;
                                                });
                                              },
                                              value: selectedValue,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.blue.shade400,
                                              ),
                                              style: TextStyle(
                                                  color: Colors.blue.shade400,
                                                  fontSize: 12),
                                              dropdownColor: Colors.white,
                                              items:
                                                  listArea.map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      color: value ==
                                                              selectedValue
                                                          ? Colors.blue
                                                              .shade400 // Màu xanh cho mục được chọn
                                                          : Colors
                                                              .black, // Màu đen cho mục khác
                                                      fontWeight: value ==
                                                              selectedValue
                                                          ? FontWeight
                                                              .bold // Đậm hơn cho mục được chọn
                                                          : FontWeight.normal,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              isExpanded: true,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  maxLines: null, // Cho phép nhập nhiều dòng
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Bạn đang nghĩ gì?',
                                  ),
                                  keyboardType: TextInputType.multiline,
                                )
                              ]),
                            ),
                          ),
                          bottomNavigationBar: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0.3, color: Colors.grey),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () => null,
                                    icon: Icon(
                                      Icons.image,
                                      color: Colors.green.shade300,
                                      size: 24,
                                    )),
                                IconButton(
                                    onPressed: () => null,
                                    icon: FaIcon(
                                      FontAwesomeIcons.userTag,
                                      color: Colors.blue.shade300,
                                      size: 24,
                                    )),
                                IconButton(
                                    onPressed: () => null,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidFaceLaugh,
                                      color: Colors.yellow.shade300,
                                      size: 24,
                                    )),
                                IconButton(
                                    onPressed: () => null,
                                    icon: FaIcon(
                                      FontAwesomeIcons.mapLocation,
                                      color: Colors.red.shade300,
                                      size: 24,
                                    )),
                                IconButton(
                                    onPressed: () => null,
                                    icon: FaIcon(
                                      FontAwesomeIcons.ellipsis,
                                      size: 24,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
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

  Widget ListPost() {
    return Expanded(
      child: ListView(
        children: [PostItem(), PostItem(), PostItem()],
      ),
    );
  }

  Widget PostItem() {
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
                        "https://images.unsplash.com/photo-1534590140231-3aff793be63a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trần Văn Đạt",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        // direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "3 giờ",
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
          Text(
              "abc vậy là năm 12121 đa qua, tôi chucasaslaksl;askl;askal;skalskalk abc vậy là năm 12121 đa qua, tôi chucasaslaksl;askl;askal;skalskalk abc vậy là năm 12121 đa qua, tôi chucasaslaksl;askl;askal;skalskalk abc vậy là năm 12121 đa qua, tôi chucasaslaksl;askl;askal;skalskalk cbc vậy là năm 12121 đa qua, tôi chucasaslaksl;askl;askal;skalskalk abc vậy là năm 12121 đa qua, tôi chucasaslaksl;askl;askal;skalskalk"),
          SizedBox(height: 10),
          Container(
            height: 350, // Bạn có thể tùy chỉnh chiều cao container nếu cần
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://images.unsplash.com/photo-1710715623861-47d8e3d7a8cf?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                fit: BoxFit.cover, // Giữ nguyên kích thước gốc của ảnh
                width: double.infinity,
              ),
            ),
          ),
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
                        const Text("199999 thích"),
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
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("19111111 bình luận"),
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
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("3 lượt chia sẻ"),
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
                    // Text("19"),
                    // Text("19 bình luận"),
                    // Text("3 lượt chia sẻ")
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
