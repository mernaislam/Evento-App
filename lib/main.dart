import 'package:evento_app/core/themes/app_themes.dart';
import 'package:evento_app/features/auth/ui/screens/signup_screen.dart';
import 'package:evento_app/features/fcm_notifications/logic/firebase_api.dart';
import 'package:evento_app/firebase_options.dart';
import 'package:evento_app/features/event_details/ui/screens/event_details_screen.dart';
import 'package:evento_app/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const ProviderScope(child: EventoApp()));
}

class EventoApp extends StatelessWidget {
  const EventoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evento App',
        themeMode: ThemeMode.system,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        navigatorKey: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final  routeName = settings.name?.endsWith(EventDetailsScreen.routeName) ==true? EventDetailsScreen.routeName :settings.name; 
          switch(routeName){
            case EventDetailsScreen.routeName:
              return MaterialPageRoute(builder: (context) => const EventDetailsScreen(),);
            // TODO: handle unknown routes
            default: 
              return MaterialPageRoute(builder: (context) => const HomeScreen(),);
          }
        },
        home: const SignupScreen(),
      ),
    );
  }
}
