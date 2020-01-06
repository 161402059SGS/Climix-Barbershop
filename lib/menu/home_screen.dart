import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/destination_c.dart';
import 'package:mobile/widgets/destination_d.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.cut,
    FontAwesomeIcons.shoppingBag,
    FontAwesomeIcons.locationArrow,
    FontAwesomeIcons.ticketAlt,    
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
        
      },
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: _selectedIndex == index? Colors.brown : Color(0xFFE7EBEE  ), 
        borderRadius: BorderRadius.circular(30.0),
      ),
        child: Icon(_icons[index], 
        size: 25.0, 
        color: _selectedIndex == index? Colors.white : Color(0xFFB4C1C4),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical:30.0),
          children: <Widget>[
            Padding(
             padding: EdgeInsets.only(left: 20.0, right: 50.0), 
             child: Text('Which Haircut Style Suitable for You ?', 
             style: TextStyle(
               fontSize: 30.0, 
               fontWeight: FontWeight.bold, 
               fontFamily: 'Montserrat'
                ), 
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: _icons
              .asMap()
              .entries
              .map(
                (MapEntry map) => _buildIcon(map.key),
              )
              .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            DestinationsD(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          
          BottomNavigationBarItem(
            icon: Icon(

              Icons.home, size: 30.0
              ),
              title: Text('Home'),
            ),
            
            BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket, size: 30.0
              ),
              title: Text('Shop'),
            ),

             BottomNavigationBarItem(
            icon: Icon(
              Icons.person, size: 30.0
              ),
              title: Text('reward'),
            ),

            

          ],
      ),
    );
  }
}
