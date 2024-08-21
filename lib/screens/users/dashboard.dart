import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 13, // Adjust height according to screen size
              color: Color(0xFF050C9B),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 2),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hello Olivia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.textMultiplier * 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome to Confee',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.textMultiplier * 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: SizeConfig.imageSizeMultiplier * 8, // Adjusted icon size
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/notification');
                          },
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/profile');
                          },
                          child: CircleAvatar(
                            radius: SizeConfig.imageSizeMultiplier * 8,
                            backgroundImage: AssetImage('asset/images/profile.png'), // Replace with your profile image path
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 4,
                mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                children: <Widget>[
                  DashboardCard(
                    imagePath: 'asset/images/pre_conference.png',
                    title: 'Pre Conference',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/View_Event');
                    },
                  ),
                  DashboardCard(
                    imagePath: 'asset/images/post_conference.png',
                    title: 'Post Conference',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/View_Event');
                    },
                  ),
                  DashboardCard(
                    imagePath: 'asset/images/day1.png',
                    title: 'Conference Day 1',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/View_Event');
                    },
                  ),
                  DashboardCard(
                    imagePath: 'asset/images/day2.png',
                    title: 'Conference Day 2',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/no_registered_event');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5,
                vertical: SizeConfig.blockSizeVertical * 3,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 18, // Adjust height as needed
                    child: ListView.builder(
                      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
                          child: ListTile(
                            leading: Image.asset(
                              'asset/images/stall1.png',
                              width: SizeConfig.imageSizeMultiplier * 30,
                              height: SizeConfig.imageSizeMultiplier * 30,
                              fit: BoxFit.cover,
                            ),
                            title: Center(
                              child: Text(
                                'Innovation Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.textMultiplier * 2.5,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/participant_innovation_view');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const DashboardCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                width: SizeConfig.imageSizeMultiplier * 25,
                height: SizeConfig.imageSizeMultiplier * 25,
                fit: BoxFit.cover,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 1),
              Text(
                title,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
