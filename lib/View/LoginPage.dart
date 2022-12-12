import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.6,
                color: const Color(0xFFb83058),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: SvgPicture.asset("assets/Login.svg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 180, bottom: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                        offset: Offset(0.0, 1.0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 22,
                              // fontWeight: FontWeight.w600,
                              color: Color(0xFFb83058),
                              fontFamily: 'Montserrat',
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          style: const TextStyle(fontFamily: 'Montserrat',height: 1),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFb83058), width: 2.0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/Profile.svg',
                              fit: BoxFit.scaleDown,
                              height: 5,
                              width: 5,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          style: const TextStyle(
                              fontFamily: 'Montserrat',height: 1),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFb83058), width: 2.0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.20,
                    left: MediaQuery.of(context).size.width / 1.65,
                    bottom: 4),
                child: const Text(
                  "Citizen's Login",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.transparent,
                    shadows: [
                      Shadow(offset: Offset(0, -8), color: Colors.blue)
                    ],
                    // Step 3 SEE HERE
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.20),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/loginAndSignUp');
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child:
                          SvgPicture.asset("assets/Arrow Pink.svg", height: 50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 0.53,
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Powered By : ",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                        child: Image(
                            image: AssetImage(
                          'assets/img.png',
                        )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
