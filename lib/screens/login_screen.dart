import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../widgets/loading_modal_widget.dart';
import 'package:flutter_1/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final imglogo = Image.asset(
    'assets/bmw.png',
    height: 20.0.h,
  );

  final tittle = Text(
    'LOGIN',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 40.0.sp),
  );

  final txtEmail = TextFormField(
    validator: (value) => value!.isEmpty ? "Correo requerido" : null,
    decoration: InputDecoration(
      labelText: "Email",
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Colors.white,
      ),
    ),
  );

  final txtPass = TextFormField(
    validator: (value) => value!.isEmpty ? "Correo requerido" : null,
    decoration: InputDecoration(
      labelText: "New password",
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.white,
      ),
    ),
  );

  final spaceHoriz = SizedBox(
    height: 2.h,
  );

  final btnFB = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook,
    height: 7.h,
    onPressed: () {},
  );

  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    height: 7.h,
    onPressed: () {},
  );

  final btnGit = SocialLoginButton(
    buttonType: SocialLoginButtonType.github,
    height: 7.h,
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    final btnSigIn = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      height: 7.h,
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(milliseconds: 4000)).then((value) {
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context, '/dash');
        });
      },
    );

    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Crear nueva cuenta',
            style: TextStyle(
                fontSize: 17.sp, decoration: TextDecoration.underline),
          )),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.72,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/Portada.jpeg'))),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      spaceHoriz,
                      tittle,
                      spaceHoriz,
                      txtEmail,
                      spaceHoriz,
                      txtPass,
                      spaceHoriz,
                      btnSigIn,
                      spaceHoriz,
                      btnFB,
                      spaceHoriz,
                      btnGoogle,
                      spaceHoriz,
                      btnGit,
                      spaceHoriz,
                      txtRegister
                    ],
                  ),
                  /*Positioned(
                    child: imglogo,
                    top: 140,
                  )*/
                ],
              ),
            ),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}
