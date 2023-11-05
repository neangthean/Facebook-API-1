import 'package:clone_facebook_api_to_github/pages/home_page_view.dart';
import 'package:flutter/material.dart';

class FacebookBanner extends StatefulWidget {
  const FacebookBanner({Key? key}) : super(key: key);

  @override
  State<FacebookBanner> createState() => _FacebookBannerState();
}

class _FacebookBannerState extends State<FacebookBanner> {

  late double _screenWidth;
  late double _screenHeight;
  late double _logo;

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _logo = _screenHeight / 1.2;

    return Scaffold(
      body: _buildBody,
    );
  }

  get _buildBody{
    return Container(
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            width: _screenWidth,
            height: _logo,
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/Facebook_Logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: _screenWidth,
            height: _screenHeight - _logo,
            // color: Colors.indigo,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "from",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Meta",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
