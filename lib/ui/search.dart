import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.close),color: Colors.black,onPressed: (){Navigator.pop(context);},),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 0.75)
              )
            ],
            color: Colors.white
        ),
        width: double.infinity,
        height: 70,
        child: new Column(
              children: [
                Container(

                  margin:EdgeInsets.only(left: 30),
                  child:
                TextField(
                  style: TextStyle(color: Colors.black87,fontSize: 22,decoration: TextDecoration.none,fontFamily:'Poppins SemiBold' ),
                    cursorColor: Colors.blueAccent,
                    autofocus: true,

                    decoration: new InputDecoration(
                      hintText: "Where to?",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    )
                ),
                )
              ],
            ),
          )
    );
  }
}
