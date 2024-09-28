import 'package:evento_app/features/auth/ui/screens/login_screen.dart';
import 'package:evento_app/features/auth/ui/widgets/continue_with.dart';
import 'package:evento_app/features/auth/ui/widgets/image_upload.dart';
import 'package:evento_app/features/auth/ui/widgets/signup_form.dart';
import 'package:evento_app/features/auth/ui/widgets/third_party_container.dart';
import 'package:flutter/material.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const ImageUpload(),
          const SizedBox(height: 30),
          Text(
            'Create New Account',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 30),
          const SignupForm(),
          const SizedBox(height: 10),
          const ContinueWith(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: Implement Facebook signup
              ThirdPartyContainer(
                onTap: () {},
                child: const Icon(
                  color: Colors.blue,
                  Icons.facebook,
                  size: 30,
                ),
              ),
              const SizedBox(width: 20),
              // TODO: Implement Google signup
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Sign In',
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
