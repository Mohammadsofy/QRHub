import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(
      title: 'QR Hub',
      home: CheckerboardBackground()));
}

class CheckerboardBackground extends StatefulWidget {
  @override
  State<CheckerboardBackground> createState() => _CheckerboardBackgroundState();
}

class _CheckerboardBackgroundState extends State<CheckerboardBackground> {
  final String instagramurl='https://www.instagram.com/m_sofyan_m/';
  Future<void> _instagram() async {
    final url = Uri.parse(instagramurl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  bool lang=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (Checkerboard)
          CustomPaint(
            painter: CheckerboardPainter(),
            child: Container(), // نحتاج Container هنا ليأخذ مساحة الشاشة
          ),

          // المحتوى فوق الخلفية
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),)]),
                // لون شفاف ليظهر الخلفية
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.brown,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(

                        child: Transform.translate(
                          offset: Offset(0,3),
                          child:
                          Image.asset('image/hub.jpg',
                            width: 100,
                            height: 100,
                            fit:BoxFit.cover
                            ,),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Color(0xFF7B2F2F),thickness: 2,),
                    SizedBox(height: 20),
                    Directionality(
                      textDirection: lang?TextDirection.ltr:TextDirection.rtl,
                      child: Text(
                        lang?"At QR Hub, we specialize in creating modern and interactive QR code solutions tailored for restaurants,cafés, and shops.Our main service is designing digital menus that are easy to access through a simple QR code scan.":
                        "في QR Hub، نحن متخصصون في إنشاء حلول حديثة وتفاعلية لرموز QR مصممة خصيصًا للمطاعم والمقاهي والمتاجر. خدمتنا الرئيسية هي تصميم قوائم رقمية يسهل الوصول إليها من خلال مسح رمز QR بسيط.",
                        style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                    ),
                    SizedBox(height: 20),
                    Directionality(
                      textDirection: lang?TextDirection.ltr:TextDirection.rtl,
                      child: Text(lang?
                      "Instead of printing traditional menus, your customers can instantly view a stylish and customized menu on their phones.This makes your business more professional, eco-friendly, and convenient while reducing printing costs.":
                        "بدلاً من طباعة القوائم التقليدية، يمكن لعملائك عرض قائمة أنيقة ومخصصة على هواتفهم على الفور. وهذا يجعل عملك أكثر احترافية وصديقًا للبيئة ومريحًا مع تقليل تكاليف الطباعة.",
                        style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                    ),
                    SizedBox(height: 20),
                    Directionality(
                      textDirection: lang?TextDirection.ltr:TextDirection.rtl,

                      child: Text(
                        lang?"We design QR codes and digital menus that match your brand identity whether for food menus, product catalogs, or service lists.With QR Hub, you can offer your customers a smooth, modern, and engaging experience.":
                        " نصمم رموز QR وقوائم رقمية تتناسب مع هوية علامتك التجارية سواء كانت قوائم طعام أو كتالوجات منتجات أو قوائم خدمات. مع QR Hub، يمكنك أن تقدم لعملائك تجربة سلسة وحديثة وجذابة.",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Color(0xFF7B2F2F),thickness: 2,),
                    SizedBox(height: 20),
                    Icon(FontAwesomeIcons.instagram,color: Colors.deepPurple,size: 30,),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7B2F2F),
                shape: CircleBorder(),
                minimumSize: Size(50, 50),
              ),
              onPressed: () {
                setState(() {
                  lang = !lang;
                });
              },
              child: Text(
                lang ? 'en':'ar'  ,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckerboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Colors.black;
    final paint2 = Paint()..color = Color(0xFF7B2F2F); // بني غامق

    double squareSize = 40; // حجم المربعات
    int rows = (size.height / squareSize).ceil();
    int cols = (size.width / squareSize).ceil();

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        bool isBlack = (i + j) % 2 == 0;
        canvas.drawRect(
          Rect.fromLTWH(j * squareSize, i * squareSize, squareSize, squareSize),
          isBlack ? paint1 : paint2,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}




class WaveText extends StatefulWidget {
  const WaveText({super.key});

  @override
  State<WaveText> createState() => _WaveTextState();
}

class _WaveTextState extends State<WaveText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final String text = "qrhup";

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true); // يكرر الحركة
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(text.length, (index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // نعمل تأخير لكل حرف
                double delay = index * 0.2;
                double value =
                    (sin((_controller.value * 2 * 3.14) + delay) + 1) / 2;

                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, -10 * value), // حركة لفوق وتحت
                    child: Text(
                      text[index],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
