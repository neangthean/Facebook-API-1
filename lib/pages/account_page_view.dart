import 'package:clone_facebook_api_to_github/pages/Screens/about_screen_view.dart';
import 'package:clone_facebook_api_to_github/pages/Screens/event_screen_view.dart';
import 'package:clone_facebook_api_to_github/pages/Screens/photo_screen_view.dart';
import 'package:clone_facebook_api_to_github/pages/Screens/post_screen_view.dart';
import 'package:flutter/material.dart';

var accountPageKey = GlobalKey<_AccountPageViewState>();

class AccountPageView extends StatefulWidget {
  // const AccountPageView({Key? key}) : super(key: key);

  Key key = accountPageKey;

  @override
  State<AccountPageView> createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> with AutomaticKeepAliveClientMixin{

  late double _screenWidth;

  List<String> items = ["Posts", "About", "Photos", "Events"];
  int _currentIndex = 0;
  List<Widget> _screenList = [];

  PostScreenView _postScreenView = PostScreenView();
  AboutScreenView _aboutScreenView = AboutScreenView();
  PhotoScreenView _photoScreenView = PhotoScreenView();
  EventScreenView _eventScreenView = EventScreenView();
  @override
  void initState() {
    super.initState();
    _screenList.add(_postScreenView);
    _screenList.add(_aboutScreenView);
    _screenList.add(_photoScreenView);
    _screenList.add(_eventScreenView);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: _buildBody,
    );
  }

  ScrollController _scrollController = ScrollController();
  gotoTop(){
    _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  get _buildBody{
    return Container(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            // elevation: 0.5,
            // shadowColor: Colors.black,
            // flexibleSpace: Container(
            //   color: Colors.white,
            // ),
            backgroundColor: Colors.white,
            title: Text(
              "Neang Thean",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFDAD7D7),
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.black,)),
                  ],
                ),
              ),
              // IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.black,)),
            ],
          ),
          SliverToBoxAdapter(
            child: _buildProfile,
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 13,),),
          SliverToBoxAdapter(
            child: _buildTabBar4,
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 10,),),
          SliverToBoxAdapter(
            child: Container(
              width: 60,
              height: 70,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  get _buildProfile{
    return Container(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                _buildCoverImage,
                _buildProfileName,
              ],
            ),
          ),
          _buildProfileImage,
        ],
      ),
    );
  }

  get _buildCoverImage{
    return Container(
      width: _screenWidth,
      height: _screenWidth / 1.8,
      child: Stack(
        children: [
          Container(
            // color: Colors.red,
            // child: Image.asset(
            //   "images/cover-pic-parents.jpg",
            //   fit: BoxFit.cover,
            // ),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/cover-pic-parents.jpg"),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFD5D1D4),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  get _buildProfileName{
    return Container(
      child: Container(
        width: _screenWidth,
        height: 240,
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 15,
          top: 45,
          right: 15,
          bottom: 15,
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Neang Thean (នាង ធាន)",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Text(
                    "Computer Science",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF0075FD),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Add to story",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 40,
                        width: (_screenWidth - 95) / 2.5,
                        decoration: BoxDecoration(
                          color: Color(0xF4CBC7C8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                            "Promote",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: (_screenWidth - 95) / 1.67,
                        decoration: BoxDecoration(
                          color: Color(0xF4CBC7C8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                            "See dashboard",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0xF4CBC7C8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {},),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get _buildProfileImage{
    return Positioned(
      bottom: 200,
      left: 10,
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
            ),
            Container(
              height: 153,
              width: 153,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("images/picture_mountain.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFD5D1D4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _buildTabBar4{
    return Container(
      width: _screenWidth,
      child: Column(
        children: [
          Container(
            height: 68,
            width: _screenWidth,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 0.2),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    width: 70,
                    margin: EdgeInsets.only(
                      left: 12,
                      top: 14,
                      bottom: 14,
                    ),
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue.withOpacity(0.1) : Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: _currentIndex == index ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: _screenList[_currentIndex],
          ),
        ],
      ),
    );
  }

}
