import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/auth/bloc/auth_bloc.dart';
import 'package:mitane_frontend/application/auth/events/auth_events.dart';
import 'package:mitane_frontend/application/auth/states/auth_state.dart';
import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/farmer/auth/signup/farmer_sign_up2_page.dart';

class FarmerSignUp extends StatefulWidget {
  FarmerSignUp({Key? key}) : super(key: key);

  @override
  _FarmerSignUpState createState() => _FarmerSignUpState();
}

class _FarmerSignUpState extends State<FarmerSignUp> {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  int _role = 1;

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
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Please fill your \ninformation",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 240,
                  child: DropdownButton(
                    value: _role,
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
                      DropdownMenuItem(
                        child: Text("User"),
                        value: 5,
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 230,
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(5),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          autocorrect: false,
                          controller: phoneController,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '(###) ##-####'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5),
                    child: TextField(
                      controller: nameController,
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
                Container(
                  width: 300,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5),
                    child: TextField(
                      controller: passwordController,
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
                Container(
                  width: 300,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5),
                    child: TextField(
                      controller: confirmController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Confirm password'),
                    ),
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                  Widget button = Align(
                      child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ));
                  if (state is Registering) {
                    button = Center(
                        child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ));
                  }

                  return InkWell(
                      onTap: () {
                        final authBloc = context.read<AuthBloc>();
                        authBloc.add(RegisterEvent(
                            register: (Register(
                                name: nameController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                confirm: confirmController.text,
                                role: _role.toString()))));
                      }, // handle your onTap here
                      child: Container(
                        height: 46,
                        width: 174,
                        child: button,
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
                      ));
                }, listener: (context, state) {
                  if (state is RegisterSuccess) {
                    Navigator.pushNamed(context, '/login');
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
