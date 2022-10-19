import 'package:flutter/material.dart';
import 'package:untitled3/model/post.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scope/home_scoped.dart';
import 'home.dart';
class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {

  HomeScoped scoped = HomeScoped ();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  ScopedModel<HomeScoped>(
      model: scoped,
          child: ScopedModelDescendant<HomeScoped>(
          builder: (context, child, model){
          return Stack
          (children: [
                        Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: TextField(
                                controller: _titleTextEditingController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide(color: Colors.grey),

                                    ),
                                    hintText: ("Insert title"),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide(color: Colors.blue),
                                    )
                                )
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                          //height: 80,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: TextField(
                                maxLines: 5,
                                controller: _bodyTextEditingController,
                                decoration: InputDecoration(border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                    hintText: ("Insert body"),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide(color: Colors.blue),
                                    )
                                )
                            )
                        ),
                      ],
                    ),
                  )]);}

      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){scoped.apiPostUpdate(Post(title:_titleTextEditingController.text,body: _bodyTextEditingController.text )).then((value) => {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomePage()),)
        });},
        child: Icon(Icons.add),
      ),
    );
  }
}
