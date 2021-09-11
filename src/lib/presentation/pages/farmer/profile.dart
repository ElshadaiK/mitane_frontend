import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/common/with_out_search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/presentation/pages/farmer/profile.dart';
class FarmerProfilePage extends StatelessWidget {
  const FarmerProfilePage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FarmerWithOutSearchBar(
        floaters: [],
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        
                      ),
                    ),
                    Positioned(
                        left: 50,
                        bottom: 5,
                        child: Icon(
                            
                            
                              Icons.verified_user))
                  ]),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Farmer',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 15,
                                        color: const Color(0xff222222),
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 13,
                                        color: const Color(0x80222222),
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ]),
                              
                            ],
                          ),
                         
                          SizedBox(height: 15),
                          
                         
                          
                          
                         
                         
                          
                      
                ])))
  }
}
