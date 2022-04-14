import 'package:flutter/material.dart';
import 'package:garden_city_app/widgets/garden.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/city.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.leaf,
    FontAwesomeIcons.spa,
    FontAwesomeIcons.tree,
    FontAwesomeIcons.globe,
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap : (){
        setState((){
          _selectedIndex = index;
        });
        
      },
      child: Container(
        height: 60.0,
        width : 60.0, 
        decoration:  BoxDecoration(color : _selectedIndex == index 
          ? Theme.of(context).accentColor 
          : Color(0xFFE7EBEE), 
        borderRadius: BorderRadius.circular(30.0)),
        child : Icon(_icons[index],
          size : 25.0,
          color : _selectedIndex == index 
          ? Theme.of(context).primaryColor
          : Color(0xFFB4C1C4)
        )
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text('Let`s See the Garden !', style: TextStyle(
              fontSize : 30.0,
              fontWeight : FontWeight.bold
            )),
          ),
          SizedBox(
            height:  10.0,
            
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key)).toList()
            
          ),
          SizedBox(height: 20.0,),
          City(),
          SizedBox(height: 20.0,),
          Garden(),
        ])
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab,
        onTap : (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items : [
          BottomNavigationBarItem(
          icon:Container(
            margin : EdgeInsets.symmetric(vertical : 2),
            child: Icon(Icons.search,
             size : 30.0,
             color : Color.fromARGB(255, 12, 69, 14),
             ),
          ),
           label : ''
           ),
           BottomNavigationBarItem(
            icon:Icon(Icons.people,
            size : 30.0,
            color : Color.fromARGB(255, 12, 69, 14),
            ),
            label : ''
            ),
           BottomNavigationBarItem(
             
            icon:CircleAvatar(
              radius : 15.0,
              backgroundImage : NetworkImage('https://media.istockphoto.com/photos/asian-woman-working-on-laptop-picture-id1335295797?s=612x612')
            ),
            
            label : ''
            ),
        ]),
    );
  }
}
