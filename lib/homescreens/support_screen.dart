import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'دعم المستخدم',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 21, 128, 158),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحباً بك في صفحة الدعم',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 128, 158),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'إذا كان لديك أي استفسارات أو تحتاج إلى مساعدة، تواصل معنا عبر الطرق التالية:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 30),
              _buildContactOption('Email:', 'aviationconsultant2030@gmail.com'),
              SizedBox(height: 10),
              _buildContactOption('Tiktok:', '@aviconsultant'),
              SizedBox(height: 10),
              _buildContactOption('Whatsapp:', 'قريباً'),
              SizedBox(height: 40),
              Text(
                'أسئلة شائعة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 128, 158),
                ),
              ),
              SizedBox(height: 10),
              _buildFAQItem(
                'هل دراسة الطيران معتمدة؟',
                'نعم، معتمدة ويتم معادلة رخصة الطيران التجاري الأمريكية من هيئة الطيران المدني.',
              ),
              _buildFAQItem(
                'ما هي تكلفة دراسة الطيران؟',
                'تختلف تكلفة دراسة الطيران حسب الأكاديمية، وتبدأ من 140 ألف ريال سعودي بدون السكن.',
              ),
              _buildFAQItem(
                'هل يوجد رسوم لإستخدام تطبيق مستشار الطيران؟',
                'التطبيق مجاني بالكامل ويمكن إستخدامه بدون رسوم',
              ),
              _buildFAQItem(
                'ما هي المدة المتوقعة لدراسة الطيران؟',
                'تختلف المدة وفقاً لمهارات الطالب في اللغة الإنجليزية، فمثلاً إذا كان مستوى الطالب مبتدئ فمن الممكن أن تكون مدة دراسة اللغة الإنجليزية 6 أشهر وتزيد أو تقل المدة حسب إستيعاب الطالب، ومدة دراسة الطيران العملي 12 شهر، أما في حالة وصول الطالب للمستوى المتقدم فتكون المدة 12 شهر أو أقل لدراسة الطيران العملي والحصول على الرخصة التجارية',
              ),
              _buildFAQItem(
                'هل يشترط جنسية محددة لدراسة الطيران؟',
                'دراسة الطيران متاحة لجميع الجنسيات',
              ),
              _buildFAQItem(
                'ما الذي أفعله إذا تم رفضي من مقابلة السفارة؟',
                'في حال وجود سبب سابق للرفض يمكنك مراجعة السبب إذا يمكن تعديله أم لا، أما في حالة الرفض بسبب الهجرة أو بدون سبب، فيمكنك إعادة التقديم بعد 20 يوم على الأقل لإجتياز المقابلة',
              ),
              _buildFAQItem(
                'هل يوجد سكن في موقع أكاديمية الدراسة في أمريكا؟',
                'نعم يوجد سكن تابع للأكاديمية وتختلف تكلفته حسب الولاية موقع الدراسة وهي من 800 إلى 1100 دولار أمريكي شهرياً',
              ),
              _buildFAQItem(
                'هل دراسة الطيران العملي متاحة للإناث والذكور؟',
                'نعم دراسة الطيران متاحة للجنسين ويمكن التقديم بعد ذلك للحصول على فرصة للعمل في شركات الطيران بعد معادلة الرخصة',
              ),
               _buildFAQItem(
                'ما هو العمر المناسب لدراسة الطيران؟',
                'كحد أدني من 17 سنة ولا يوجد حد أقصى للعمر، ولكن معظم شركات الطيران تفضل توظيف العمر الأقل، لذلك من الممكن قول أن العمر المناسب لدراسة الطيران والحصول على وظيفة من 17 إلى 27 عام',
              ),
              _buildFAQItem(
                'هل يوجد توظيف بعد الدراسة؟',
                'بعد الحصول على الرخصة التجارية ومعادلتها من هيئة الطيران تكون بذلك استوفيت الشروط المطلوبة للتقديم في شركات الطيران وإجراء المقابلة الشخصية',
              ),
              _buildFAQItem(
                'أصدرت القبول ودقعت السيفيز،هل يمكنني تغيير الأكاديمية؟',
                'في هذه الحالة سيتم دفع رسوم القبول من جديد للأكاديمية الجديدة وبعدها تقوم بعمل تحويل للسيفيز على القبول الجديد',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
