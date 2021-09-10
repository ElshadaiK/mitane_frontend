import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_blocs.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';
import 'package:mitane_frontend/presentation/pages/admin/ingredientAdmin/IngredientAdmin_Lists.dart';
// import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';
import 'package:mitane_frontend/route_generator.dart';

class AdminIngredientEdit extends StatefulWidget {
  static const String routeName = '/admin/ingredients/edit';

  final IngredientArgument argument;
  AdminIngredientEdit({ required this.argument });

  @override
  _AdminIngredientEditState createState() => _AdminIngredientEditState();
}

class _AdminIngredientEditState extends State<AdminIngredientEdit> {

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _ingredient = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Product",
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
                    initialValue: widget.argument.ingredient.name,
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
                    initialValue: widget.argument.ingredient.category,
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
                      final IngredientEvent event = IngredientAdminUpdate(
                              Ingredient(
                                id: widget.argument.ingredient.id,
                                name: this._ingredient['name'],
                                category: this._ingredient["category"],
                              ),
                            );
                      BlocProvider.of<IngredientBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AdminIngredients.routeName, (route) => false);
                    }
                    }, title: "Edit Ingredient", )
                  ])
                ],
              ))
        ],
      ),
    ));
  }
}
