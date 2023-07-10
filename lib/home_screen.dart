import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'data_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool inProgress = false;

  @override
  void initState() {
    super.initState();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  Text("Total Products:",style: const TextStyle(color: Colors.blue)),
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu,color: Colors.blue,),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: (){

                  setState(() {

                  });

                }, icon: const Icon(Icons.refresh,color: Colors.blue))
          ],
          backgroundColor: Colors.white,
        ),
        body: inProgress ?  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const [
              CircularProgressIndicator(
                backgroundColor: Colors.deepPurple,
                strokeWidth: 5,
                //    color: Colors.green,
              ),
              SizedBox(height: 10,),
              // Image.network("https://www.creativefabrica.com/wp-content/uploads/2018/10/Loading-download-logo-by-DEEMKA-STUDIO-10-580x406.jpg",
              //   height: 200,width: double.infinity,),
              Text("Loading......")
            ],
          ),
        ):ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return  ListTile(
              onLongPress: (){
                showDialog(context: context, builder: (context) {
                  return  AlertDialog(
                    title: Row(
                      children: [
                        Image.asset('images/exclamation.png',
                          height: 30,width: 30,fit: BoxFit.contain,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Choose an actions ?"),
                        ),
                      ],
                    ),

                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: (){

                          },
                          title: const Text("Edit"),
                          leading: const Icon(Icons.edit),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {

                          },
                          title: const Text("Delete"),
                          leading: const Icon(Icons.delete),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: const Text("CANCEL"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                  );
                });
              },
              leading: Image.network(
                "products[index].image,width: 50",
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image,weight: 50,);
                },
              ),
              title: Text("products[index].productName") ,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("products[index].productCode"),
                  // Text(products[index].totalPrice),
                  // Text(products[index].quantity),
                ],
              ),
              trailing: Text("products[index].unitPrice"),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 0,);
          },

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewProductScreen(),));

          },child: const Icon(Icons.add),)
    );
  }
}
