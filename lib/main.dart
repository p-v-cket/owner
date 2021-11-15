import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master/colors.dart';
import 'package:master/next_page.dart';
import 'package:master/first_page/main_page.dart';
import 'package:master/second_page/visitLog_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder( //for splash
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && false) {
          return MaterialApp(
            home: Splash(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'P()cket Master',
            theme: ThemeData(
              primarySwatch: MASTERpurpleM,
            ),
            home: MyHomePage(),
          );
        }
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];
  final bottomBarItems =[
    Item('home', Icons.home, Colors.grey),
    Item('home', Icons.check_circle_outline, Colors.grey),
    Item('home', Icons.person_outline, Colors.grey),
    Item('home', Icons.local_parking, Colors.grey)
  ];

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/logo.svg'),
        centerTitle: true,
        leading: Icon(Icons.storefront),
        actions: <Widget>[
      Stack(
      alignment: Alignment.center,
        children: <Widget>[
          IconButton(
              icon: Item('noticifations', Icons.notifications_outlined, Colors.black).buildIcon(),
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
          counter != 0
              ? Positioned(
            right: 11,
            top: 11,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                '$counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
              : Container()
        ],
      ),
          IconButton(
            onPressed: () {},
            icon: Item('setting', Icons.settings, Colors.black).buildIcon(),
          ),
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.grey),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: bottomBarItems.map<BottomNavigationBarItem>((Item item) {
          return BottomNavigationBarItem(
            title: Text(item.name, style: TextStyle(color: Colors.grey),),
            icon: item.buildIcon(),
          );
        }).toList(),
      ),
    );
  }
}



