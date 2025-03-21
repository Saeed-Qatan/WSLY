import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsly/data/services/auth_service.dart';
import 'package:wsly/view/main-page.dart';
import 'package:wsly/view/splash_page.dart';
import 'package:wsly/viewmodels/assinged_orders_viewmodel.dart';
import 'package:wsly/viewmodels/current_order_viewmodel.dart';
import 'package:wsly/viewmodels/delete_account_view_model.dart';
import 'package:wsly/viewmodels/logout_viewmodel.dart';
import 'package:wsly/viewmodels/order_registry_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authService = AuthService();
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt("user_id") ?? 0;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentOrderViewmodel()),
        ChangeNotifierProvider(create: (_) => OrderRegistryViewmodel()),

        Provider<AuthService>(create: (_) => AuthService()),

        ChangeNotifierProvider<LogoutViewModel>(
          create: (context) => LogoutViewModel(context.read<AuthService>()),
        ),

        ChangeNotifierProvider<DeleteAccountViewModel>(
          create:
              (context) =>
                  DeleteAccountViewModel(context.read<AuthService>(), userId),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
