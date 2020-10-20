import 'package:flutter/material.dart';
import 'package:rent_all_app/api/datamodal/api_datamodel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget list_item(Result result,int index){

  double rating=0;

  bool bookType=false;

  if(result.reviewsStarRating!=null) {
    rating = result.reviewsStarRating.toDouble();
  }

  if(result.bookingType.toString()=="BookingType.INSTANT"){
    print(result.bookingType.toString());
    bookType=true;
  }


  return Card(
    elevation: 0,
    child: Container(
      height: 160,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Stack(children:[Card(
            child:
            Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey,
              borderRadius: BorderRadius.circular(5)
              //,
            ),

            child: ClipRRect(
              child: Image.network("http://qa.rentallscript.com:3000/images/upload/x_medium_"+result.listPhotoName,fit: BoxFit.fill,height:120 ,),
              borderRadius: BorderRadius.circular(5),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,right: 10),
            width: double.infinity,
            child: Align(alignment: Alignment.topRight,child:Icon(Icons.favorite_border,size: 30,color: Colors.white,)),
          )

          ]),
          Container(
            padding:EdgeInsets.only(left: 5,right: 5),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Row(
                  children: [
                    Text(result.roomType.toUpperCase(),maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 12,fontFamily: 'Poppins Medium',),overflow: TextOverflow.ellipsis,),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: bookType ? Image.asset("assets/images/instant.png",color: Colors.deepOrange,width: 12,height: 12,):Container(),
                    )
                  ],
                ),
                Text(result.title,maxLines: 2,style: TextStyle(fontFamily: 'Poppins SemiBold'),overflow: TextOverflow.ellipsis,),
                Text("\$"+result.listingData.basePrice.toString()+" per night",maxLines: 2,style: TextStyle(color: Colors.black54,fontSize: 12,fontFamily: 'Poppins Medium'),overflow: TextOverflow.ellipsis,),
                FlutterRatingBar(
                  initialRating: rating.toDouble(),
                  fillColor: Colors.blue,
                  itemCount: 5,
                  borderColor: Colors.grey,
                  itemSize: 15,
                )
              ],
            ),
          ),
        ],
      )
    ),
  );
}