import 'package:scoped_model/scoped_model.dart';

import 'package:flutter/material.dart';



import '../scope/adScoped.dart';
import '../scope/home_scoped.dart';


import 'home.dart';
class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  adScoped aadScoped = adScoped ();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  ScopedModel<adScoped>(
      model: aadScoped,
     child: ScopedModelDescendant<adScoped>(
         builder: (context, child, model){
         return
            Stack(children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: _titleTextEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.grey),

                                ),
                                hintText: ("Insert title"),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                )
                            )
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                      //height: 80,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            maxLines: 5,
                            controller: _bodyTextEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: ("Insert body"),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.blue),
                                )
                            )
                        )
                    ),
                  ],
                ),
              )
            ]);
        }
      ),),

      floatingActionButton: FloatingActionButton(
        onPressed: (){aadScoped.apiPostCreate(_titleTextEditingController,_bodyTextEditingController).then((value) => {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomePage()),)
        });},
        child: Icon(Icons.add),
      ),
    );
  }
}
