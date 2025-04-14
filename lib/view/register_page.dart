// lib/view/register_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/view/login_pagee.dart';
import 'package:wsly/view/main-page.dart';
import 'package:wsly/viewmodels/RegisterViewModel.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  Widget buildTextField(
    String hint,
    TextEditingController controller, {
    bool obscure = false,
    VoidCallback? toggleVisibility,
    bool showToggle = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
          hintText: hint,
          suffixIcon: showToggle
              ? IconButton(
                  icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: toggleVisibility,
                )
              : null,
          hintStyle: TextStyle(
            color: Colors.grey[600],
            fontFamily: "NotoSansArabic",
            fontWeight: FontWeight.w500,
          ),
          fillColor: const Color(0xfff1f3ff),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff491383), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterViewModel>(context);

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    "انشاء حساب جديد",
                    style: TextStyle(
                      fontFamily: "NotoSansArabic",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff491383),
                    ),
                  ),
                  buildTextField("اسم المستخدم", viewModel.usernameController),
                  buildTextField("رقم الجوال", viewModel.phoneController, keyboardType: TextInputType.phone),
                  buildTextField("البريد الالكتروني", viewModel.emailController, keyboardType: TextInputType.emailAddress),
                  buildTextField("العنوان", viewModel.addressController),
                  buildTextField(
                    "كلمة المرور",
                    viewModel.passwordController,
                    obscure: !viewModel.isPasswordVisible,
                    toggleVisibility: viewModel.togglePasswordVisibility,
                    showToggle: true,
                  ),
                  buildTextField(
                    "تأكيد كلمة المرور",
                    viewModel.confirmPasswordController,
                    obscure: !viewModel.isConfirmPasswordVisible,
                    toggleVisibility: viewModel.toggleConfirmPasswordVisibility,
                    showToggle: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: viewModel.clearFields,
                        icon: Icon(Icons.clear_all),
                        label: Text("مسح الكل"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  viewModel.isLoading
                      ? CircularProgressIndicator(color: Color(0xff491383))
                      : ElevatedButton(
                          onPressed: () async {
                            final success = await viewModel.register();
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('تم التسجيل بنجاح')),
                              );
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainPage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('حدث خطأ أثناء التسجيل أو البيانات غير صحيحة')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff491383),
                            minimumSize: Size(330, 55),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            "تسجيل",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 19,
                              fontFamily: "NotoSansArabic",
                            ),
                          ),
                        ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: Text(
                      "لدي حساب في وصل لي مسبقاً",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        fontFamily: "NotoSansArabic",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
