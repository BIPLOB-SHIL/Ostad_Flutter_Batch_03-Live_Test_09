import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool inProgress = false;
  List<DataModel> modelData =[];

  @override
  void initState() {
    super.initState();
    readJsonData();

  }

  Future<List<DataModel>> readJsonData() async {
    //read json file
    final jsonData = await rootBundle.rootBundle.loadString('assets/json/food_recipes.json');
    //decode json data as list
    final list = json.decode(jsonData);
    print(jsonData);
    //map json and initialize using DataModel
    return list.map((e) => DataModel.fromJson(e)).toList();

  }

  // Future<List<DataModel>> allUsers() async {
  //   var response = await rootBundle.loadString("assets/food_recipes.json");
  //
  //   if (response.isNotEmpty) {
  //     return usersFromJson(response);
  //   } else {
  //     return [];
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
       // backgroundColor: Colors.white,
        appBar: AppBar(
          title:  const Text("Food Recipes"),
          centerTitle: false,
          elevation: 0,
         // backgroundColor: Colors.white,
        ),
        body:ListView.builder(
                     itemCount: 10,
                     itemBuilder: (context, index){
                       return  ListTile(
                           leading: const Icon(Icons.no_food),
                           title: Text("jgygyg"),
                           subtitle: Text("jnfvjfbn"),
                       );



                     }

                 ),

    );
  }
}
