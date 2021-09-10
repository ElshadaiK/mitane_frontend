import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_blocs.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/IngredientAdmin_Edit.dart';
import 'package:mitane_frontend/presentation/pages/common/SlideEditAndDelete.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'IngredientAdmin_Add.dart';

class AdminIngredients extends StatefulWidget {
  static const routeName = '/admin/ingredients';

  get curPrice => null;
  @override
  _AdminIngredientsState createState() => _AdminIngredientsState();
}

class _AdminIngredientsState extends State<AdminIngredients> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text(
          "ingredients",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavDrawer(),
      resizeToAvoidBottomInset: false,  
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.15,
          //   padding: EdgeInsets.symmetric(vertical: 5.0),
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 6,
          //       itemBuilder: (BuildContext context, int itemCount) {
          //         return GestureDetector(
          //           // onTap: () => Navigator.of(context).pushNamed("/productDetail"),
          //           child: Container(
          //             child: Stack(
          //               alignment: AlignmentDirectional.center,
          //               children: [
          //                 Container(
          //                   margin: EdgeInsets.symmetric(horizontal: 5),
          //                   width: MediaQuery.of(context).size.width * 0.4,                 
          //                   decoration: BoxDecoration(
          //                       color: Color(0xDD8CC63E),
          //                       borderRadius: BorderRadius.circular(20)),
          //                 ),
          //                 Center(
          //                   child: Text(
          //                     "User Role",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontFamily: "RobotMono",
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          Expanded(
            child: BlocBuilder<IngredientBloc, IngredientState>(
              builder: (_, state) {
                if (state is IngredientAdminOperationFailure) {
                  return Text('Could not do course operation');
                }

                if (state is IngredientAdminOperationSuccess) {
                  final ingredients = state.ingredients;

                  return 
                  ListView.builder(
                    itemCount: ingredients.length,
                    itemBuilder: (_, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),                    
                        child: Dismissible(                    
                            child: IngredientCard(
                                productName: ingredients.elementAt(index).name,
                                category: ingredients.elementAt(index).category,
                            ),
                            background: slideRightBackground(),
                            secondaryBackground: slideLeftBackground(),
                            key: ValueKey<Ingredient>(ingredients.elementAt(index)),
                            confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              final bool res = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Are you sure you want to delete ${ingredients.elementAt(index).name}?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {                                        
                                            Navigator.pop(context, false);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              BlocProvider.of<IngredientBloc>(context)
                                                  .add(IngredientAdminDelete(ingredients.elementAt(index).id.toString()));
                                              Navigator.of(context).pushNamedAndRemoveUntil(
                                                  AdminIngredients.routeName, (route) => false);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                              return res;
                            } else if (direction == DismissDirection.startToEnd){
                                Navigator.of(context).pushNamed(
                                  AdminIngredientEdit.routeName,
                                  arguments: IngredientArgument(ingredient: ingredients.elementAt(index)),
                                );
                              }
                            },
                          ),
                      );
                      
                  });
                }

                return CircularProgressIndicator();
              },
            ),
            
            
            
          ),         
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AdminIngredientAdd.routeName,
        ),      
        child: const Icon(Icons.add, color: Colors.green,),
        backgroundColor: Colors.white,
      ),
      
    );
      
  }
}

class IngredientCard extends StatelessWidget {
  final String productName;
  final String category;
  const IngredientCard(
      {Key? key,
      required this.productName,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: Color(0xDD8CC63E),
                    width: 5))),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(
              FontAwesomeIcons.handsHelping,
              color: Color(0xDD8CC63E),
              size: 50,
            ),

            SizedBox(width: 15,),
            Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$productName",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotMono"),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Category:",
                          style: TextStyle(fontSize: 16, fontFamily: "RobotMono"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "$category",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ]),
                ],
              )
            ],
          ),
          ]
        )
      ),
    );
  }
}
