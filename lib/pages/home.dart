import 'package:flutter/material.dart';
import './schedules.dart';
import './profile.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

class ProductsAdminPage extends StatelessWidget {
  final MainModel model;
  ProductsAdminPage(this.model);

  Widget customBottomNavigationBar(BuildContext context){
//    double myHeight =100.0;//Your height HERE
    return SizedBox(
//      height: myHeight,
      width: MediaQuery.of(context).size.width,
      child: new Material(
        color: const Color(0xFF37334D),
        child:TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 0.0),
          ),
          tabs: [
            Tab(icon: Icon(Icons.home,) ),
            Tab(icon: Icon(Icons.person,) ),
          ],
          labelStyle: TextStyle(fontSize: 12.0),
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xFF545172),
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    TabController controller;
    return DefaultTabController(
      length: 2,
//        final double deviceWidth = MediaQuery.of(context).size.height;
//    print(deviceWidth);
//    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
      child: Scaffold(
//          appBar: new AppBar(
//            backgroundColor: const Color(0xFF0099a9),
//            title: new Image.asset(
//              'images/lb_appbar_small.png',
//              fit: BoxFit.none,
//            ),
//          ),
//        appBar: AppBar(),
        body: TabBarView(
          children: <Widget>[ProductsPage(model), Profile()],
        ),
        bottomNavigationBar: customBottomNavigationBar(context)
      ),
    );
  }
}
