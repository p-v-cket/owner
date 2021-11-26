import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master/colors.dart';
import 'package:master/page/addStorePage.dart';
import 'package:master/page/widgets/next_page.dart';
import 'package:master/page/main_page.dart';
import 'package:master/page/visitLog_page.dart';
import 'package:master/provider/authProvider.dart';
import 'package:master/page/logInPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AuthProvider())
        ],
        child: MyApp()
    )
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Provider.of<AuthProvider>(context, listen: true).isValid(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'P()cket Master',
            theme: ThemeData(
              primarySwatch: MASTERpurpleM,
            ),
            home: snapshot.data ? MyHomePage() : LogInPage(),
          );
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'P()cket Master',
            theme: ThemeData(
              primarySwatch: MASTERpurpleM,
            ),
            home: Scaffold(
                backgroundColor: MASTERpurpleM,
                body: Center(child: CircularProgressIndicator())
            ),
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
        leading: IconButton(
            icon: Item('addstore', Icons.storefront, Colors.black).buildIcon(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddStorePage()),
              );
              }),

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
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
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



