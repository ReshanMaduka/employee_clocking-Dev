import 'package:flutter/material.dart';
import './schedules.dart';
import './profile.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

class ProductsAdminPage extends StatelessWidget {
  final MainModel model;
  ProductsAdminPage(this.model);

  @override
  Widget build(BuildContext context) {
    TabController controller;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
//        appBar: AppBar(),
        body: TabBarView(
          children: <Widget>[ProductsPage(model), Profile()],
        ),
        bottomNavigationBar: new Material(
          elevation: 0.0,
          // set the color of the bottom navigation bar
          color: Color.fromRGBO(55, 51, 77,60.0),
          // set the tab bar as the child of bottom navigation bar
          child: new TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 0.0),
            ),
            tabs: <Tab>[
              new Tab(
                // set icon to the tab
                icon: new Icon(Icons.home),
              ),
              new Tab(
                icon: new Icon(Icons.person),
              ),
            ],
            // setup the controller
            controller: controller,
          ),
        ),
      ),
    );
  }
}
