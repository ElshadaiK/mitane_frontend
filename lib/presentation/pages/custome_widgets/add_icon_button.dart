import 'package:flutter/material.dart';

class AddIconButton extends StatelessWidget {

  final String routeName;

  const AddIconButton(this.routeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.only(top: 24),
      margin: EdgeInsets.all(24),
      alignment: Alignment.bottomRight,
      child: 
          IconButton(
                icon: Icon(
                  Icons.add,
                ),
                iconSize: 50,                
                color: Colors.green,
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    routeName,
                  );
                  // this line
                  print("result:: $result");
                },
          ),
    );
  }
}