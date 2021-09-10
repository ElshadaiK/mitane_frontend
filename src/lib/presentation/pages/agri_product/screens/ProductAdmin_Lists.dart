import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/application/product/bloc/product_blocs.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';
import 'package:mitane_frontend/presentation/pages/admin/screens/Admin_Home.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/ProductAdmin_Edit.dart';
import 'package:mitane_frontend/presentation/pages/common/SlideEditAndDelete.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'ProductAdmin_Add.dart';

class AdminProducts extends StatefulWidget {
  static const routeName = '/admin/products';

  static Product editArg = Product(id: "", name: "", category: "");

  get curPrice => null;
  @override
  _AdminProductsState createState() => _AdminProductsState();
}

class _AdminProductsState extends State<AdminProducts> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text(
          "products",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdminHome.routeName);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,  
      body: Stack(children: [
        Positioned(
          child: Bubble(
            height: 160.0,
            width: 160.0,
          ),
          top: -5,
          left: -160,
        ),
        Positioned(
          child: Bubble(
            height: 250.0,
            width: 250,
          ),
          top: 130,
          left: 180,
        ),
        SingleChildScrollView(
          child:  Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
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
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (_, state) {
                if (state is ProductAdminOperationFailure) {
                  return Text('Could not do course operation');
                }

                if (state is ProductAdminOperationSuccess) {
                  final products = state.products;

                  return 
                  ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (_, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),                    
                        child: Dismissible(                    
                            child: ProductCard(
                                productName: products.elementAt(index).name,
                                category: products.elementAt(index).category,
                            ),
                            background: slideRightBackground(),
                            secondaryBackground: slideLeftBackground(),
                            key: ValueKey<Product>(products.elementAt(index)),
                            confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              final bool res = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Are you sure you want to delete ${products.elementAt(index).name}?"),
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
                                              BlocProvider.of<ProductBloc>(context)
                                                  .add(ProductAdminDelete(products.elementAt(index).name.toString()));
                                              Navigator.of(context).pushNamedAndRemoveUntil(
                                                  AdminProducts.routeName, (route) => false);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                              return res;
                            } else if (direction == DismissDirection.startToEnd){
                              AdminProducts.editArg = products.elementAt(index);
                                Navigator.of(context).pushNamed(
                                  AdminProductEdit.routeName,
                                  arguments: ProductArgument(product: products.elementAt(index)),
                                );
                              }
                            },
                          ),
                      );
                      
                  });
                }

                return  Center(
                  child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ));
              },
            ),
            
            
            
          ),         
        ],
        
      ),
      ))]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AdminProductAdd.routeName,
        ),      
        child: const Icon(Icons.add, color: Colors.green,),
        backgroundColor: Colors.white,
      ),
      
    );
      
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String category;
  const ProductCard(
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
              FontAwesomeIcons.spa,
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
