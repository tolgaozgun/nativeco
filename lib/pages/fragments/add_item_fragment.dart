import 'package:flutter/material.dart';
import 'package:nativeco/components/add_item_form.dart';

class NewFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        automaticallyImplyLeading: false,
      ),
      body: AddItemForm(),
    );
  }
}
