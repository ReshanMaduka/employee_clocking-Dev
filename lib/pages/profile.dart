import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//import '../widgets/products/products.dart';
//import '../widgets/ui_elements/logout_list_tile.dart';
import '../scoped_models/main.dart';

class Profile extends StatefulWidget {
//  final MainModel model;

//  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<Profile> {
  @override
  initState() {
//    widget.model.fetchProducts();
    super.initState();
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(.0, 0.20, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage('assets/bg@300x.png'),
          radius: 70.0,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: new AssetImage('assets/test.png'),
            radius: 45.0,
          ),
//          child: Image.asset('assets/test.png'),
        ),

      ),

    );
  }

  Widget _Details(){
   return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Flexible(
          child: Container(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Full Name',
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'E-mail',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Mobile',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Gender',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Age',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        new Flexible(
          child: Container(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Reshan Maduka',
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'reshanmaduka15@gmail.com',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      style: TextStyle(fontSize: 16.0),

                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      '+94 70  000 0000',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16.0),

                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Male',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16.0),

                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      '25',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16.0),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductsList() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return new Center(
      child: new Container(
        alignment: Alignment.bottomCenter,
        child: new Container(
          padding: EdgeInsets.only(top: 30.0, left: 30.0),
          child:_Details(),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.8],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.deepPurple[500],
                Colors.deepPurple[600],
                Colors.deepPurple[700],
                Colors.deepPurple[800],
              ],
            ),
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0)),
          ),
          height: 350.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(36, 33, 51, 60.0),
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(36, 33, 51, 60.0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
//            tooltip: 'Restitch it',
            onPressed: _buildProductsList,
          ),
        ],
      ),
      body: Container(
//        padding: EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.bottomCenter,
//              width: targetWidth,
                child: Column(
                  children: <Widget>[
                    _showLogo(),
                    SizedBox(
                      height: 2.0,
                    ),
                    new Text('Reshan Maduka'),
                    new Text('test tetet etet',style: TextStyle(color: Colors.deepPurple[200]),),
//                    new T
                    SizedBox(
                      height: 50.0,
                    ),
                    _buildProductsList()
                  ],
                ),
            ),

          ),
        ),
      ),
    );
  }
}

//
