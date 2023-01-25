import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utility/FAQList.dart';



class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}
class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFFb83058),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        const Text("FAQ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat-Regular'))
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: MediaQuery.of(context).size.height / 9,
                      bottom: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 6,
                          )
                        ]),
                    child: ListView.builder(
                      itemCount: faqList.length,
                      itemBuilder: (BuildContext context, int index){
                        return   Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10),
                          child: Column(
                            children: [
                              Theme(
                                data:  ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                    collapsedIconColor: Colors.black,
                                    title: Text(faqList[index]['title'],
                                        style:const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFb83058),
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Montserrat-Regular')),
                                    //subtitle: Text('Sub Title One'),
                                    children: <Widget>[
                                      ListTile(
                                          title: Text(faqList[index]['listTileTitle'],
                                          style:const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Montserrat-Regular'))),

                                    ]
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        );
                      }

                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 0.5,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Powered By : ",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat'),
                      ),
                      Image(
                        image: AssetImage("assets/img.png"),
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
