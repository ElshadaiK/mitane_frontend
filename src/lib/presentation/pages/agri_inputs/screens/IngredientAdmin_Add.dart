import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_blocs.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/IngredientAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class AdminIngredientAdd extends StatefulWidget {
  static const String routeName = '/admin/ingredients/add';


  @override
  _AdminIngredientAddState createState() => _AdminIngredientAddState();
}

class _AdminIngredientAddState extends State<AdminIngredientAdd> {

  final Map<String, dynamic> _ingredient = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Ingredient",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdminIngredients.routeName);
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
                      labelText: "Ingredient Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter ingredient name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._ingredient["name"] = value;
                      });
                  }),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Ingredient Category",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter ingredient category';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._ingredient["category"] = value;
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
                      final IngredientEvent event = IngredientAdminCreate(
                              Ingredient(
                                id: null,
                                name: this._ingredient["name"],
                                category: this._ingredient["category"],
                              ),
                            );
                      BlocProvider.of<IngredientBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AdminIngredients.routeName, (route) => false);
                    }                    
                    }, title: "Add Ingredient", )
                  ])
                ],
              ))
        ],
      ),
    ));
  }

}