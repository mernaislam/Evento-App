import 'package:evento_app/core/helpers/form_rules.dart';
import 'package:evento_app/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  IconData _passwordIcon = Icons.visibility_off;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _signin() {
    if (!_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
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
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _signin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                elevation: 5,
                shadowColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Sign In',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
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
