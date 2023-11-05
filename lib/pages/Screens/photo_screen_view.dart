import 'package:flutter/material.dart';

class PhotoScreenView extends StatefulWidget {
  const PhotoScreenView({super.key});

  @override
  State<PhotoScreenView> createState() => _PhotoScreenViewState();
}

class _PhotoScreenViewState extends State<PhotoScreenView> {

  late double _screenWidth;

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        width: _screenWidth,
        height: 1000,
        color: Colors.indigo,
      ),
    );
  }
}
