import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livetest09/data_model.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool inProgress = false;
  List<DataModel> listDataModel=[];
  @override
  void initState() {
    super.initState();
    readJsonData();

  }

  readJsonData() async {
    final jsonData =
        await rootBundle.loadString("assets/json/food_recipes.json");
    final decodeData = jsonDecode(jsonData);
    final productData = decodeData["recipes"];
    listDataModel = List.from(productData)
        .map<DataModel>((dataModel) => DataModel.fromMap(dataModel))
        .toList();
    setState(() {

    });
  }

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
                     itemCount: listDataModel.length,
                     itemBuilder: (context, index){
                       return  ListTile(
                           leading: const Icon(Icons.no_food),
                           title: Text(listDataModel[index].title),
                           subtitle: Text(listDataModel[index].description),
                       );



                     }

                 ),

    );
  }
}
