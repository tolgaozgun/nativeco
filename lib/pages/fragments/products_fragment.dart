import 'package:flutter/material.dart';
import 'package:nativeco/model/item.dart';
import 'package:nativeco/pages/item_page.dart';

class ProductsFragment extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemPage(
                    itemName: item.title,
                    itemImageUrl: item.imageUrl,
                    price: item.price,
                    quantity: item.quantity,
                    sellerName: item.sellerName,
                    sellerProfileImageUrl: item.sellerProfileImage,
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Image.network(
                      item.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text('Quantity: ${item.quantity}'),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(item.sellerProfileImage),
                                ),
                                SizedBox(width: 8),
                                Text(item.sellerName),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
