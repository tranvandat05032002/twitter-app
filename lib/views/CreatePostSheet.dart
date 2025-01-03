import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteor_app/models/tweet_model.dart';
import 'package:meteor_app/utils/app_shared.dart';
import 'package:meteor_app/viewmodels/tweet_viewmodel.dart';
import 'dart:html' as html;
import 'package:meteor_app/views/Common/input_element.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';

const List<String> listArea = <String>[
  'Mọi người',
  'Bạn bè',
  'Bạn bè cụ thể',
  'Chỉ mình tôi'
];

class CreatePostSheet extends StatefulWidget {
  const CreatePostSheet({super.key});

  @override
  State<CreatePostSheet> createState() => _CreatePostSheetState();
}

class _CreatePostSheetState extends State<CreatePostSheet> {
  String? selectedValue = listArea.first;
  Uint8List? _selectedImage;

  // final _formKey = GlobalKey<FormState>();
  final _content = TextEditingController();

  Future<void> _pickImage() async {
    // Tạo input HTML để chọn file
    final html.FileUploadInputElement uploadInput =
        html.FileUploadInputElement();
    uploadInput.accept = 'image/*'; // Chỉ cho phép chọn file ảnh
    uploadInput.click(); // Mở cửa sổ chọn file

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();

        reader.readAsArrayBuffer(files[0]); // Đọc file dưới dạng byte
        reader.onLoadEnd.listen((event) {
          setState(() {
            _selectedImage = reader.result as Uint8List;
          });
        });
      }
    });
  }

  Future<void> _uploadImage() async {
    String? accessToken = await TokenManager.getAccessToken();

    if (accessToken == null) {
      print('No access token available');
      return;
    }

    // Lấy tên file từ file đã chọn

    // Gửi thông tin fileName lên server
    final uri = Uri.parse(
        'http://localhost:4000/medias/upload-image'); // Thay URL backend của bạn

    final request = html.HttpRequest();
    request.open('POST', uri.toString());
    request.setRequestHeader('Content-Type', 'application/octet-stream');

    request.onLoadEnd.listen((event) {
      if (request.status == 200) {
        print('Upload successful');
      } else {
        print('Upload failed: ${request.status}');
      }
    });

    // Gửi dữ liệu byte
    request.send(_selectedImage);
  }

  @override
  Widget build(BuildContext context) {
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
              Consumer<TweetViewModel>(
                builder: (context, tweetViewModel, child) {
                  return tweetViewModel.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            final tweet = TweetInput(
                              type: 0,
                              audience: 0,
                              content: _content.text,
                              hashtags: ["tranvandat", "tranvan", "tweet"],
                              mentions: ["64fc0433824b45ee6166d9fd"],
                              medias: [
                                Media(
                                    url:
                                        "https://twitter-s3-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/images/52db8a9de8a9ba4f79ae6c202.jpg",
                                    type: 0)
                              ], // Empty list if no media
                            );

                            tweetViewModel.addTweet(
                              context: context,
                              type: tweet.type,
                              audience: tweet.audience,
                              content: tweet.content,
                              hashtags: tweet.hashtags,
                              mentions: tweet.mentions,
                              medias: tweet.medias,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue.shade400,
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 16, left: 12, right: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text("ĐĂNG"));
                },
              ),
              SizedBox(width: 15)
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.3),
                child: Container(color: Colors.grey, height: 0.3)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trần Văn Đạt",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 100, // Chiều rộng menu
                        height: 30, // Chiều cao menu
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100, // Màu nền
                          borderRadius: BorderRadius.circular(8.0), // Bo góc
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
                                color: Colors.blue.shade400, fontSize: 12),
                            dropdownColor: Colors.white,
                            items: listArea.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: value == selectedValue
                                        ? Colors.blue
                                            .shade400 // Màu xanh cho mục được chọn
                                        : Colors.black, // Màu đen cho mục khác
                                    fontWeight: value == selectedValue
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
              Column(
                children: [
                  TextField(
                    maxLines: 20, // Cho phép nhập 20 dòng
                    minLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Bạn đang nghĩ gì?',
                    ),
                    controller: _content,
                  ),
                  SizedBox(height: 15),
                  if (_selectedImage != null)
                    Image.memory(
                      _selectedImage!,
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  SizedBox(height: 20),
                ],
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
                  onPressed: _pickImage,
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
  }
}
