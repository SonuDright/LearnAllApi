import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_allapi/user_model.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"),),
      body: FutureBuilder(future: getAllUsers(), builder: (_,snap){
        var user = snap.data;
        var users = user!.data;
        return ListView.builder(
          itemCount: users!.length,
            itemBuilder: (_,index){
          return Column(
            children: [
          Text("${users![index].email}"),
          Text("${users![index].id}"),
          Text("${users![index].firstName}"),
          Text("${users![index].lastName}"),
          Text("${users![index].avatar}"),

            ],
          );
        });
      }),
    );
  }

 Future<UserModel> getAllUsers()async{
    var url = Uri.parse("https://reqres.in/api/users");
    var response = await http.get(url);
    if(response.statusCode ==200){
      var data = jsonDecode(response.body);
      var used = UserModel.fromJson(data);
      return used;
    }else{
      return UserModel();
    }
  }
  

}
