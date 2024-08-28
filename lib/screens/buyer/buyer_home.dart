import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import '../../utils/size_config.dart';  // Import your SizeConfig file

class BuyerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications action
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart action
              },
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 2), // Responsive spacing
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4), // Responsive margin
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical * 2), // Responsive spacing
                _buildCard("Card 1", "This is the description for card 1"),
                SizedBox(height: SizeConfig.blockSizeVertical * 2), // Responsive spacing
                _buildCard("Card 2", "This is the description for card 2"),
                SizedBox(height: SizeConfig.blockSizeVertical * 2), // Responsive spacing
                _buildCard("Card 3", "This is the description for card 3"),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BuyerBottomBar(),
      ),
    );
  }

  Widget _buildCard(String title, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 3), // Responsive border radius
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.5, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1), // Responsive spacing
            Text(
              description,
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2, // Responsive font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
