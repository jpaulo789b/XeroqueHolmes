import 'package:flutter/material.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:fluttergit/controllers/navigator_controller.dart';
import 'package:fluttergit/fabrica_get_it.dart';
import 'package:fluttergit/screens/tela_home.dart';
import 'package:fluttergit/screens/tela_splash.dart';
import 'package:fluttergit/screens/tela_visualizar_usuario.dart';
import 'package:fluttergit/style/themes.dart';
import 'package:fluttergit/util/cupertino_localizations_delegate.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await iniciarGetit(getIt);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    var window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      GetIt.I.get<ControladorApp>().themeMode =  window.platformBrightness == Brightness.light ?  ThemeMode.light:ThemeMode.dark;
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemesApp.ligthTheme(context),
      darkTheme: ThemesApp.darkTheme(context),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const {
        BrasilCupertinoLocalizations.delegate,
      },
      locale: const Locale.fromSubtags(languageCode: 'BR'),
      navigatorKey: GetIt.I.get<NavigatorController>().navigatorKey,
      routes: {
        "/telaSplash": (_) => const TelaSplash(),
        "/telaPerfilUsuario":(_) => const TelaVisualizarUsuario(),
        "/telaHome": (_) => const TelaHome(),
      },
      initialRoute: "/telaSplash",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
