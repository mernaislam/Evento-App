import 'package:evento_app/core/helpers/app_assets.dart';
import 'package:evento_app/features/home/ui/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ImageIcon(
          AssetImage(
            AppAssets.oliveLogo,
          ),
        ),
      ),
      body: const HomeScreenBody(),
    );
  }
}
