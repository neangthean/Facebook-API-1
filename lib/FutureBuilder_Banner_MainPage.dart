
import 'package:flutter/material.dart';
import 'package:clone_facebook_api_to_github/pages/facebook_banner_page.dart';
import 'package:clone_facebook_api_to_github/pages/multi_page_view.dart';

class FutureBuilderBetween extends StatefulWidget {
  const FutureBuilderBetween({Key? key}) : super(key: key);

  @override
  State<FutureBuilderBetween> createState() => _FutureBuilderBetweenState();
}

class _FutureBuilderBetweenState extends State<FutureBuilderBetween> {

  Future<dynamic> someFutureFunction(){
    return Future.delayed(
        Duration(seconds: 3),(){}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  get _buildBody{
    return FutureBuilder<dynamic>(
      future: someFutureFunction(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return MultiPageView();
        }
        else{
          return FacebookBanner();
        }
      },
    );
  }
}



