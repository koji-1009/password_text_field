import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_text_field/password_text_field.dart';

void main() {
  group('PasswordTextFormField', () {
    testWidgets('should render with initial obscurity', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(child: PasswordTextFormField(initialObscurity: true)),
          ),
        ),
      );

      // Verify the widget is rendered
      expect(find.byType(PasswordTextFormField), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);

      // Verify the inVisibleIcon is present (when text is obscured)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('should toggle obscurity when icon is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(child: PasswordTextFormField(initialObscurity: true)),
          ),
        ),
      );

      // Initially should show inVisibleIcon (text is obscured)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);

      // Tap the icon
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Now should show visibleIcon (text is visible)
      expect(find.byIcon(Icons.visibility_off), findsNothing);
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Tap again to hide
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Should be obscured again
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });

    testWidgets('should use custom icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                initialObscurity: true,
                visibleIcon: Icons.lock_open,
                inVisibleIcon: Icons.lock,
              ),
            ),
          ),
        ),
      );

      // Should show custom inVisible icon when obscured
      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.byIcon(Icons.lock_open), findsNothing);

      // Tap the icon
      await tester.tap(find.byIcon(Icons.lock));
      await tester.pump();

      // Should show custom visible icon when not obscured
      expect(find.byIcon(Icons.lock), findsNothing);
      expect(find.byIcon(Icons.lock_open), findsOneWidget);
    });

    testWidgets('should pass through TextFormField properties', (
      WidgetTester tester,
    ) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      // Verify the decoration is applied
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Enter your password'), findsOneWidget);

      // Verify the controller works
      await tester.enterText(find.byType(TextFormField), 'test password');
      expect(controller.text, 'test password');
    });

    testWidgets(
      'should start with text visible when initialObscurity is false',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(child: PasswordTextFormField(initialObscurity: false)),
            ),
          ),
        );

        // Should show visibleIcon when text is not obscured
        expect(find.byIcon(Icons.visibility), findsOneWidget);
        expect(find.byIcon(Icons.visibility_off), findsNothing);
      },
    );

    testWidgets('should handle form validation', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: PasswordTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      // Validate empty form
      expect(formKey.currentState!.validate(), false);
      await tester.pump();
      expect(find.text('Password is required'), findsOneWidget);

      // Enter short password
      await tester.enterText(find.byType(TextFormField), '123');
      expect(formKey.currentState!.validate(), false);
      await tester.pump();
      expect(
        find.text('Password must be at least 6 characters'),
        findsOneWidget,
      );

      // Enter valid password
      await tester.enterText(find.byType(TextFormField), '123456');
      expect(formKey.currentState!.validate(), true);
    });

    testWidgets('should handle onSaved callback', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      String? savedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: PasswordTextFormField(
                onSaved: (value) {
                  savedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      // Enter text and save
      await tester.enterText(find.byType(TextFormField), 'test password');
      formKey.currentState!.save();

      expect(savedValue, 'test password');
    });

    testWidgets('should handle onFieldSubmitted callback', (
      WidgetTester tester,
    ) async {
      bool onFieldSubmittedCalled = false;
      String submittedValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                onFieldSubmitted: (value) {
                  onFieldSubmittedCalled = true;
                  submittedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      // Enter text and submit
      await tester.enterText(find.byType(TextFormField), 'test password');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(onFieldSubmittedCalled, true);
      expect(submittedValue, 'test password');
    });

    testWidgets('should handle focus changes', (WidgetTester tester) async {
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(child: PasswordTextFormField(focusNode: focusNode)),
          ),
        ),
      );

      expect(focusNode.hasFocus, false);

      // Tap to focus
      await tester.tap(find.byType(TextFormField));
      await tester.pump();

      expect(focusNode.hasFocus, true);
    });

    testWidgets('should respect autovalidateMode', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      // Should immediately show validation error
      await tester.pump();
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('should handle enabled property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(child: PasswordTextFormField(enabled: false)),
          ),
        ),
      );

      final textFormField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(textFormField.enabled, false);
    });

    testWidgets('should apply iconPadding correctly', (
      WidgetTester tester,
    ) async {
      const customPadding = EdgeInsets.all(16.0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                initialObscurity: true,
                iconPadding: customPadding,
              ),
            ),
          ),
        ),
      );

      // Find the Padding widget that contains the IconButton
      final paddingFinder = find.byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == customPadding,
      );

      expect(paddingFinder, findsOneWidget);
    });

    testWidgets('should preserve existing decoration properties', (
      WidgetTester tester,
    ) async {
      const originalDecoration = InputDecoration(
        labelText: 'Password',
        hintText: 'Enter password',
        helperText: 'Helper text',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                decoration: originalDecoration,
                initialObscurity: true,
              ),
            ),
          ),
        ),
      );

      // Verify original decoration properties are preserved
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Enter password'), findsOneWidget);
      expect(find.text('Helper text'), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);

      // Verify suffix icon is added
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('should handle existing suffixIcon in decoration', (
      WidgetTester tester,
    ) async {
      const originalDecoration = InputDecoration(suffixIcon: Icon(Icons.clear));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                decoration: originalDecoration,
                initialObscurity: true,
              ),
            ),
          ),
        ),
      );

      // Our visibility icon should replace the original suffixIcon
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsNothing);
    });

    testWidgets('should maintain state during widget updates', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                initialObscurity: true,
                visibleIcon: Icons.visibility,
              ),
            ),
          ),
        ),
      );

      // Toggle visibility
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Update widget with different icons
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: PasswordTextFormField(
                initialObscurity: true,
                visibleIcon: Icons.lock_open,
                inVisibleIcon: Icons.lock,
              ),
            ),
          ),
        ),
      );

      // State should be preserved (text should still be visible)
      expect(find.byIcon(Icons.lock_open), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsNothing);
    });
  });
}
