import 'package:flutter_1/screens/login_screen.dart';
import 'package:flutter_1/widgets/card_Company.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardCompanyData(
      title: "Imaginamos",
      subtitle: "En BMW nos encargamos de imaginar hasta lo inimaginable.",
      image: const AssetImage("assets/imagine.png"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      titleColor: Colors.pink,
      subtitleColor: Color.fromARGB(255, 0, 0, 0),
      background:
          LottieBuilder.asset("assets/40912-new-year-loop-background.json"),
    ),
    CardCompanyData(
      title: "inovamos",
      subtitle: "Innovamos nuestras ideas y nunca paramos de inovar.",
      image: const AssetImage("assets/innova.png"),
      backgroundColor: Color.fromARGB(255, 253, 212, 28),
      titleColor: Color.fromARGB(255, 0, 0, 0),
      subtitleColor: Color.fromARGB(255, 255, 255, 255),
      background:
          LottieBuilder.asset("assets/40912-new-year-loop-background.json"),
    ),
    CardCompanyData(
      title: "Conservamos",
      subtitle:
          "Ninguno de nuestros procesos afecta ni altera al medio ambiente.",
      image: const AssetImage("assets/arbol.png"),
      backgroundColor: Color.fromARGB(255, 12, 168, 25),
      titleColor: Color.fromARGB(255, 5, 18, 88),
      subtitleColor: Colors.white,
      background:
          LottieBuilder.asset("assets/40912-new-year-loop-background.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        Orientation.landscape;
        DeviceType.mobile;
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
