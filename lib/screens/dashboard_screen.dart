import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/firebase/email_auth.dart';
import 'package:flutter_1/models/user_model.dart';
import 'package:flutter_1/provider/theme_provider.dart';
import 'package:flutter_1/screens/list_post.dart';
import 'package:flutter_1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;
  //Awesome awesome = Awesome();
  EmailAuth emailAuth = EmailAuth();
  UserModel datosUsuario = UserModel();
  final spaceHoriz = SizedBox(
    height: 7,
  );

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    if (ModalRoute.of(context)!.settings.arguments != null) {
      datosUsuario = ModalRoute.of(context)!.settings.arguments as UserModel;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios BMW'),
      ),
      body: ListPost(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "btn1",
            onPressed: () {
              Navigator.pushNamed(context, '/add').then((value) {
                setState(() {});
              });
            },
            label: const Text('Add post'),
            icon: const Icon(Icons.add_comment),
          ),
          spaceHoriz,
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () {
              Navigator.pushNamed(context, '/events').then((value) {
                setState(() {});
              });
            },
            label: const Text('Eventos'),
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  //backgroundImage: NetworkImage(datosUsuario!.photoUrl.toString()),
                  backgroundImage: NetworkImage(
                      'https://st3.depositphotos.com/1004920/12992/v/950/depositphotos_129925354-stock-illustration-head-of-lynx-isolated-on.jpg'),
                ),
                accountName: Text('Ricardo Estrada'),
                accountEmail: Text('your_email@gmail.com')),
            ListTile(
              onTap: () {},
              title: Text('Pago de servicios'),
              subtitle: Text('Desgloce de mis servicios'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/popular'),
              title: Text('API VIDEOS'),
              leading: Icon(Icons.movie),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/gif'),
              title: Text('GHIPS'),
              leading: Icon(Icons.gif_box_sharp),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
                onTap: () => Navigator.pushNamed(context, '/main'),
                title: Text('Cerrar sesion'),
                leading: Icon(Icons.logout)),
/*             ListTile(
              onTap: () {
                try {
                  awesome
                      .buildDialog(
                          context,
                          DialogType.infoReverse,
                          'Confirmar',
                          '¿Realmente desea cerrar sesion?',
                          '/login',
                          AnimType.bottomSlide,
                          true)
                      .show()
                      .then((value) {
                    print(value);
                  });
                } catch (e) {
                  print(e);
                }
              },
              title: const Text('Cerrar sesion'),
              leading: const Icon(Icons.logout),
            ), */
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setthemeData(StylesSettings.darkTheme(context))
                    : theme.setthemeData(StylesSettings.lightTheme(context));
                this.isDarkModeEnabled = isDarkModeEnabled;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
