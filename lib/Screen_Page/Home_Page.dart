import 'package:flutter/material.dart';
import 'package:flutter_json_data_perse/Model_Page/UserModel.dart';
import 'package:flutter_json_data_perse/Services_Page/UserServices.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Userinfo>userinfo;
  bool loading;
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading=true;
    Services.getdata().then((Userinfo){
     setState(() {
       userinfo=Userinfo;
       loading=false;
     });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        elevation: 0,
        title: Text(loading?"Loading...":"JsonData Perse"),
        centerTitle: true,
      ),
      //Body
      body: loading?Center(child: CircularProgressIndicator(),):
      ListView.builder(
          itemCount: userinfo==null?0:userinfo.length,
          itemBuilder:(context,index){
            Userinfo data=userinfo[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 32,
                backgroundImage:NetworkImage("https://images.unsplash.com/photo-1602094182632-04c342c2bbc4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80"),),
              title: Flexible(child: Text(data.name,style: TextStyle(fontSize: 20,color: Colors.green),)),
              subtitle:Text(data.email,style: TextStyle(fontSize: 16,color: Colors.red)),
            );
          }),
    );
  }
}
