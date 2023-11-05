import 'package:flutter/material.dart';

var videoPageKey = GlobalKey<_VideoPageViewState>();

class VideoPageView extends StatefulWidget {
  // const VideoPageView({Key? key}) : super(key: key);

  Key key = videoPageKey;

  @override
  State<VideoPageView> createState() => _VideoPageViewState();
}

class _VideoPageViewState extends State<VideoPageView> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }

  ScrollController _scrollController = ScrollController();
  gotoTop(){
    _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

}
