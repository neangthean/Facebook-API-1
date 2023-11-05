import 'package:flutter/material.dart';

class EventScreenView extends StatefulWidget {
  const EventScreenView({super.key});

  @override
  State<EventScreenView> createState() => _EventScreenViewState();
}

class _EventScreenViewState extends State<EventScreenView> {

  late double _screenWidth;

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        height: 200,
        width: _screenWidth,
        color: Colors.red,
      ),
    );
  }
}
