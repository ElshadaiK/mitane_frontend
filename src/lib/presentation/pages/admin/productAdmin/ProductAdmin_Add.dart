import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/product/bloc/product_blocs.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';
import 'package:mitane_frontend/presentation/pages/admin/productAdmin/ProductAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class AdminProductAdd extends StatefulWidget {
  static const String routeName = '/admin/products/add';


  @override
  _AdminProductAddState createState() => _AdminProductAddState();
}

class _AdminProductAddState extends State<AdminProductAdd> {

  final Map<String, dynamic> _product = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Product",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdminProducts.routeName);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "Product Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter product name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._product["name"] = value;
                      });
                  }),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Product Category",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter product category';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._product["category"] = value;
                      });
                  }),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    MitaneButton(
                      onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final ProductEvent event = ProductAdminCreate(
                              Product(
                                id: null,
                                name: this._product["name"],
                                category: this._product["category"],
                              ),
                            );
                      BlocProvider.of<ProductBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AdminProducts.routeName, (route) => false);
                    }                    
                    }, title: "Add Product", )
                  ])
                ],
              ))
        ],
      ),
    ));
  }

}