import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/trending/bloc/trending_bloc.dart';
import 'package:mitane_frontend/application/trending/states/trending_state.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_screen.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';

class Trending extends StatelessWidget {
  static const String routeName = '/trending';
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
          "Trending Products",
          style: TextStyle(color: Colors.black),
        ),
          ),
      drawer: NavDrawer(),
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
            Positioned(
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/trending.png"))),
              ),
              bottom: -15,
              left: -20,
            ),
            SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child:
                BlocBuilder<TrendingBloc, TrendingState>(builder: (context, state) {
              print(state);
              if (state is TrendingFetching) {
                return  Center(
                        child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ));
              }
              if (state is TrendingFetched) {
                return ListView.builder(
                    itemCount: state.trending.length,
                    itemBuilder: (BuildContext context, int index) {
                      final price = state.trending[index];

                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: PriceCard(
                            product: price.product['name'],
                            unit: "Kg",
                            todayPrice:
                                price.price[0]['price'].toStringAsFixed(2)),
                      );
                    });
              }
              return Center(
                  child: Text(
                "No result",
                style: TextStyle(fontSize: 30),
              ));
            }),
          ),
        ),

          ]),

    );
  }
}
