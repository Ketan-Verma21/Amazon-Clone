

import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'features/admin/screens/admin_screen.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider(),)
  ],
  child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService=AuthService();

  @override
  void initState() {

    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GV.backgroundColor,
        colorScheme:ColorScheme.light(
          primary: GV.secondaryColor
        ) ,
        appBarTheme:const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      onGenerateRoute:(settings)=>generateRoute(settings) ,
      home:
      Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type=="admin"
          ?const AdminScreen() :const BottomBar()
      :const AuthScreen(),
    );
  }
}

