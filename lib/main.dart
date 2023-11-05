import 'package:clone_facebook_api_to_github/FutureBuilder_Banner_MainPage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const Facebook());
}

class Facebook extends StatelessWidget {
  const Facebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderBetween(),
    );
  }
}
