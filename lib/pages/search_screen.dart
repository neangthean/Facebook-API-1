import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
    );
  }

  get _buildAppBar{
    return AppBar(
      // title: Container(
      //   color: Colors.grey,
      //   child: TextField(
      //     cursorColor: Colors.red,
      //   ),
      // ),
      backgroundColor: Colors.white,
      title: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.5),

        ),
        child: TextField(
          style: TextStyle(
            color: Colors.black54,
          ),
          decoration: InputDecoration(
            hintText: "search",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none,
          ),
          // autocorrect: false,
        ),
      ),
    );
  }

}
