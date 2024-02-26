import 'package:flutter/material.dart';
import 'package:nativeco/components/stats_card.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        StatsCard(
          title: 'Total Sales',
          count: 30, // Replace with actual data
          icon: Icons.monetization_on,
          color: Colors.green,
        ),
        StatsCard(
          title: 'Chat Interactions',
          count: 2, // Replace with actual data
          icon: Icons.chat,
          color: Colors.blue,
        ),
        StatsCard(
          title: 'Active Listings',
          count: 4, // Replace with actual data
          icon: Icons.list,
          color: Colors.orange,
        ),
        StatsCard(
          title: 'Feedback Score',
          count: 100, // Replace with actual data
          icon: Icons.thumb_up,
          color: Colors.purple,
        ),
      ],
    );
  }
}
