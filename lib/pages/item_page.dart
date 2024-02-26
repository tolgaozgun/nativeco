import 'package:flutter/material.dart';
import 'package:nativeco/pages/home.dart';
import 'package:nativeco/utils/intent_utils.dart';

class ItemPage extends StatelessWidget {
  // Dummy data for demonstration purposes
  final String itemName;
  final String itemImageUrl;
  final double price;
  final int quantity;
  final String sellerName;
  final String sellerProfileImageUrl;

  final double latitude = 39.86821175847752;
  final double longitude = 32.74920800786726;

  ItemPage(
      {super.key,
      this.itemName = "Handmade Necklace",
      this.itemImageUrl = "https://picsum.photos/500",
      this.price = 49.99,
      this.quantity = 5,
      this.sellerName = "John Doe",
      this.sellerProfileImageUrl = "https://picsum.photos/150"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              itemImageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$$price",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Quantity: $quantity"),
            ),
            ListTile(
              onTap: () => {
                // TODO: Add profile navigation
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainScreen()),
                )
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(sellerProfileImageUrl),
              ),
              title: Text(sellerName),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement navigation functionality here
                  IntentUtils.launchGoogleMaps(latitude, longitude);
                },
                icon: Icon(Icons.directions),
                label: Text("Get Directions"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement navigation functionality here
                  IntentUtils.launchGoogleMaps(latitude, longitude);
                },
                icon: Icon(Icons.chat),
                label: Text("Chat with " + sellerName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
