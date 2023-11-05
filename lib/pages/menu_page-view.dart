import 'package:flutter/material.dart';

var menuPageKey = GlobalKey<_MenuPageViewState>();

class MenuPageView extends StatefulWidget {
  // const MenuPageView({Key? key}) : super(key: key);

  Key key = menuPageKey;

  @override
  State<MenuPageView> createState() => _MenuPageViewState();
}

class _MenuPageViewState extends State<MenuPageView> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }

  ScrollController _scrollController = ScrollController();
  gotoTop(){
    _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

}
