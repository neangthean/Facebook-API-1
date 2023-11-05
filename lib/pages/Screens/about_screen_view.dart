import 'package:flutter/material.dart';

class AboutScreenView extends StatefulWidget {
  const AboutScreenView({super.key});

  @override
  State<AboutScreenView> createState() => _AboutScreenViewState();
}

class _AboutScreenViewState extends State<AboutScreenView> {

  late double _screenWidth;

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        width: _screenWidth,
        height: 300,
        color: Colors.yellow,
      ),
    );
  }
}
