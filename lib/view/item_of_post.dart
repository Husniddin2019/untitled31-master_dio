
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:untitled3/pages/update.dart';
import '../model/post.dart';
import '../scope/home_scoped.dart';



Widget itemofPost( HomeScoped homeScoped ,Post post){
  return Slidable(
    child: Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //color: Colors.teal,
            child: Text(
              post.title!.toUpperCase(),
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),),
          SizedBox(width: 5,),
          Container( child: Text(post.body!),),
        ],
      ),
    ),
    startActionPane: ActionPane(
    // A motion is a widget used to control how the pane animates.
    motion:  ScrollMotion(),


    children:  [
      // A SlidableAction can have an icon and/or a label.
      SlidableAction(
        onPressed: (BuildContext context){homeScoped.apiPostDelete(post).then((value) =>
        {if (value) homeScoped.apiPost()}
        );},
        backgroundColor: Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),

    ],
  ),

    // The end action pane is the one at the right or the bottom side.
    endActionPane:  ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){Navigator.push(context,MaterialPageRoute(builder: (context) =>  update()));},
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.red,
          icon: Icons.update,
          label: 'UPDATE',

        ),
      ],
    ),
  );
}