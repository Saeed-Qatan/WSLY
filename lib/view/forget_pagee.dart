import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/view/login_pagee.dart';
import 'package:wsly/viewmodels/ForgetPasswordViewModel.dart';


class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ForgetPasswordViewModel>(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/register.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 250),
                const Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(
                      fontFamily: "NotoSansArabic",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff491383)),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: TextField(
                    controller: viewModel.emailController,
                    decoration: InputDecoration(
                      hintText: "البريد الالكتروني",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "NotoSansArabic",
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: const Color(0xfff1f3ff),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff491383), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: viewModel.clearFields,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                viewModel.isLoading
                    ? CircularProgressIndicator(color: Color(0xff491383))
                    : ElevatedButton(
                        onPressed: () async {
                          final success = await viewModel.sendResetEmail();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                success ? 'تم إرسال رابط التحقق إلى بريدك الإلكتروني' : 'يرجى إدخال بريد إلكتروني صحيح',
                              ),
                            ),
                          );
                          if (success) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff491383),
                          minimumSize: Size(330, 55),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text(
                          "ارسال",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 19,
                              fontFamily: "NotoSansArabic"),
                        ),
                      ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: const Text(
                    "رجوع",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        fontFamily: "NotoSansArabic"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
