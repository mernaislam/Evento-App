import 'package:evento_app/core/themes/app_themes.dart';
import 'package:evento_app/features/auth/ui/screens/signup_screen.dart';
// import 'package:evento_app/features/home/ui/screens/home_screen.dart';
// import 'package:evento_app/features/my_events/ui/screens/my_events_screen.dart';
import 'package:evento_app/features/create_event/ui/screens/create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: const CreateEventScreen(),
      ),
    );
  }
}
