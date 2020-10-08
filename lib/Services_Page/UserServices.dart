import 'package:flutter_json_data_perse/Model_Page/UserModel.dart';
import 'package:http/http.dart'as http;

class Services{
  //Api Url Link
  static const String url="https://jsonplaceholder.typicode.com/comments";

  static Future <List<Userinfo>> getdata()async{
    try{
      final respons=await http.get(url);
      if(respons.statusCode==200){
        //json data decode
        final userdata=userinfoFromJson(respons.body);
        return userdata;
      }else{
        return List<Userinfo>();
      }
    }catch(e){
      return List<Userinfo>();
    }
  }

}