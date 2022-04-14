import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garden_city_app/models/city_model.dart';
import 'package:garden_city_app/models/garden_model.dart';



class Garden extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
            children :<Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children :<Widget>[
                    Text('Popular Garden', style: TextStyle(
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
                  itemCount : gardens.length,
                  itemBuilder :(BuildContext context, int index){
                    GardenModel garden = gardens[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      width : 240,
                      child : Stack(
                        alignment:  Alignment.topCenter,
                        children : <Widget>[
                        Positioned(
                          bottom : 10.0,
                          child: Container(height : 120.0, 
                          width: 240, 
                          decoration : BoxDecoration(
                            color: Colors.white,
                            borderRadius : BorderRadius.circular(10,)
                            ),
                            child : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment : MainAxisAlignment.end,
                                children :<Widget>[
                                  Text(garden.name,
                                  style : TextStyle(
                                    fontSize : 22.0,
                                    fontWeight : FontWeight.w600,
                                    letterSpacing : 1.2,
                                  )), 
                                  SizedBox(height : 2.0),
                                  Text(garden.address, 
                                  style : TextStyle(
                                    color : Colors.grey
                                  )),
                                  SizedBox(height : 2.0),
                                  Text('\$${garden.price} / ticket', style : TextStyle(
                                    fontSize : 18.0,
                                    fontWeight : FontWeight.w600,

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
                            child : ClipRRect(
                              borderRadius : BorderRadius.circular(20.0),
                              child: Image(height : 180.0, 
                                width : 220.0,
                                image : AssetImage(garden.imageUrl),
                                fit : BoxFit.cover
                              ),
                            )
                          )
                      ])
                    );
                  }
                )
              )
            ],
          );
  }
}
