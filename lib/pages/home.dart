
import 'package:untitled3/pages/add_new.dart';

import '../scope/home_scoped.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../view/item_of_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeScoped scoped = new HomeScoped();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scoped Model"),
        ),
        body: ScopedModel<HomeScoped>(
          model: scoped,
          child: ScopedModelDescendant<HomeScoped>(
            builder: (context, child, model){
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: scoped.items.length,
                    itemBuilder: (ctx, index) {
                      return itemofPost(scoped, scoped.items[index]);
                    },
                  ),
                  scoped.isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) =>  add()),);
          },
          child: Icon(Icons.add),
        ));
  }

}
