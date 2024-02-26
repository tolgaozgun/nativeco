import 'package:flutter/material.dart';
import 'package:nativeco/components/profile_component.dart';

class ProfileFragment extends StatelessWidget {
  final List<String> items = List.generate(
    20,
    (index) => 'Item $index', // Replace this with your item model
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          automaticallyImplyLeading: false,
        ),
        body: ProfileComponent(isCurrentUser: true));
  }
}
