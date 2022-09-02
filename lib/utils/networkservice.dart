import 'dart:convert';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sharecard_app/core/service/service.dart';
import 'package:sharecard_app/models/profile.dart';

 class  NetworkService{

   static final savedtokken = new FlutterSecureStorage();
   static final  token = savedtokken.readAll();



 static Future getProfile(userId) async{
  var tokens = await token;
 //  var headers = {
 //   "accept": "application/json",
 //   "Authorization": "Bearer" + token['deviceToken'];
 // };
   // var url = "https://padshareapp.com/cards/agent_details/${userId}/";
   var headers = {
     'Content-Type': 'application/json',
     'Accept': 'application/json',
     'Authorization': 'Bearer ${tokens['authtoken']}'
   };
     var url = "http://159.203.177.220/api/card/agent_details/${userId}";
   var response = await http.get(Uri.parse(url), headers: headers);
   var jsonProfile = jsonDecode(response.body);
    if(response.statusCode == 200 || response.statusCode == 201){
      print("Device_tokens : ${jsonProfile}");
      return Profile.fromJson(jsonProfile);
    }else{
      return jsonProfile;
    }
 }

 static uploadProfile(file, userId) async{
   CloudinaryResponse response;
   CloudinaryUploadResource uploadResource = CloudinaryUploadResource(
     filePath: file,
     resourceType: CloudinaryResourceType.image,
     folder: 'profile'
   );
   response = await Service.cloudinary.uploadResource(uploadResource);

   if(response.isSuccessful){
     print('FIle Uploaded: ${response.secureUrl}');
     Service.updateAgentprofile(userId, response.secureUrl);
   }else{
     print('Error Uploading File: ${response.error}');
   }
   // var url = " https://res.cloudinary.com/padshare/image/upload/v1659552455/profile/rgu4iazuvzmhehyqq3hm.jpg";
   // await Service.updateAgentprofile(userId, url);
 }
}