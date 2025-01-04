import 'package:flutter/material.dart';
import 'package:leatning_flutter/cart.dart';
import 'package:leatning_flutter/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leatning_flutter/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ChangeNotifierProvider(create: (context) => Cart(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    await Future.delayed(const Duration(seconds: 3));

    FlutterNativeSplash.remove();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, primary: Color.fromRGBO(195, 231, 3, 1)),
        textTheme: GoogleFonts.lexendDecaTextTheme(Theme.of(context).textTheme),
        // inputDecorationTheme: InputDecorationTheme(
        //   contentPadding: EdgeInsets.all(20),
        //   enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //       borderSide: BorderSide(color: Colors.green, width: 3)),
        //   focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //       borderSide: BorderSide(color: Colors.green, width: 3)),
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //       minimumSize: Size(double.infinity, 60),
        //       backgroundColor: Colors.black,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10))),
        // ),
      ),
      home: context.watch<Cart>().login ? HomePage() : LoginScreen(),
    );
  }
}
