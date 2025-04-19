import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xff4B148B),
                expandedHeight: 150.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(right: 16, bottom: 16),
                  title: const Text(
                    'الشروط والأحكام',
                    style: TextStyle(color: Colors.white),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff4B148B), Color(0xff7B1FA2)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildSectionTitle("مرحبًا بك في تطبيق وصل لي!"),
                    _buildText(
                        "يرجى قراءة هذه الشروط والأحكام بعناية قبل استخدام التطبيق. باستخدامك لتطبيق \"وصل لي\"، فإنك توافق على الالتزام بهذه الشروط."),
                    _buildSectionTitle("1. التعريفات"),
                    _buildText("• \"نحن\" أو \"وصل لي\": تشير إلى إدارة التطبيق.\n"
                        "• \"المستخدم\": هو من يستخدم التطبيق سواء عميل أو كابتن.\n"
                        "• \"الخدمة\": التوصيل، تتبع الطلبات، الدفع..."),
                    _buildSectionTitle("2. استخدام التطبيق"),
                    _buildText("• يجب أن يكون عمرك 18 سنة أو أكثر.\n"
                        "• تلتزم بتقديم معلومات صحيحة.\n"
                        "• يمنع الاستخدام لأي نشاط غير قانوني."),
                    _buildSectionTitle("3. حقوق وواجبات المستخدم"),
                    _buildText("• الحفاظ على سرية معلومات الدخول.\n"
                        "• مسؤول عن كل ما يتم عبر حسابك.\n"
                        "• الإبلاغ الفوري عن أي استخدام غير مصرح."),
                    _buildSectionTitle("4. سياسة التوصيل والدفع"),
                    _buildText("• يتم تحديد التكلفة حسب الموقع والمسافة.\n"
                        "• الدفع متاح إلكترونيًا أو عند الاستلام.\n"
                        "• لسنا مسؤولين عن التأخيرات الخارجة عن إرادتنا."),
                    _buildSectionTitle("5. الإلغاء والاسترداد"),
                    _buildText("• يمكن إلغاء الطلب قبل قبوله دون رسوم.\n"
                        "• بعد قبول الكابتن، قد يتم خصم رسوم.\n"
                        "• في حال وجود مشكلة، راجعنا خلال 48 ساعة."),
                    _buildSectionTitle("6. تعديل الشروط"),
                    _buildText("• نحتفظ بحق تعديل الشروط في أي وقت.\n"
                        "• استخدامك المستمر يعد قبولًا للتعديلات."),
                    _buildSectionTitle("7. سياسة الخصوصية"),
                    _buildText("• نلتزم بحماية معلوماتك.\n"
                        "• لمزيد من التفاصيل راجع سياسة الخصوصية."),
                    _buildSectionTitle("8. التواصل معنا"),
                    _buildText("• البريد الإلكتروني: support@wsly.app\n"
                        "• الهاتف: +966-XXX-XXX-XXX\n"
                        "• أو عبر صفحة اتصل بنا بالتطبيق."),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'باستخدامك للتطبيق، أنت تقر بأنك قرأت الشروط وتوافق عليها.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff4B148B),
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }
}
