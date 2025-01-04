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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
