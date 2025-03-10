import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/view/drawer.dart';
import 'package:wsly/view/main-page.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        profileEdit: ProfileEdit(
          name: 'علي ناصر',
          email: 'Alinasser@gmail.com',
          address: '123 Main St',
          number: '774165326',
          car_Plate: 'ABC/123',
          password: '123456',
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xff7042A4),
        color: Color(0xff4B148B),
        animationDuration: const Duration(milliseconds: 300),
        items: <Widget>[
          IconButton(
            icon: const Icon(Icons.history, size: 26, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              size: 26,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.list_alt, size: 26, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
        ],

        onTap: (value) {
          setState(() {});
        },
      ),

      body: Profileedit(
        profileEdit: ProfileEdit(
          name: 'علي ناصر',
          email: 'AliNasser@gmail.com',
          address: '123 Main St',
          number: '774165326',
          car_Plate: 'ABC/123',
          password: '123456',
        ),
      ),
    );
  }
}

class Profileedit extends StatefulWidget {
  final ProfileEdit profileEdit;

  Profileedit({super.key, required this.profileEdit});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WaveclipperWidget(),
            Padding(
              padding: const EdgeInsets.only(right: 13.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: text_rich_method(widget),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  تعديل الملف الشخصي ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff4B148B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black, indent: 100, endIndent: 100),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff4B148B).withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Text(
                        "بيانات الكابتن",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "اسم الكابتن",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        height: 35,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            8,
                                            20,
                                            98,
                                          ),
                                          onChanged: (value) {
                                            widget.profileEdit.name = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: widget.profileEdit.name,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "ايميل الكابتن",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        height: 35,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            8,
                                            20,
                                            98,
                                          ),
                                          onChanged: (value) {
                                            widget.profileEdit.name = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: widget.profileEdit.email,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "رقم الكابتن",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        height: 35,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            8,
                                            20,
                                            98,
                                          ),
                                          onChanged: (value) {
                                            widget.profileEdit.number = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: widget.profileEdit.number,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "عنوان الكابتن",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        height: 35,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            8,
                                            20,
                                            98,
                                          ),
                                          onChanged: (value) {
                                            widget.profileEdit.address = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                widget.profileEdit.address,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "لوحة السيارة",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        height: 35,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            8,
                                            20,
                                            98,
                                          ),
                                          onChanged: (value) {
                                            widget.profileEdit.car_Plate =
                                                value;
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                widget.profileEdit.car_Plate,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Text(
                                        " كلمة المرور",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        height: 35,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: const Color.fromARGB(
                                            255,
                                            8,
                                            20,
                                            98,
                                          ),
                                          onChanged: (value) {
                                            widget.profileEdit.password = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                widget.profileEdit.password,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      color: Color(0xff4B148B),
                                      child: TextButton(
                                        child: Text(
                                          "تحديث",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          // TODO: Update user profile
                                          print("Updating user profile");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
// widget.profileEdit.email

Text text_rich_method(dynamic widget) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: " مرحبا بك  ",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff4B148B),
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: widget.profileEdit.name,
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff13D08C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

//sumbit button
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(8),
                        //   child: Container(
                        //     color: Color(0xff4B148B),
                        //     padding: EdgeInsets.symmetric(
                        //       horizontal: 10,
                        //       vertical: 5,
                        //     ),
                        //     child: Text(
                        //       "تحديث",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //   ),
                        // ),



//text field
// TextField(
//                     onChanged: (value) {
                      // widget.profileEdit.name = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: "الاسم",
//                       labelStyle: TextStyle(
//                         color: Color(0xff4B148B),
//                         fontSize: 18,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),