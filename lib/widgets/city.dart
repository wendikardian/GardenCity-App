import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden_city_app/screens/city_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/city_model.dart';

class City extends StatelessWidget{

  @override
  Widget build(BuildContext context){
   return Column(
            children :<Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children :<Widget>[
                    Text('Top City ', style: TextStyle(
                      fontSize : 22.0,
                      fontWeight : FontWeight.bold,
                      letterSpacing :1.5 
                    )), 
                    GestureDetector(
                      onTap : () => print("See all"),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(FontAwesomeIcons.paperPlane, 
                                              color : Colors.green,
                                              size : 20),
                      )
                    )
                  ]
                ),
              ),
              Container(
                height :300,
                child : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount : cities.length,
                  itemBuilder :(BuildContext context, int index){
                    CityModel city = cities[index]; 
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => CityScreen(
                          city : city)
                          ),
                        ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width : 210,
                        child : Stack(
                          alignment:  Alignment.topCenter,
                          children : <Widget>[
                          Positioned(
                            bottom : 10.0,
                            child: Container(height : 120.0, 
                            width: 200, 
                            decoration : BoxDecoration(
                              color: Colors.white,
                              borderRadius : BorderRadius.circular(10,)
                              ),
                              child : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment : MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children :<Widget>[
                                    Text('${city.activities.length} activities',
                                    style : TextStyle(
                                      fontSize : 22.0,
                                      fontWeight : FontWeight.w600,
                                      letterSpacing : 1.2,
                                    )), 
                                    Text(city.description, 
                                    style : TextStyle(
                                      color : Colors.grey
                                    ))
                                  ]
                                ),
                              )
                                
                              ),
                          ),
                            Container(
                              decoration: BoxDecoration(color : Colors.white,
                                borderRadius : BorderRadius.circular(20.0),
                                boxShadow : [BoxShadow(
                                    color : Colors.black26, 
                                    offset: Offset(0.0,2.0, ), 
                                    blurRadius : 6.0,
                                )]
                              ),
                              child : Stack(
                                children : <Widget>[
                                  Hero(
                                    tag : city.imageUrl,
                                    child: ClipRRect(
                                      borderRadius : BorderRadius.circular(20.0),
                                      child: Image(height : 180.0, 
                                        width : 180.0,
                                        image : AssetImage(city.imageUrl),
                                        fit : BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left : 10.0,
                                    bottom: 10.0,
                                    child: Column(
                                      crossAxisAlignment : CrossAxisAlignment.start,
                                      children : <Widget>[
                                        Text(city.city, 
                                          style : TextStyle(
                                            color : Colors.white,
                                            fontSize : 24.0,
                                            fontWeight : FontWeight.w600,
                                            letterSpacing : 1.2,
                                          )),
                                        Row(   
                                          children: [
                                            Icon(FontAwesomeIcons.locationArrow, 
                                            color : Colors.white,
                                            size : 10
                                            ),
                                            SizedBox(width : 5.0),
                                            Text(city.country,
                                            style : TextStyle(
                                              color : Colors.white,
                                            )
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  )
                                ]
                              )
                            )
                        ])
                      ),
                    );
                  }
                )
              )
            ],
          );
  }
}