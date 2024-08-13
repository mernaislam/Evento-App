import 'package:evento_app/core/helpers/app_auth.dart';
import 'package:evento_app/core/helpers/form_rules.dart';
import 'package:evento_app/core/helpers/functions.dart';
import 'package:evento_app/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:evento_app/features/auth/ui/widgets/form_button.dart';
import 'package:evento_app/features/event_details/ui/screens/event_details_screen.dart';
import 'package:evento_app/features/create_event/ui/screens/create_event_screen.dart';
// import 'package:evento_app/features/event_details/ui/screens/event_details_screen.dart';
import 'package:evento_app/features/my_events/ui/screens/my_events_screen.dart';
// import 'package:evento_app/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _isloading = false;
  IconData _passwordIcon = Icons.visibility_off;
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String _email;
  late String _password;

  void _signin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      _formKey.currentState!.save();
      String msg = await AppAuth.userSignIn(_email, _password);
      if (msg != 'Success' && context.mounted) {
        showSnackBar(msg, context);
      } else if (context.mounted) {
        // TODO: push home screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyEventsScreen(),
          ),
        );
      }
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            prefixIcon: Icons.email_rounded,
            validator: (val) {
              return FormRules.emailValidator(val);
            },
            onSaved: (val) {
              _email = val!;
            },
          ),
          CustomTextFormField(
            obscureText: _obscureText,
            hintText: 'Password',
            prefixIcon: Icons.lock_rounded,
            suffixIcon: IconButton(
              icon: Icon(_passwordIcon),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                  _passwordIcon =
                      _obscureText ? Icons.visibility_off : Icons.visibility;
                });
              },
            ),
            validator: (val) {
              return FormRules.passwordValidator(val);
            },
            onSaved: (val) {
              _password = val!;
            },
          ),
          FormButton(
            onPressed: () {
              _signin(context);
            },
            text: 'Sign In',
            isLoading: _isloading,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
