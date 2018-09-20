import 'package:flutter/material.dart';
import './favourites.dart' as favourite;
import './popular.dart' as popular;
import './homepage.dart' as homepage;
import './sidebarpages.dart';

void main() => runApp(new MaterialApp(home: new CoolApp()));

class CoolApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CoolAppState();
  }
}

//class MyApp extends StatelessWidget {
//@override
//Widget build(BuildContext context) {
//return new MaterialApp(home: new CoolAppState());
//}
//}

class CoolAppState extends State<CoolApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("STUDENT RECIPES",
            textAlign: TextAlign.center,
            style: new TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.info),
          onPressed: () {},
          ),
        ],
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            //new Tab(child: new Text('Popular', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))),
            new Tab(icon: new Icon(Icons.home)),
            new Tab(child: new Text('Our Favourites', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),],
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("Different types of Recipes"),
              //accountEmail: new Text("Choose:"),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage(
                      "assets/sidebar.jpg"),
                ),
              ),
            ),
            new ListTile(
              title: new Text("Recipes Under £5"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new PageOne(
                          'RECIPIES UNDER £5'
                          ),),),
            ),
            new ListTile(
              title: new Text("Asain Recipes: Quick, Tasty and Affordable"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PageOne(
                      'AUTHENTIC ASAIN DISHES'
                      ))),
            ),
            new ListTile(
              title: new Text("Help"),
              trailing: new Icon(Icons.help),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PageOne(
                      'COMMON ASKED QUESTIONS: '
                      ))),
            ),
            new ListTile(
              title: new Text("About Our Company"),
              trailing: new Icon(Icons.info),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PageOne(
                      'OUR VISION'
                      ))),
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          //new popular.PopularPage(),
          new homepage.HomepagePage(),
          new favourite.FavouritePage(),
        ],
      ),
    );
  }
}
