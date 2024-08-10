import 'dart:io';

import 'package:evento_app/core/helpers/app_auth.dart';
import 'package:evento_app/core/helpers/firebase_manager.dart';
import 'package:evento_app/core/helpers/form_rules.dart';
import 'package:evento_app/core/helpers/functions.dart';
import 'package:evento_app/features/auth/logic/image_provider.dart';
import 'package:evento_app/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:evento_app/features/auth/ui/widgets/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  bool _obscureText = true;
  bool _isloading = false;
  IconData _passwordIcon = Icons.visibility_off;
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String _fullName;
  late String _email;
  late String _password;
  late String _imageUrl;
  File? _imageFile;
  String? emailInUse;

  void _signup() async {
    setState(() {
      _isloading = true;
    });
    _imageFile = ref.read(imageProvider);
    if (_imageFile == null) {
      showSnackBar('You must upload an image first', context);
      setState(() {
        _isloading = false;
      });
      return;
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String error = await AppAuth.registerUser(_email, _password);
      if (error != '') {
        // indicates that an error is catched
        setState(() {
          emailInUse = error;
          _formKey.currentState!.validate();
          _isloading = false;
        });
        setState(() {
          emailInUse = null;
        });
        return;
      }
      _imageUrl = await FirebaseManager.uploadImageToFirebase(_imageFile);
      await FirebaseManager.postUserToFirestore(_fullName, _email, _imageUrl);
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Full Name',
            prefixIcon: Icons.person,
            validator: (val) {
              return FormRules.nameValidator(val);
            },
            onSaved: (val) {
              _fullName = val!;
            },
          ),
          CustomTextFormField(
            hintText: 'Email',
            prefixIcon: Icons.email_rounded,
            validator: (val) {
              if (emailInUse != null) return emailInUse;
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
            onPressed: _signup,
            text: 'Sign Up',
            isLoading: _isloading,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
