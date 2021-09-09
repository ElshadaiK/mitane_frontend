import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/suggestion/bloc/suggestion_bloc.dart';
import 'package:mitane_frontend/application/suggestion/states/suggestion_state.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_screen.dart';

class ResultDisplay extends StatefulWidget {
  
  const ResultDisplay({Key? key}) : super(key: key);

  @override
  _ResultDisplayState createState() => _ResultDisplayState();
}

class _ResultDisplayState extends State<ResultDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Suggestions",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          width: (MediaQuery.of(context).size.width),
          child: BlocBuilder<SuggestionBloc,SuggestionState>(builder: (context,state){

            if(state is SuggestionFetching){
              return  Center(
                        child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ));
            }
            if(state is SuggestionFetched){

              return ListView.builder(
                itemCount: state.suggestion.length,
                itemBuilder: (BuildContext context, int index) {
                  final suggestion = state.suggestion[index];
                  
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: PriceCard(
                      product: suggestion.product['name'],
                      unit: "Kg",
                      todayPrice: suggestion.price[0]['price'].toStringAsFixed(2),
                    ),
                  );
                });
            }
            return Center(
                  child: Text(
                "No result",
                style: TextStyle(fontSize: 30)));

            
          }),
        ),
      ),
    );
  }
}
