import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/common/with_out_search_bar.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({ Key? key}) : super(key: key);

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
                        image: DecorationImage(
                          image: const AssetImage('assets/images/partwork.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 50,
                        bottom: 5,
                        child: Container(
                            width: 86,
                            height: 86,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/patient.png")))))
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
                                      'Dr. Erick Su',
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
                                      'Dentist, MBBS',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 13,
                                        color: const Color(0x80222222),
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ]),
                              GestureDetector(
                                onTap: () {
                                  },
                                child: Row(children: [
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 13,
                                      color: const Color(0xff7e7e7e),
                                      letterSpacing: 0.052000000000000005,
                                      fontWeight: FontWeight.w300,
                                      height: 1.2307692307692308,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.edit, color: Colors.black),
                                ]),
                              )
                            ],
                          ),
                          Text(
                            'CPS Care Hospital',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 14,
                              color: const Color(0xff222222),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 13,
                              color: const Color(0xff707070),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'ericksu.smile.my',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 12,
                              color: const Color(0xff00b7f1),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Years of experience 13',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 13,
                                color: const Color(0xff707070),
                                letterSpacing: -0.0010399999767541886,
                                fontWeight: FontWeight.w300,
                                height: 1.3846153846153846,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.black),
                              Text(
                                '+912344556',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff222222),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.black),
                              Text(
                                'eruk2345bgb@gmail.com',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff222222),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_pin, color: Colors.black),
                              Expanded(
                                child: Text(
                                  'Street#02, house#45b, main road, Banglore, India',
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 15,
                                    color: const Color(0xff222222),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: 15),
                          Text(
                            'Offered Treatments',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 14,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Treatments',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff0399de),
                                  fontWeight: FontWeight.w300,
                                  height: 0.8666666666666667,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xff0399de),
                                ),
                                child: ImageIcon(
                                  AssetImage("assets/images/icons/new.png"),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available for online consult',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Switch(
                                inactiveTrackColor: Colors.grey,
                                activeTrackColor: Colors.grey,
                                value: true,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Image.asset("assets/images/bgs/maps.png"),
                          SizedBox(height: 20),
                          Text(
                            'Social Media Links',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              ImageIcon(
                                  AssetImage(
                                      "assets/images/icons/social/facebook.png"),
                                  color: Color(0xff1492E6)),
                              SizedBox(width: 10),
                              Text(
                                'facebook.com/sdffaf54523',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff222222),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ImageIcon(
                                  AssetImage(
                                      "assets/images/icons/social/instagram.png"),
                                  color: Color(0xffFF0060)),
                              SizedBox(width: 10),
                              Text(
                                'Instagram.com/fg5sd4gf53sd4f23',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff222222),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ImageIcon(
                                  AssetImage(
                                      "assets/images/icons/social/twitter.png"),
                                  color: Color(0xff1492E6)),
                              SizedBox(width: 10),
                              Text(
                                'twitter.com/sdgsdg5454',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff222222),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ImageIcon(
                                  AssetImage(
                                      "assets/images/icons/social/linkedin.png"),
                                  color: Color(0xff003898)),
                              SizedBox(width: 10),
                              Text(
                                'linkdin.com/fgg35454fdfg',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 15,
                                  color: const Color(0xff222222),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: kBottomNavigationBarHeight + 30,
                  )
                ])));
  }
}
