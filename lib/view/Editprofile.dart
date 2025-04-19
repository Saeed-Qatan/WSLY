import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/viewmodels/ProfileEditViewModel.dart';
import 'package:wsly/widgets/wavaclipper_profile_widget.dart';
import 'package:wsly/widgets/waveclipper_widget.dart'; // تأكد من إضافة هذه المكتبة في pubspec.yaml

class EditProfileView extends StatefulWidget {
  final ProfileEdit initialProfile;

  const EditProfileView({super.key, required this.initialProfile});

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _numberController;
  late TextEditingController _addressController;
  late TextEditingController _carPlateController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialProfile.name);
    _emailController = TextEditingController(text: widget.initialProfile.email);
    _numberController = TextEditingController(
      text: widget.initialProfile.number,
    );
    _addressController = TextEditingController(
      text: widget.initialProfile.address,
    );
    _carPlateController = TextEditingController(
      text: widget.initialProfile.carPlate,
    );
    _passwordController = TextEditingController(
      text: widget.initialProfile.password,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _addressController.dispose();
    _carPlateController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => EditProfileViewModel()..setInitialData(widget.initialProfile),
      child: Scaffold(
        body: Column(
          children: [
            // Waveclipper Widget بدلًا من AppBar
            WaveclipperProfileWidget(),
            Expanded(
              child: Consumer<EditProfileViewModel>(
                builder: (context, viewModel, _) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: const Text(
                            "بيانات الكابتن",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4B148B),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          label: "اسم الكابتن",
                          controller: _nameController,
                          onChanged: viewModel.updateName,
                          keyboardType: TextInputType.name,
                        ),
                        _buildTextField(
                          label: "إيميل الكابتن",
                          controller: _emailController,
                          onChanged: viewModel.updateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        _buildTextField(
                          label: "رقم الكابتن",
                          controller: _numberController,
                          onChanged: viewModel.updateNumber,
                          keyboardType: TextInputType.phone,
                        ),
                        _buildTextField(
                          label: "عنوان الكابتن",
                          controller: _addressController,
                          onChanged: viewModel.updateAddress,
                          keyboardType: TextInputType.streetAddress,
                        ),
                        _buildTextField(
                          label: "لوحة السيارة",
                          controller: _carPlateController,
                          onChanged: viewModel.updateCarPlate,
                          keyboardType: TextInputType.text,
                        ),
                        _buildTextField(
                          label: "كلمة المرور",
                          controller: _passwordController,
                          onChanged: viewModel.updatePassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          icon: Icons.lock,
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff4B148B),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadowColor: Colors.black.withOpacity(0.3),
                                elevation: 8,
                              ),
                              onPressed: () async {
                                final success = await viewModel.submitProfile();
                                final snackBar = SnackBar(
                                  content: Text(
                                    success
                                        ? 'تم تحديث الملف بنجاح'
                                        : 'فشل التحديث',
                                  ),
                                  backgroundColor:
                                      success ? Colors.green : Colors.red,
                                );
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(snackBar);
                              },
                              child: const Text(
                                "تحديث",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required ValueChanged<String> onChanged,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff4B148B),
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                prefixIcon:
                    icon != null
                        ? Icon(icon, color: const Color(0xff4B148B))
                        : null,
                filled: true,
                fillColor: const Color.fromARGB(255, 245, 245, 245),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xff4B148B),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xff4B148B),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xff4B148B),
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
