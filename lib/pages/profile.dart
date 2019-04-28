import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
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

  Widget _Details() {
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

  Widget _showLogo() {
    return new Center(
      child: new ResponsiveContainer(
        heightPercent: 25.0,
        widthPercent: 45.0,
        child: Hero(
          tag: 'hero',
          child: Padding(
            padding: EdgeInsets.fromLTRB(.0, 0.20, 0.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: new AssetImage('assets/bg@300x.png'),
              radius: 80.0,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: new AssetImage('assets/test.png'),
                radius: 60.0,
              ),
//          child: Image.asset('assets/test.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    final double deviceWidth = MediaQuery.of(context).size.height;
    print(deviceWidth);
    return new Center(
        child: new Container(
      child: new ResponsiveContainer(
        heightPercent: 45.0,
        widthPercent: MediaQuery.of(context).size.width,
        child: new Container(
          padding: EdgeInsets.only(top: 30.0, left: 30.0),
          child: _Details(),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF545172),
                const Color(0xFF545172),
                const Color(0xFF545172),
                const Color(0xFF545172),
                const Color(0xFF545172),
                const Color(0xFF545172),
                const Color(0xFF464360),
                const Color(0xFF464360),
                const Color(0xFF464360),
              ], // whitish to gray
//              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ),
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0)),
          ),
//          height: 350.0,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFF242133),
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0.0,
        backgroundColor: const Color(0xFF242133),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
//            tooltip: 'Restitch it',
            onPressed: _buildProductsList,
          ),
        ],
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _showLogo(),
          new Center(
            child: Text('Reshan Maduka'),
          ),
          new Center(
            child: Text(
              'test tetet etet',
              style: TextStyle(color: Colors.deepPurple[200]),
            ),
          ),
//          new TextField(),
          Expanded(
            child: new Container(),
          ),
          Column(
            children: <Widget>[_buildProductsList()],
          )
        ],
      ),
    );
  }
}
