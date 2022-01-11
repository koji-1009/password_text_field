import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'password_text_field.dart';

/// A [FormField] that contains a [PasswordTextField].
/// If you want to see the details of the API, check the [TextFormField].
///
/// It has almost the same API as [TextFormField], so it can be replaced.
class PasswordTextFormField extends FormField<String> {
  /// Creates a [FormField] that contains a [PasswordTextField].
  PasswordTextFormField({
    Key? key,
    this.controller,
    FocusNode? focusNode,
    InputDecoration decoration = const InputDecoration(),
    List<TextInputFormatter>? inputFormatters,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool? enabled,
    GestureTapCallback? onTap,
    String initialValue = '',
    bool autovalidate = false,
    bool autofocus = false,
    TextInputAction textInputAction = TextInputAction.done,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    TextStyle? style,
    StrutStyle? strutStyle,
    int maxLength = TextField.noMaxLength,
    IconData visibleIcon = Icons.visibility,
    IconData inVisibleIcon = Icons.visibility_off,
  }) : super(
          key: key,
          initialValue: controller != null ? controller.text : initialValue,
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? decoration.enabled,
          autovalidateMode:
              autovalidate ? AutovalidateMode.always : autovalidateMode,
          builder: (field) {
            final state = field as _PasswordTextFormFieldState;
            final effectiveDecoration = decoration
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            return PasswordTextField(
              controller: state._effectiveController,
              focusNode: focusNode,
              decoration: effectiveDecoration.copyWith(
                errorText: field.errorText,
              ),
              textInputAction: textInputAction,
              style: style,
              strutStyle: strutStyle,
              inputFormatters: inputFormatters,
              onChanged: onChangedHandler,
              onEditingComplete: onEditingComplete,
              onSubmitted: onFieldSubmitted,
              onTap: onTap,
              autofocus: autofocus,
              maxLength: maxLength,
              visibleIcon: visibleIcon,
              inVisibleIcon: inVisibleIcon,
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

/// see [TextFormField] & [_TextFormFieldState]
class _PasswordTextFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;

  @override
  PasswordTextFormField get widget => super.widget as PasswordTextFormField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(PasswordTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller = TextEditingController.fromValue(
          oldWidget.controller!.value,
        );
      }
      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController!.text != value) {
      _effectiveController!.text = value ?? '';
    }
  }

  @override
  void reset() {
    _effectiveController!.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
