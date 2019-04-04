import 'package:flutter/material.dart';


class CustomerHomePage extends StatefulWidget {
  @override 
  CustomerHomeState createState() {
    return CustomerHomeState();
  }
}





class CustomerHomeState extends State<CustomerHomePage> with SingleTickerProviderStateMixin{


  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3,vsync: this);
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TestProject'),
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new ListTile(
              title: const Text('Select your LPG'),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new TabBar(
              controller: _tabController,
              tabs: [
                new Tab(
                  // icon: const Icon(Icons.home),
                  text: 'New',
                ),
                new Tab(
                  // icon: const Icon(Icons.my_location),
                  text: 'Refill',
                ),
              ],
            ),
          ),
          new Container(
            height: 80.0,
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new Card(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    new RaisedButton(
                      child: const Text('LPG 14 kg'),
                      color: Theme.of(context).accentColor,
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        // Perform some action
                      },
                    ),
                    new RaisedButton(
                      child: const Text('LPG 12 kg'),
                      color: Theme.of(context).accentColor,
                      elevation: 4.0,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.amber,
                      onPressed: () {
                        // Perform some action
                      },
                    ),
                  ],)
                ),
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.location_on),
                    title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                  ),
                ),
              ],
            ),
          ),
          new Card(
            child: new ListTile(
              title: const Text('Some more information'),
            ),
          ),
          new RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: const Text(
              'Search for POIs',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}