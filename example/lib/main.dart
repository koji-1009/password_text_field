import 'package:flutter/material.dart';
import 'package:password_text_field/password_text_field.dart';

void main() {
  runApp(const MyApp());
}

// ignore: public_member_api_docs
class MyApp extends StatelessWidget {
  // ignore: public_member_api_docs
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'password_text_field demo',
      theme: ThemeData.from(colorScheme: ColorScheme.light()),
      darkTheme: ThemeData.from(colorScheme: ColorScheme.dark()),
      home: MyHomePage(),
    );
  }
}

// ignore: public_member_api_docs
class MyHomePage extends StatefulWidget {
  // ignore: public_member_api_docs
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formState = GlobalKey<FormState>();
  final _textFormFieldController = TextEditingController();

  final _smallSpace = const SizedBox(height: 8);
  final _mediumSpace = const SizedBox(height: 16);
  final _largeSpace = const SizedBox(height: 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page'),
      ),
      body: Center(
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'TextField',
                style: Theme.of(context).textTheme.headline6,
              ),
              _smallSpace,
              PasswordTextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'underline',
                ),
              ),
              _mediumSpace,
              PasswordTextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'outline',
                ),
              ),
              _largeSpace,
              Form(
                key: _formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TextFormField',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    _smallSpace,
                    PasswordTextFormField(
                      controller: _textFormFieldController,
                      validator: (value) {
                        if ((value?.length ?? 0) < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        return null;
                      },
                    ),
                    _mediumSpace,
                    ElevatedButton(
                      onPressed: () {
                        _formState.currentState?.validate();
                      },
                      child: Text('Check'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
