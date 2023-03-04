import 'package:flutter_1/screens/login_screen.dart';
import 'package:flutter_1/widgets/card_Company.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
//import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardCompanyData(
      title: "Imaginamos",
      subtitle: "En BMW nos encargamos de imaginar hasta lo inimaginable.",
      image: const AssetImage("assets/imagine.png"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      titleColor: Colors.pink,
      subtitleColor: Color.fromARGB(255, 7, 0, 46),
      //background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardCompanyData(
      title: "inovamos",
      subtitle: "Y nunca paramos de buscar inovar nuestros productos.",
      image: const AssetImage("assets/innova.png"),
      backgroundColor: Color.fromARGB(255, 253, 212, 28),
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      //background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardCompanyData(
      title: "Conquistamos",
      subtitle: "Hasta que nosotros y nuestros clientes estemos en la cima.",
      image: const AssetImage("assets/conquist.png"),
      backgroundColor: Color.fromARGB(255, 7, 39, 75),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      //background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        Orientation.landscape;
        DeviceType.web;
        return Scaffold(
          body: ConcentricPageView(
            colors: data.map((e) => e.backgroundColor).toList(),
            itemCount: data.length,
            onFinish: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            itemBuilder: (int index) {
              return CardCompany(data: data[index]);
            },
          ),
        );
      },
    );
  }
}
