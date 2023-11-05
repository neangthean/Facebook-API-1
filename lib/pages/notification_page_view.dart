import 'package:flutter/material.dart';

var notificationPageKey = GlobalKey<_NotificationPageViewState>();

class NotificationPageView extends StatefulWidget {
  // const NotificationPageView({Key? key}) : super(key: key);

  Key key = notificationPageKey;

  @override
  State<NotificationPageView> createState() => _NotificationPageViewState();
}

class _NotificationPageViewState extends State<NotificationPageView> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
      ),
    );
  }

  ScrollController _scrollController = ScrollController();
  gotoTop(){
    _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

}
