import 'package:flutter/material.dart';
import 'package:garden_city_app/models/activity_model.dart';
import 'package:garden_city_app/models/city_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityScreen extends StatefulWidget {
  
  final CityModel city;
  CityScreen({this.city});
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  _buildRatingStars(int rating){
    String stars = '';
    for(int i =0; i <rating; i++){
      stars += '*  ';
    }
    stars.trim();
    return Text(stars);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        children :<Widget>[
          Stack (children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration : BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow : [
                  BoxShadow(
                    color : Colors.black26 ,
                    offset : Offset(0.0, 2.0),
                    blurRadius : 6.0,
                )]  
              ),
              child : Hero(
                tag : widget.city.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image : AssetImage(widget.city.imageUrl),
                    fit : BoxFit.cover
                  ),
                ),
              )

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 10.0, vertical : 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                IconButton(icon :
                 Icon(Icons.arrow_back),
                 iconSize :30.0,
                 color : Colors.black,
                 onPressed : () => Navigator.pop(context)
                ),
                Row(children: <Widget>[
                  IconButton(icon :
                    Icon(Icons.search),
                    iconSize :30.0,
                    color : Colors.black,
                    onPressed : () => Navigator.pop(context)
                    ),
                  IconButton(icon :
                    Icon(FontAwesomeIcons.sortAmountDown),
                    iconSize :25.0,
                    color : Colors.black,
                    onPressed : () => Navigator.pop(context)
                    ),
                ])
              ]
                ),
            ),
            Positioned(
              left : 10.0,
              bottom: 10.0,
              child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children : <Widget>[
                Text(widget.city.city, 
                  style : TextStyle(
                    color : Colors.white,
                    fontSize : 35.0,
                    fontWeight : FontWeight.w600,
                    letterSpacing : 1.2,
                  )),
                Row(   
                  children: [
                    Icon(FontAwesomeIcons.locationArrow, 
                    color : Colors.white70,
                    size : 15.0
                    ),
                    SizedBox(width : 5.0),
                    Text(widget.city.country,
                    style : TextStyle(
                      color : Colors.white70,
                      fontSize : 20.0,
                    )
                    ),
                  ],
                ),
              ]
                      ),
            ),
            Positioned(
              right : 10.0,
              bottom : 10.0,
              child : Icon(Icons.location_on,
                color : Colors.white70, 
                size : 25.0
              )
            ),
          ],
          ),
          Expanded(
            child: ListView.builder(
              padding : EdgeInsets.only(top : 10.0, bottom : 15.0,),
              itemCount : widget.city.activities.length,
              itemBuilder : (BuildContext context, int index) {
                Activity activity = widget.city.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin : EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height : 170.0,
                      width : double.infinity,
                      decoration : BoxDecoration(color : Colors.white, 
                        borderRadius : BorderRadius.circular(20.0),
                      ),
                      child : Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment : MainAxisAlignment.center,
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children : <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children : <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(activity.name,
                                    style : TextStyle(fontSize : 18.0, fontWeight : FontWeight.w600, ),
                                    maxLines: 2,
                                    overflow : TextOverflow.ellipsis
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('\$${activity.price}', style: TextStyle(fontSize : 20.0 , fontWeight : FontWeight.w600),),
                                    Text('Per person', style: TextStyle(color : Colors.grey),),
                                  ],
                                )
                            ]
                            ),
                            Text(activity.type, style : TextStyle(
                              color : Colors.grey,
                            )),
                            _buildRatingStars(activity.rating),
                            SizedBox(height : 10.0),
                            Row(
                              children : <Widget>[
                                Container(
                                  padding : EdgeInsets.all(5.0),
                                  width : 70.0,
                                  decoration : BoxDecoration(
                                    color : Theme.of(context).accentColor,
                                    borderRadius : BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child : Text(activity.startTimes[0])
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width : 70.0,
                                  decoration : BoxDecoration(
                                    color : Theme.of(context).accentColor,
                                    borderRadius : BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child : Text(activity.startTimes[1])
                                )
                              ]
                            )
                          ]
                        ),
                      )
                    ),
                    Positioned(
                      left : 20.0, 
                      top : 15.0, 
                      bottom : 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.0),
                        child : Image(
                          width : 110.0,
                          image : AssetImage(activity.imageUrl),
                          fit : BoxFit.cover
                        )
                      ),
                    )
                  ],
                );
              }
            ),
          )
        ]
      )
    );
  }
}