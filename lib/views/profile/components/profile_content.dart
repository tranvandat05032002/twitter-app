import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chi tiết",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.work),
              SizedBox(width: 10),
              Text(
                "Quaản lý tại Huế",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text("Sống tại Huế", style: TextStyle(fontSize: 15)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 10),
              Text("Sống tại Huế", style: TextStyle(fontSize: 15)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text("Nam", style: TextStyle(fontSize: 15)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.cake),
              SizedBox(width: 10),
              Text("22 tháng 3, 2000", style: TextStyle(fontSize: 15)),
            ],
          )
        ],
      ),
    );
  }
}
