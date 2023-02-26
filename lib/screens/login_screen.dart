import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../widgets/loading_modal_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final imglogo = Image.asset(
    'assets/bmw.png',
    height: 90,
  );

  final tittle = const Text(
    'LOGIN',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 50),
  );

  final txtEmail = TextFormField(
    validator: (value) => value!.isEmpty ? "Correo requerido" : null,
    decoration: const InputDecoration(
      labelText: "Email",
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Colors.white,
      ),
    ),
  );

  final txtPass = TextFormField(
    validator: (value) => value!.isEmpty ? "Correo requerido" : null,
    decoration: const InputDecoration(
      labelText: "New password",
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.white,
      ),
    ),
  );

  final spaceHoriz = const SizedBox(
    height: 10,
  );

  final btnFB = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook,
    onPressed: () {},
  );

  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    onPressed: () {},
  );

  final btnGit = SocialLoginButton(
    buttonType: SocialLoginButtonType.github,
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    final btnSigIn = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
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
          child: const Text(
            'Crear nueva cuenta',
            style:
                TextStyle(fontSize: 17, decoration: TextDecoration.underline),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                  Positioned(
                    child: imglogo,
                    top: 140,
                  )
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
