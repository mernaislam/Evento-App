import 'package:evento_app/core/helpers/app_assets.dart';
import 'package:evento_app/features/auth/ui/widgets/continue_with.dart';
import 'package:evento_app/features/auth/ui/widgets/login_form.dart';
import 'package:evento_app/features/auth/ui/widgets/third_party_container.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Center(
            child: Image.asset(
              AppAssets.logo,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            'Welcome Back!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 40),
          const LoginForm(),
          const SizedBox(height: 10),
          const ContinueWith(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThirdPartyContainer(
                onTap: () {},
                child: const Icon(
                  color: Colors.blue,
                  Icons.facebook,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ThirdPartyContainer(
                onTap: () {},
                child: Center(
                  child: Image.network(
                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                    height: 35,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign up',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
