
import 'package:clone_facebook_api_to_github/models/facebook_api_json.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<FacebookUser> get getFacebookUser async{
  String url = "https://randomuser.me/api/?results=15";
  http.Response response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    return compute(facebookUserFromMap, response.body);
  }
  else{
    throw Exception("Error code: ${response.statusCode}");
  }
}