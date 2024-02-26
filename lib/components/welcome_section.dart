import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  final String name;

  WelcomeSection({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'WELCOME BACK',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/D4D03AQGw_v52AoVu-A/profile-displayphoto-shrink_800_800/0/1686460768504?e=1714608000&v=beta&t=Y9qnDsrGtKuFCP9vvlZSX_kRfjOBX9zI0bIUFpmFy-I'), // Replace with producer's profile image
          ),
        ],
      ),
    );
  }
}
