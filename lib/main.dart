import 'package:flutter/material.dart';
// import 'package:flutter_maps_component/flutter_maps_component.dart';
import 'package:login_package/login_package.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //showPerformanceOverlay: true,
      title: 'Material App',
      home: LoginWidgetPage(),
    );
  }
}

class LoginWidgetPage extends StatelessWidget {
  const LoginWidgetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginWidget(      
      urlDomain: 'https://apidevseguridad.tiii.mx/api/v1/',
      idAplication: '34',
      widgetTop: Text('login'),
      widgetBottom: const Text('correo'),
      onError: (String e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e)));
        // log(e);
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return const AlertDialog(
        //       content: SizedBox(
        //         child: Text('error'),
        //       ),
        //     );
        //   },
        // );
      },
      onSuccesFull: (UserModel user) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login correcto")));
        print(user.photoModel?.imagen);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(title: const Text('home')
                  ),
                  // body: MapWidget(apiKey:'AIzaSyA1hCoOK7W_MiYAQthUVV0bUtXUY0nEMEo' ),
                  )),
        );
      },
      titleApp: 'Componentes',
      styleTitleApp: null,
      buttonPrincipalHeight: 60,
      buttonPrincipalWidth: 200,
      decorationButton: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      decorationCenterButton: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      buttonWidthCenter: 200,
      buttonHeightCenter: 80,
    );
  }
}
