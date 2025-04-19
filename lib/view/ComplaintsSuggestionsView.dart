import 'package:flutter/material.dart';

class ComplaintsSuggestionsView extends StatefulWidget {
  const ComplaintsSuggestionsView({super.key});

  @override
  State<ComplaintsSuggestionsView> createState() =>
      _ComplaintsSuggestionsViewState();
}

class _ComplaintsSuggestionsViewState
    extends State<ComplaintsSuggestionsView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isSending = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSending = true);

      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم إرسال الشكوى/الاقتراح بنجاح!'),
            backgroundColor: Colors.green,
          ),
        );
        _nameController.clear();
        _phoneController.clear();
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          backgroundColor: const Color(0xff4B148B),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "الشكاوى والاقتراحات",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'نسعد بسماع ملاحظاتك أو اقتراحاتك، وسيتم الرد عليك بأسرع وقت ممكن.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                _buildInputField(
                  controller: _nameController,
                  label: 'الاسم الكامل',
                  icon: Icons.person_outline,
                  validator:
                      (value) => value!.isEmpty ? 'يرجى إدخال الاسم' : null,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  controller: _phoneController,
                  label: 'رقم الجوال',
                  icon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty || value.length < 9
                      ? 'يرجى إدخال رقم صحيح'
                      : null,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  controller: _messageController,
                  label: 'الرسالة أو الشكوى',
                  icon: Icons.edit_note_outlined,
                  maxLines: 5,
                  validator: (value) =>
                      value!.isEmpty ? 'يرجى كتابة الرسالة' : null,
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4B148B),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: _isSending
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Icon(Icons.send),
                      label: Text(
                        _isSending ? 'جاري الإرسال...' : 'إرسال',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: _isSending ? null : _submitForm,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xff4B148B)),
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
