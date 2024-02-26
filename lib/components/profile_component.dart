import 'package:flutter/material.dart';
import 'package:nativeco/model/item.dart';
import 'package:nativeco/pages/item_page.dart';

class ProfileComponent extends StatelessWidget {
  final List<Item> items = [
    Item(
        imageUrl:
            'https://housing.com/news/wp-content/uploads/2023/07/How-to-grow-Carrot-plant-in-your-home-garden-01.jpg',
        price: 10.0,
        quantity: 5,
        sellerName: 'Tolga Ozgun',
        sellerProfileImage:
            'https://media.licdn.com/dms/image/D4D03AQGw_v52AoVu-A/profile-displayphoto-shrink_800_800/0/1686460768504?e=1714608000&v=beta&t=Y9qnDsrGtKuFCP9vvlZSX_kRfjOBX9zI0bIUFpmFy-I',
        title: "Carrot"),
    Item(
      imageUrl:
          "https://elders.com.au/content/dam/eld/images/agriculture/crops---agronomy/broadacre/hand_in_wheat_field.jpg",
      price: 33.0,
      quantity: 9,
      sellerName: 'Tolga Ozgun',
      sellerProfileImage:
          'https://media.licdn.com/dms/image/D4D03AQGw_v52AoVu-A/profile-displayphoto-shrink_800_800/0/1686460768504?e=1714608000&v=beta&t=Y9qnDsrGtKuFCP9vvlZSX_kRfjOBX9zI0bIUFpmFy-I',
      title: "Wheat",
    ),
    Item(
      imageUrl:
          "https://images.moneycontrol.com/static-mcnews/2022/04/1-india-heat-wheat-770x433.jpg?impolicy=website&width=770&height=431",
      price: 500.0,
      quantity: 39,
      sellerName: 'Tolga Ozgun',
      sellerProfileImage:
          'https://media.licdn.com/dms/image/D4D03AQGw_v52AoVu-A/profile-displayphoto-shrink_800_800/0/1686460768504?e=1714608000&v=beta&t=Y9qnDsrGtKuFCP9vvlZSX_kRfjOBX9zI0bIUFpmFy-I',
      title: "Wheat",
    ),
    Item(
      imageUrl:
          "https://i1.wp.com/blog.backtotheroots.com/wp-content/uploads/2021/02/image1-3.png?fit=1999%2C1274&ssl=1",
      price: 33.0,
      quantity: 9,
      sellerName: 'Tolga Ozgun',
      sellerProfileImage:
          'https://media.licdn.com/dms/image/D4D03AQGw_v52AoVu-A/profile-displayphoto-shrink_800_800/0/1686460768504?e=1714608000&v=beta&t=Y9qnDsrGtKuFCP9vvlZSX_kRfjOBX9zI0bIUFpmFy-I',
      title: "Carrot",
    )
  ];
  final bool isCurrentUser;
  ProfileComponent({super.key, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/D4D03AQGw_v52AoVu-A/profile-displayphoto-shrink_800_800/0/1686460768504?e=1714608000&v=beta&t=Y9qnDsrGtKuFCP9vvlZSX_kRfjOBX9zI0bIUFpmFy-I'), // Replace with your image source
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Tolga Ozgun', // Replace with the user's name
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Hello! I am generally selling carrots and wheat!', // User description
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  if (isCurrentUser)
                    ElevatedButton(
                      child: Text('Edit Profile'),
                      onPressed: () {
                        // Add logic to navigate to the edit profile screen
                      },
                    ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // number of items per row
                crossAxisSpacing: 4.0, // spacing between the items
                mainAxisSpacing: 4.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ItemPage(
                                itemName: items[index].title,
                                itemImageUrl: items[index].imageUrl,
                                price: items[index].price,
                                quantity: items[index].quantity,
                                sellerName: items[index].sellerName,
                                sellerProfileImageUrl:
                                    items[index].sellerProfileImage,
                              )),
                    );
                  },
                  child: Image.network(
                    items[index].imageUrl, // Replace with item image source
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
