import 'package:budo_app/features/authentication/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthViewModel model = AuthViewModel();
    final _formKey = model.formKey;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Login', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.titleLarge,
                  validator: (currentValue) {
                    if (currentValue == null || currentValue.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: model.emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelSmall,
                  validator: (currentValue) {
                    if (currentValue == null || currentValue.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  controller: model.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              Theme.of(context).elevatedButtonTheme.style?.backgroundColor ??
                              MaterialStateProperty.all(const Color(0xffDB195B)),
                        ),
                        child: const Text('Submit'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            model.signIn(
                              email: model.emailController.text,
                              password: model.passwordController.text,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
