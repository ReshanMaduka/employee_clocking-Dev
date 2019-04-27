import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

//import '../widgets/products/products.dart';
//import '../widgets/ui_elements/logout_list_tile.dart';
import '../scoped_models/main.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;
  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  initState() {
    widget.model.fetchUserSchedules();
    super.initState();
  }

  Widget _buildProductsList() {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(child: Text('No Products Found!'));
        return RefreshIndicator(onRefresh: model.fetchUserSchedules, child: content) ;
      },
    );
  }

//  Widget _buildProductsList() {
//    return new Container(
//      height: 300.0,
//      child: new Container(
//          alignment: Alignment.bottomCenter,
//          decoration: new BoxDecoration(
//              color: Colors.blue.shade400,
//              borderRadius: new BorderRadius.only(
//                  topLeft: const Radius.circular(40.0),
//                  topRight: const Radius.circular(40.0))),
//          child: new Center(
//            child: new Text("Hi modal sheet"),
//          )),
//    );
//
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(36, 33, 51,60.0),
      body: _buildProductsList(),
    );
  }
}
