import 'package:evento_app/core/helpers/app_assets.dart';
import 'package:evento_app/features/auth/ui/widgets/signup_screen_body.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Image.asset(
            AppAssets.logo,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: const SignupScreenBody(),
    );
  }
}
