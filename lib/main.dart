import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsly/data/services/auth_service.dart';
import 'package:wsly/view/splash_page.dart';
import 'package:wsly/viewmodels/ForgetPasswordViewModel.dart';
import 'package:wsly/viewmodels/RegisterViewModel.dart';
import 'package:wsly/viewmodels/camera_view_model.dart';
import 'package:wsly/viewmodels/current_order_viewmodel.dart';
import 'package:wsly/viewmodels/date_time_view_model.dart';
import 'package:wsly/viewmodels/delete_account_view_model.dart';
import 'package:wsly/viewmodels/login_view_model.dart';
import 'package:wsly/viewmodels/logout_viewmodel.dart';
import 'package:wsly/viewmodels/order_registry_viewmodel.dart';
import 'package:camera/camera.dart';
import 'package:wsly/viewmodels/order_view_model.dart';
import 'package:wsly/viewmodels/upload_view_model.dart';



List<CameraDescription> cameras = [];
Future<Null> main() async {

  cameras= await availableCameras();
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

      
        ChangeNotifierProvider<DeleteAccountViewModel>(
          create:
              (context) =>
                  DeleteAccountViewModel(context.read<AuthService>(), userId),
        ),

        ChangeNotifierProvider(create: (_) => DateTimeViewModel()),
       // ChangeNotifierProvider(create: (_) => CameraViewModel()),
       // ChangeNotifierProvider(create: (_) => UploadViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
         ChangeNotifierProvider(create: (_) => LogoutViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => OrderViewModel()),

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
