import 'dart:math';

import 'package:flutter/material.dart';
import 'package:password_text_field/password_text_field.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'password_text_field demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final margin = max((width - 640) / 2, 16.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: margin,
          vertical: 16,
        ),
        child: const Column(
          children: [
            _PasswordWidget(),
            SizedBox(
              height: 32,
            ),
            _PasswordFormWidget(),
          ],
        ),
      ),
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'TextField',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const PasswordTextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'underline',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const PasswordTextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'outline',
          ),
        ),
      ],
    );
  }
}

class _PasswordFormWidget extends StatefulWidget {
  const _PasswordFormWidget();

  @override
  State<_PasswordFormWidget> createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<_PasswordFormWidget> {
  final _formState = GlobalKey<FormState>();
  final _textFormFieldController = TextEditingController();

  @override
  void dispose() {
    _textFormFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Column(
        children: [
          Text(
            'TextFormField',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          PasswordTextFormField(
            controller: _textFormFieldController,
            validator: (value) {
              if ((value?.length ?? 0) < 6) {
                return 'Password must be at least 6 characters';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {
              final state = _formState.currentState;
              if (state == null || !state.validate()) {
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Password ${_textFormFieldController.text} is valid!',
                  ),
                ),
              );
            },
            child: const Text('Check'),
          ),
        ],
      ),
    );
  }
}
