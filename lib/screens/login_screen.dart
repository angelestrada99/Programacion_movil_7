import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/firebase/email_auth.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:sizer/sizer.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../provider/tema_provider.dart';
import '../provider/theme_provider.dart';
import '../responsive.dart';
import '../settings/styles_settings.dart';
import '../widgets/loading_modal_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final temaController = Get.put(TemaProvider());
  bool isDarkModeEnabled = false;
  bool isLoading = false;
  EmailAuth emailAuth = EmailAuth();
  TextEditingController? txtemailCont = TextEditingController();
  TextEditingController? txtPassController = TextEditingController();

  final imglogo = Image.asset(
    'assets/bmw.png',
    height: 100,
  );

  final imglogo2 = Image.asset(
    'assets/Partners.png',
    height: 500,
  );

  final tittle = const Text(
    'LOGIN',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 40),
  );

  final spaceHoriz = const SizedBox(
    height: 10,
  );

  final btnFB = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook,
    height: 52,
    onPressed: () {},
  );

  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    height: 52,
    onPressed: () {},
  );

  final btnGit = SocialLoginButton(
    buttonType: SocialLoginButtonType.github,
    height: 52,
    onPressed: () {},
  );

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    final txtEmail = TextFormField(
      validator: (value) => value!.isEmpty ? "Correo requerido" : null,
      controller: txtemailCont,
      decoration: const InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.white,
        ),
      ),
    );

    final txtPass = TextFormField(
      validator: (value) => value!.isEmpty ? "Correo requerido" : null,
      controller: txtPassController,
      decoration: const InputDecoration(
        labelText: "New password",
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
        prefixIcon: Icon(
          Icons.password_outlined,
          color: Colors.white,
        ),
      ),
    );
    final btnSigIn = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      height: 52,
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 4000)).then((value) {
          /*emailAuth!
            .signInWithEmailAndPassword(
                email: txtemailCont!.text, password: txtPassController!.text)
            .then((value) {
          if (value) {
            Navigator.pushNamed(context, '/dash');
            isLoading=false;
          } else {
            isLoading=false;
            const SnackBar(content: Text('Error de logeo'));
          }*/
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
                TextStyle(fontSize: 22, decoration: TextDecoration.underline),
          )),
    );
    final txtTheme = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/preferencestTheme');
          },
          child: const Text(
            'Tema',
            style:
                TextStyle(fontSize: 22, decoration: TextDecoration.underline),
          )),
    );
    //RETORNO DE ELEMENTOS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    return Responsive(
      //MOVIL
      mobile: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .6,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/Portada.jpeg'))),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        imglogo,
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
                        txtRegister,
                        spaceHoriz,
                        DayNightSwitcher(
                          isDarkModeEnabled: isDarkModeEnabled,
                          onStateChanged: (isDarkModeEnabled) {
                            isDarkModeEnabled
                                ? theme.setthemeData(
                                    StylesSettings.darkTheme(context))
                                : theme.setthemeData(
                                    StylesSettings.lightTheme(context));
                            this.isDarkModeEnabled = isDarkModeEnabled;
                            setState(() {});
                          },
                        ),
                        txtTheme,
                        spaceHoriz,
                      ],
                    ),
                    //Positioned(top:100, child: imglogo)
                  ],
                ),
              ),
            ),
            isLoading ? const LoadingModalWidget() : Container()
          ],
        ),
      ),
      //TABLETA
      tablet: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .6,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/FondoTablet.jpg'))),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            imglogo,
                          ],
                        )),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              txtRegister,
                              spaceHoriz,
                              DayNightSwitcher(
                                isDarkModeEnabled: isDarkModeEnabled,
                                onStateChanged: (isDarkModeEnabled) {
                                  isDarkModeEnabled
                                      ? theme.setthemeData(
                                          StylesSettings.darkTheme(context))
                                      : theme.setthemeData(
                                          StylesSettings.lightTheme(context));
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                  setState(() {});
                                },
                              ),
                              txtTheme,
                              spaceHoriz,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isLoading ? const LoadingModalWidget() : Container()
          ],
        ),
      ),
      //ESCRITORIO
      desktop: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .6,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/FondoDesktop.jpg'))),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            imglogo,
                          ],
                        )),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              txtRegister,
                              spaceHoriz,
                              DayNightSwitcher(
                                isDarkModeEnabled: isDarkModeEnabled,
                                onStateChanged: (isDarkModeEnabled) {
                                  isDarkModeEnabled
                                      ? theme.setthemeData(
                                          StylesSettings.darkTheme(context))
                                      : theme.setthemeData(
                                          StylesSettings.lightTheme(context));
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                  setState(() {});
                                },
                              ),
                              txtTheme,
                              spaceHoriz,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isLoading ? const LoadingModalWidget() : Container()
          ],
        ),
      ),
    );
  }
}
