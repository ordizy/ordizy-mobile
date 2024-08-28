import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

class BuyerBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 3, // Responsive horizontal padding
      ),
      height: SizeConfig.blockSizeVertical * 7, // Responsive height
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 4, // Responsive left margin
            ),
            child: _BottomBarItem(
              icon: Icons.home_outlined,
              label: "Home",
              onTap: () {
                Navigator.pushReplacementNamed(context, '/participant_dashboard');
              },
            ),
          ),
          _BottomBarItem(
            icon: Icons.qr_code,
            label: "Forum",
            onTap: () {
              Navigator.pushNamed(context, '/discussion_forum');
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal * 4, // Responsive right margin
            ),
            child: _BottomBarItem(
              icon: Icons.qr_code,
              label: "QR",
              onTap: () {
                Navigator.pushNamed(context, '/qr');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _BottomBarItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: SizeConfig.blockSizeHorizontal * 6.5, // Responsive icon size
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 0.5), // Responsive spacing
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.textMultiplier * 1.5, // Responsive font size
            ),
          ),
        ],
      ),
    );
  }
}
