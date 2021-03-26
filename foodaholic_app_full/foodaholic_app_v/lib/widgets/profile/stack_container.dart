import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/user_model.dart';
import 'package:foodaholic_app_v/utils/custom_clipper.dart';
import 'package:foodaholic_app_v/utils/preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'top_bar.dart';

class StackContainer extends StatefulWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  _StackContainerState createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
User currentUser;
final prefs = new Preferences();

    void initState() {
    super.initState();
    _getUserValues();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProfileAvatar(
                  //Croudynary
                  "https://res.cloudinary.com/dutwlsrv9/image/upload/v1614752011/btrjna870o8e37fnzpez.png",
                  borderWidth: 4.0,
                  radius: 60.0,
                ),
                SizedBox(height: 4.0),
                Text(currentUser == null
                      ? ""
                      : currentUser.name == null
                          ? currentUser.email
                          : currentUser.name),
                Text(
                  "0987964252",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }

      _getUserValues() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(prefs.token);
    print(decodedToken);
    currentUser = User.fromJsonMap(decodedToken);
    setState(() {});
  }
  
}
