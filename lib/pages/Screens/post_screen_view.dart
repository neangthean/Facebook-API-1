import 'package:clone_facebook_api_to_github/models/facebook_api_json.dart';
import 'package:clone_facebook_api_to_github/repos/facebook_api_repos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreenView extends StatefulWidget {
  const PostScreenView({super.key});

  @override
  State<PostScreenView> createState() => _PostScreenViewState();
}

class _PostScreenViewState extends State<PostScreenView> {

  late double _screenWidth;
  late Future<FacebookUser> _facebookUser;
  @override
  void initState() {
    super.initState();
    _facebookUser = getFacebookUser;
  }

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Container(
        child: Column(
          children: [
            _buildDetails,
            SizedBox(height: 13,),
            _buildPostStatus,
            _buildPostAPI,
          ],
        ),
      ),
    );
  }

  get _buildDetails{
    return Container(
      width: _screenWidth,
      height: 165,
      color: Colors.white,
      padding: EdgeInsets.only(left: 12),
      child: Container(
        child: Column(
          children: [
            Container(
              width: _screenWidth,
              height: 60,
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: _screenWidth,
                height: 47,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.info, color: Colors.grey,),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Text(
                          "Profile ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(Icons.circle, size: 3,),
                      ),
                      Container(
                        child: Text(
                          " Writer",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: _screenWidth,
                height: 30,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.more_horiz, color: Colors.grey,),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        child: Text(
                          "See your About info",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _clickFilter = false;
  get _buildPostStatus{
    return Container(
      height: 228.4,
      width: _screenWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 15),
      child: Container(
        child: Column(
          children: [
            Container(
              width: _screenWidth,
              height: 35,
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Container(
                    width: _screenWidth - 69,
                    child: Text(
                      "Posts",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 45,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _clickFilter = !_clickFilter;
                          });
                        },
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            color: _clickFilter == true ? Colors.grey.withOpacity(0.5) : null,
                            borderRadius: _clickFilter == true ? BorderRadius.circular(5) : null,
                          ),
                          child: Center(
                            child: Text(
                              "Filters",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                width: _screenWidth,
                height: 65,
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("images/picture_mountain.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                      child: Text(
                        "What's on your mind?",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                // color: Colors.green,
              ),
            ),
            Container(
              height: 0.2,
              color: Colors.black,
              // margin: EdgeInsets.only(left: 10, right: 10),
            ),
            Container(
              height: 45,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: (_screenWidth - 0.4) / 3,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.video_call,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            child: Text(
                              " Live",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 0.2,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    color: Colors.black,
                  ),
                  Container(
                    width: (_screenWidth - 0.4) / 3,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.photo_library_outlined,
                              size: 20,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            child: Text(
                              " Photo",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 0.2,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    color: Colors.black,
                  ),
                  Container(
                    width: (_screenWidth - 0.4) / 3,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.flag,
                              size: 20,
                              color: Color(0xFF002898),
                            ),
                          ),
                          Container(
                            child: Text(
                              " Life Event",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.2,
              color: Colors.black,
              margin: EdgeInsets.only(left: 12, right: 12),
            ),
            Container(
              height: 68,
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 12,
                top: 15,
                right: 12,
                bottom: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xF4CBC7C8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(Icons.message_outlined, size: 18,),
                      ),
                      Container(
                        child: Text(
                          " Manage posts",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  get _buildPostAPI{
    return Container(
      height: 1000,
      width: _screenWidth,
      child: Container(
        child: FutureBuilder<FacebookUser>(
          future: getFacebookUser,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text("Error while loading : ${snapshot.data}"),
              );
            }
            else{
              if(snapshot.connectionState == ConnectionState.done){
                return _buildPosts(snapshot.data!.results);
              }
              else{
                return Center(
                  child: CircularProgressIndicator(color: Colors.green,),
                );
              }
            }
          },
        ),
      ),
    );
  }

  _buildPosts(List<Result> result1){
    return Container(
      child: ListView.builder(
        itemCount: result1.length,
        itemBuilder: (context, index){
          return _buildPostView(result1[index]);
        },
      ),
    );
  }

  _buildPostView(Result item){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
        padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
        child: Row(
          children: [
            Container(
              width: _screenWidth - 112,
              child: Row(
                children: [
                  _buildProfileImage(item.picture.thumbnail),
                  SizedBox(width: 10,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${item.name.first} ${item.name.last}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
                                child: Icon(Icons.public, size: 18,),
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
                      child: Icon(Icons.more_horiz, size: 30,),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      child: Icon(Icons.cancel_outlined, size: 30,),
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

  _buildProfileImage(String img){
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
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
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Icon(FontAwesomeIcons.thumbsUp, size: 20, color: Colors.blue,),
                ),
                Container(
                  child: Icon(Icons.favorite, size: 20, color: Colors.red,),
                ),
                Container(
                  child: Icon(Icons.tag_faces, size: 20, color: Colors.orange,),
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
                    child: Icon(FontAwesomeIcons.thumbsUp),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Text("Like"),
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
                    child: Icon(FontAwesomeIcons.message),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Text("Comment"),
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
                    child: Icon(FontAwesomeIcons.share),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Text("Share"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
