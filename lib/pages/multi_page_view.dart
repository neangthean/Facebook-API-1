import 'package:clone_facebook_api_to_github/pages/account_page_view.dart';
import 'package:clone_facebook_api_to_github/pages/home_page_view.dart';
import 'package:clone_facebook_api_to_github/pages/menu_page-view.dart';
import 'package:clone_facebook_api_to_github/pages/notification_page_view.dart';
import 'package:clone_facebook_api_to_github/pages/search_screen.dart';
import 'package:clone_facebook_api_to_github/pages/video_page_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

class MultiPageView extends StatefulWidget {
  const MultiPageView({Key? key}) : super(key: key);

  @override
  State<MultiPageView> createState() => _MultiPageViewState();
}

class _MultiPageViewState extends State<MultiPageView> {

  final PageController _pageController = PageController();
  final List<Widget> _screenList = [];

  final HomePageView _homePageView = HomePageView();
  final VideoPageView _videoPageView =  VideoPageView();
  final AccountPageView _accountPageView = AccountPageView();
  final NotificationPageView _notificationPageView = NotificationPageView();
  final MenuPageView _menuPageView = MenuPageView();

  @override
  void initState() {
    super.initState();
    _screenList.add(_homePageView);
    _screenList.add(_videoPageView);
    _screenList.add(_accountPageView);
    _screenList.add(_notificationPageView);
    _screenList.add(_menuPageView);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // extendBodyBehindAppBar: true, // for transparent appBar
        appBar: AppBar(
          elevation: 0.5,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text(
            "facebook",
            style: TextStyle(
              color: Color(0xFF0075FD),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              // fontFamily: "Montserrat-BlackItalic",
            ),
          ),
          // title: Text(
          //   "facebook",
          //   style: GoogleFonts.acme(
          //     color: Colors.blue,
          //     fontSize: 30,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          bottom: _buildTabBar,
          actions: [
            // IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black, size: 30,)),
            // IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined, color: Colors.black, size: 30,)),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 47,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEFEFEF),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  },
                  icon: const Icon(Icons.search, color: Colors.black,),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 47,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEFEFEF),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VideoPageView()),
                    );
                  },
                  icon: const Icon(FontAwesomeIcons.facebookMessenger, color: Colors.black,),
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          // children: [
          //   HomePageView(),
          //   VideoPageView(),
          //   AccountPageView(),
          //   NotificationPageView(),
          //   MenuPageView(),
          // ],
          children: _screenList,
        ),
      ),
    );
  }

  int _currentIndex = 0;
  int _prevIndex = -1;
  get _buildTabBar{
    return TabBar(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      // indicatorColor: Colors.red,
      // indicatorWeight: 5,
      // indicatorPadding: EdgeInsets.all(10),
      onTap: (index){
        setState(() {
          _prevIndex = _currentIndex;
          _currentIndex = index;
          if(_prevIndex == _currentIndex){
            switch(_currentIndex){
              case 0:
                homePageKey.currentState?.gotoTop();
                break;
              case 1:
                videoPageKey.currentState?.gotoTop();
                break;
              case 2:
                accountPageKey.currentState?.gotoTop();
                break;
              case 3:
                notificationPageKey.currentState?.gotoTop();
                break;
              case 4:
                menuPageKey.currentState?.gotoTop();
                break;
            }
          }
          _pageController.animateToPage(_currentIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        });
      },
      tabs: [
        const Tab(icon: Icon(Icons.home_outlined, size: 30, weight: 0.5,),),
        const Tab(icon: Icon(Icons.ondemand_video, size: 30,),),
        const Tab(icon: Icon(Icons.account_circle_outlined, size: 30,),),
        const Tab(icon: Icon(Icons.notifications_none, size: 30,),),
        Tab(
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 35,
                  // width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30,
                  // width: 30,
                  // child: CircleAvatar(
                  //   backgroundImage: AssetImage("images/picture_mountain.jpg"),
                  // ),
                  child: Stack(
                    children: [
                      Container(
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("images/picture_mountain.jpg"),
                      ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 18,
                              width: 18,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(Icons.density_medium, color: Colors.white, size: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
