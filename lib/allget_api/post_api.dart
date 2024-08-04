import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePostApi extends StatefulWidget {
  const HomePostApi({super.key});

  @override
  State<HomePostApi> createState() => _HomePostApiState();
}

class _HomePostApiState extends State<HomePostApi> {
  Future<String?> postData()async{
    var url = Uri.parse("https://reqres.in/api/users");
    var response = await  http.post(url,body: {

        "name": "morpheus",
        "job": "leader"
    } );

if(response.statusCode==201){
  var user = jsonEncode({response.body});

  print(user);
}

else{
 print("Failed to post data");
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: SafeArea(child: Column(children: [
        Center(
          child: ElevatedButton(onPressed: () {
            postData();
          }, child: Text("PostData")),
        )
      ],),),
      // body: SafeArea(child:FutureBuilder(future: postData(), builder: (context, snapshot) {
      //  if(snapshot.hasData){
      //    var user = snapshot.data;
      //    return ListView.builder(
      //      itemCount: user?.length,
      //      itemBuilder: (context, index) {
      //        return Column(children: [
      //          Text("data"),
      //        ],);
      //
      //    },);
      //  }
      // },) ,),
    );
  }
}
