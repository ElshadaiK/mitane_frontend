import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/farmer/auth/signup/farmer_sign_up2_page.dart';


class FarmerSignUp extends StatefulWidget {
  FarmerSignUp({Key? key}) : super(key: key);

  @override
  _FarmerSignUpState createState() => _FarmerSignUpState();
}
class _FarmerSignUpState extends State<FarmerSignUp> {
  final myController = TextEditingController();
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              height: 300.0,
              width: 300,
            ),
            top: 120,
            left: 180,
          ),
          Positioned(
            child: Text(
              "Please fill your \ninformation",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 150,
            left: 50,
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.all(20),
              child: DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text("Farmer"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Accessory Trader"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Product Trader"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("Tool Trader"),
                    value: 4,
                  ),
                ],
                onChanged: (int? value) {
                  setState(() {
                    _value = value!;
                  });
                },
                isExpanded: true,
              ),
            ),
            top: 200,
            left: MediaQuery.of(context).size.width * 0.2,
          ),
          Positioned(
            child: Container(
              width: 60,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  controller: TextEditingController()..text = '+251',
                  readOnly: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            top: 280,
            left: 30,
          ),
          Positioned(
            child: Container(
              width: 220,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  controller: myController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '(###) ###-####'),
                ),
              ),
            ),
            top: 280,
            left: 100,
          ),
          Positioned(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FarmerSignUp2()),
                  );
                }, // handle your onTap here
                child: Container(
                  height: 46,
                  width: 174,
                  child: Align(
                      child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x8CC63E).withOpacity(1),
                          Color(0x709E2F).withOpacity(1),
                        ]),
                  ),
                )),
            top: 480,
            left: 90,
          ),
          Positioned(
            child: Container(
              width: 300,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Name'),
                ),
              ),
            ),
            top: 350,
            left: 30,
          ),
          Positioned(
            child: Container(
              width: 300,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Password'),
                ),
              ),
            ),
            top: 410,
            left: 30,
          ),
        ],
      ),
    );
  }
}
