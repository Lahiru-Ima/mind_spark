import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mind_spark/src/features/authentication/screens/account_type_screen.dart';
import 'package:mind_spark/src/features/authentication/Services/auth_service.dart';
import 'package:mind_spark/src/features/welcome_screen/welcome_screen.dart';
import 'package:mind_spark/src/utils/theme/theme.dart';
import 'src/features/authentication/models/user_model.dart';
import 'src/features/authentication/screens/login/sign_in_screen.dart';
import 'src/routing/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthServices().user,
      initialData: UserModel(uid: ""),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/account_type_screen': (context) => const AccountTypeScreen(),
          '/sign_in_screen': (context) => const SignInScreen(),
        },
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
