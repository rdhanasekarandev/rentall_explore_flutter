import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_all_app/api/datamodal/api_bloc.dart';
import 'package:rent_all_app/api/datamodal/api_datamodel.dart';
import 'package:rent_all_app/repo/api_provider.dart';
import 'package:rent_all_app/ui/search.dart';
import 'package:progress_indicators/progress_indicators.dart';


import 'List/list_item.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Rent ALL",
    home: Scaffold(
      body:   Provider<ListingBloc>(
          create: (_)=>ListingBloc(repoProvider: RepoProvider()),
          dispose: (_,bloc)=>bloc.dispose(),
          child: RentAll())
    ),
    )

  );
}

class RentAll extends StatefulWidget {
  @override
  _RentAllState createState() => _RentAllState();
}

class _RentAllState extends State<RentAll> {

  static List<Result> recommendedList;
  static List<Result> mostViewedList;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Search(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    ListingBloc listingBloc = Provider.of<ListingBloc>(context);


    return new Container(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child:
        new Stack(
            children:[

              SingleChildScrollView(
                  child:Container(
                    padding:EdgeInsets.all(8),
                    margin:EdgeInsets.only(top: 80,bottom: 10),
                    child: new Stack(
                      children: [
                        Container(
                            child: StreamBuilder(
                                stream: listingBloc.mostViewedList,
                                builder: (context,snapdata) {
                                  if (!snapdata.hasData) {
                                    return new Container(
                                      margin: EdgeInsets.only(top: 300),
                                      width: double.infinity,
                                      child:Align(alignment:Alignment.center,child:  JumpingDotsProgressIndicator(
                                        color: Colors.blue,
                                        fontSize: 80.0,
                                      ),),
                                    );
                                  }else if(snapdata.hasData){
                                    mostViewedList = snapdata.data as List<Result>;
                                    return StreamBuilder(
                                        stream: listingBloc.recommendedList,
                                        builder: (context,snapdata){
                                          if (!snapdata.hasData) {
                                            return new Container(
                                              margin: EdgeInsets.only(top: 300),
                                              width: double.infinity,
                                              child:Align(alignment:Alignment.center,child:  JumpingDotsProgressIndicator(
                                                fontSize: 80.0,
                                                color: Colors.blue,
                                              ),),
                                            );
                                          } else if(snapdata.hasData){

                                            recommendedList = snapdata.data as List<Result>;

                                            return Container(
                                                child:new Column(

                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Container(
                                                        margin:EdgeInsets.only(top: 100,left: 8),
                                                        child: subHeaderText("Recommended Listing"),
                                                      ),
                                                           GridView.count(
                                                          padding: EdgeInsets.all(0),
                                                          crossAxisCount: 2,
                                                          physics: const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                             childAspectRatio: MediaQuery.of(context).size.width*1.7/MediaQuery.of(context).size.height,
                                                          children: List.generate(recommendedList.length, (index){
                                                          return list_item(recommendedList[index], index);
                                                          // }),
                                                          // itemCount: listingList.length,
                                                          // itemBuilder: (BuildContext context,index){
                                                          //   return list_item(listingList[index],index);
                                                          }),
                                                           ),
                                                      Container(
                                                        margin:EdgeInsets.only(top: 0,left: 8,bottom: 10),
                                                        child: subHeaderText("Most Viewed Listing"),
                                                      ),
                                                        GridView.count(
                                                          padding: EdgeInsets.all(0),
                                                          crossAxisCount: 2,
                                                          physics: const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          childAspectRatio: MediaQuery.of(context).size.width*1.7/MediaQuery.of(context).size.height,
                                                          children: List.generate(mostViewedList.length, (index){
                                                            return list_item(mostViewedList[index], index);
                                                            // }),
                                                            // itemCount: listingList.length,
                                                            // itemBuilder: (BuildContext context,index){
                                                            //   return list_item(listingList[index],index);
                                                          }),
                                                        ),
                                                    ]
                                                )
                                            );

                                          }

                                          return Container();
                                        }
                                    );
                                  }
                                  return Container();
                                })),
                      ],
                    ),
                  )
              ),
              new Container(
                margin: EdgeInsets.all(0),
                height: 170,
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
                child: new Column(
                  children: [
                   FlatButton(onPressed:(){
                     Navigator.of(context).push(
                       _createRoute()
                     );
                   }

                     , child: Container(
                      margin: EdgeInsets.only(top: 62,left: 0,right: 0),
                      height: 48,
                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: new Row(
                        children: [
                          Icon(Icons.search,color: Colors.black26,),
                          Expanded(
                              child:
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("Try \"Madurai\"",style: TextStyle(fontSize: 14,decoration: TextDecoration.none,color: Colors.black26,fontFamily: 'Poppins Regular'),),
                              )
                          )
                        ],
                      ),
                    ),
                   ),
                    new Row(
                      children: [
                        Container(
                          width: 55,
                          margin: EdgeInsets.only(left: 16,top: 22),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child:Center(
                              child: Text("Dates",style: TextStyle(color: Colors.black,fontSize: 12,decoration: TextDecoration.none,fontFamily: 'Poppins Regular'),)
                          ),
                        ),
                        Container(
                            width: 55,
                            margin: EdgeInsets.only(left: 10,top: 22),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child:Center(
                              child: Text("Guests",style: TextStyle(color: Colors.black,fontSize: 12,decoration: TextDecoration.none,fontFamily: 'Poppins Regular'),),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]
        )
    );
  }


}

Text subHeaderText(String subHead){

  return Text(subHead,style: TextStyle(color: Colors.black87,fontSize: 22,decoration: TextDecoration.none,fontFamily:'Poppins Medium' ),);

}



