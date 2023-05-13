# password_text_field

PasswordTextField is a TextField that manages the toggle of obscure.

## How to use

### `TextField`(`PasswordTextField`)

```dart
class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

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
```

### `TextFormField`(`PasswordTextFormField`)

```dart
class PasswordFormWidget extends StatefulWidget {
  const PasswordFormWidget({super.key});

  @override
  State<PasswordFormWidget> createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
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
```