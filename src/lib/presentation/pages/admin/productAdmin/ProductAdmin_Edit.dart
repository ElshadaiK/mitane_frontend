import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/admin/productAdmin/bloc/ProductAdmin_Blocs.dart';
import 'package:mitane_frontend/domain/admin/productAdmin/entity/ProductAdmin.dart';
import 'package:mitane_frontend/presentation/pages/admin/productAdmin/ProductAdmin_Lists.dart';
// import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';
import 'package:mitane_frontend/route_generator.dart';

class AdminProductEdit extends StatefulWidget {
  static const String routeName = '/admin/products/edit';

  final UserArgument argument;
  AdminProductEdit({ required this.argument });

  @override
  _AdminProductEditState createState() => _AdminProductEditState();
}

class _AdminProductEditState extends State<AdminProductEdit> {

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _product = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit User",
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
        child:  Column(
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
                    initialValue: widget.argument.user.name,
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
                    initialValue: widget.argument.user.phoneNo.toString(),
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
                      final ProductAdminEvent event = ProductAdminUpdate(
                              Product(
                                id: this._product["id"],
                                name: widget.argument.user.name,
                                category: this._product["category"],
                              ),
                            );
                      BlocProvider.of<ProductAdminBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AdminProducts.routeName, (route) => false);
                    }
                    }, title: "Edit Product", )
                  ])
                ],
              ))
        ],
      ),
    ));
  }
}
