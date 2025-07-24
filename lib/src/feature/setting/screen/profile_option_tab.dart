import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/constant/asset_string.dart';
import 'package:flutter/material.dart';

class ProfileOptionTab extends StatefulWidget {
  const ProfileOptionTab({super.key});

  @override
  State<ProfileOptionTab> createState() => _ProfileOptionTabState();
}

class _ProfileOptionTabState extends State<ProfileOptionTab> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(myPadding),
      child: Column(
        children: [
          SizedBox(height: myPadding),
          Stack(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(AssetString.userimage),
              ),

              Positioned(
                top: 90,
                left: 100,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.photo_camera_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
