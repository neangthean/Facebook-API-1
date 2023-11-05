import 'package:clone_facebook_api_to_github/models/facebook_api_json.dart';
import 'package:clone_facebook_api_to_github/repos/facebook_api_repos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fluttericon/font_awesome_icons.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

var homePageKey = GlobalKey<_HomePageViewState>();

class HomePageView extends StatefulWidget {
  // const HomePageView({Key? key}) : super(key: key);

  Key key = homePageKey;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with AutomaticKeepAliveClientMixin{

  late Future<FacebookUser> _facebookUser;
  late double _screenWidth;

  @override
  void initState() {
    super.initState();
    _facebookUser = getFacebookUser;
  }

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _buildBody,
    );
  }

  ScrollController _scrollController = ScrollController();
  gotoTop(){
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  get _buildBody{
    return Container(
      color: Colors.grey,
      child: FutureBuilder<FacebookUser>(
        future: _facebookUser,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Error while loading: ${snapshot.data}"),
            );
          }
          else{
            if(snapshot.connectionState == ConnectionState.done){
              return _buildPostView(snapshot.data!.results);
            }
            else{
              return const Center(child: CircularProgressIndicator(color: Colors.blue,));
            }
          }
        },
      ),
    );
  }

  _buildPostView(List<Result> items){
    return RefreshIndicator(
      onRefresh: ()async{
        _facebookUser = getFacebookUser;
      },
      child: Container(
        child: CustomScrollView(
          controller: _scrollController,
          // physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: _screenWidth,
                height: 70,
                color: Colors.white,
                child: _buildStatusItem,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: _screenWidth,
                height: 242,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 10),
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverToBoxAdapter(
                      child: InkWell(
                        child: Container(
                          width: 125,
                          // color: Colors.red,
                          child: _buildAddStoryItem,
                        ),
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //   child: Container(
                    //     color: Colors.white,
                    //     margin: EdgeInsets.only(bottom: 10),
                    //     width: _screenWidth - 150,
                    //     height: 242,
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: items.length,
                    //       itemBuilder: (context, index){
                    //         return _buildStoryItem(items[index]);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index){
                        return _buildStoryItem(items[index]);
                      }, childCount: items.length,),
                    ),
                  ],
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     color: Colors.white,
            //     margin: EdgeInsets.only(bottom: 10),
            //     width: _screenWidth,
            //     height: 242,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: items.length,
            //       itemBuilder: (context, index){
            //         return _buildStoryItem(items[index]);
            //       },
            //     ),
            //   ),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return _buildPostItem(items[index]);
              }, childCount: items.length,),
            ),
          ],
        ),
      ),
    );
  }

  get _buildStatusItem{
    return Row(
      children: [
        InkWell(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _screenWidth / 6,
              ),
              Container(
                height: 41,
                width: 41,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/picture_mountain.jpg"),
                ),
              ),
            ],
          )
        ),
        InkWell(
          onTap: (){
            print("Status click");
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _screenWidth / 1.5,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: _screenWidth / 1.51,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              ),
              const Positioned(
                left: 15,
                child: Text(
                  "What's on your mind?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: _screenWidth / 6,
          // color: Colors.green,
          child: IconButton(
            onPressed: (){
              print("Picture click");
            },
            icon: const Icon(FontAwesomeIcons.images ,color: Colors.green,),
          ),
        ),
      ],
    );
  }

  get _buildAddStoryItem{
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(bottom: 12, top: 12, left: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  Container(
                    height: 135,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/picture_mountain.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 77,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Create", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text("story", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              right: 35,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      child: const Icon(Icons.add, size: 30, color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildStoryItem(Result item){
    return Container(
      padding: const EdgeInsets.only(bottom: 12, top: 12,),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _buildRectangleImage(item.picture.large),
          _buildNameInStory(item.name.first, item.name.last),
          Positioned(
            left: 10,
            top: 10,
            child: _buildProfileImage(item.picture.thumbnail),
          ),
        ],
      ),
    );
  }

  _buildRectangleImage(String img){
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(3),
        width: 115,
        height: 212,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildProfileImage(String img){
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]
    );
  }

  _buildNameInStory(String firstname, String lastname){
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(bottom: 12, left: 12),
      height: 65,
      width: 104,
      child: Text(
        "$firstname $lastname",
        // overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildPostItem(Result item){
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: _screenWidth,
        // height: 100,
        color: Colors.white,
        child: Column(
          children: [
            _buildItemProfile(item),
            _buildItemImage(item),
            _buildItemView(item),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            _buildItemBehavior,
          ],
        ),
      ),
    );
  }

  _buildItemProfile(Result item){
    return InkWell(
      child: Container(
        width: _screenWidth,
        height: 70,
        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
        child: Row(
          children: [
            Container(
              width: _screenWidth - 112,
              child: Row(
                children: [
                  _buildProfileImage(item.picture.thumbnail),
                  const SizedBox(width: 10,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${item.name.first} ${item.name.last}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text("${item.location.timezone.offset} . "),
                              ),
                              Container(
                                child: const Icon(Icons.public, size: 18,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      child: const Icon(Icons.more_horiz, size: 30,),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      child: const Icon(Icons.cancel_outlined, size: 30,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItemImage(Result item){
    return InkWell(
      child: Container(
        width: _screenWidth,
        child: Image.network(item.picture.large, fit: BoxFit.cover,),
      ),
    );
  }

  _buildItemView(Result item){
    return Container(
      width: _screenWidth,
      height: 40,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: const Icon(FontAwesomeIcons.thumbsUp, size: 20, color: Colors.blue,),
                ),
                Container(
                  child: const Icon(Icons.favorite, size: 20, color: Colors.red,),
                ),
                Container(
                  child: const Icon(Icons.tag_faces, size: 20, color: Colors.orange,),
                ),
                Container(
                  child: Text(" ${item.dob.age}"),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text("${item.location.postcode} comments . "),
                ),
                Container(
                  child: Text("${item.location.street.number} shares"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  get _buildItemBehavior{
    return Container(
      width: _screenWidth,
      height: 45,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Icon(FontAwesomeIcons.thumbsUp),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    child: const Text("Like"),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: const Icon(FontAwesomeIcons.message),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    child: const Text("Comment"),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              child: Row(
                children: [
                  Container(
                    // child: Icon(Icons.comment_bank_outlined),
                    child: const Icon(FontAwesomeIcons.share),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    child: const Text("Share"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
