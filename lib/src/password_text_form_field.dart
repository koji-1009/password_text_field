import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_text_field/src/password_text_field.dart';

/// A [FormField] that contains a [PasswordTextField].
/// If you want to see the details of the API, check the [TextFormField].
///
/// It has almost the same API as [TextFormField], so it can be replaced.
class PasswordTextFormField extends FormField<String> {
  /// Creates a [FormField] that contains a [PasswordTextField].
  PasswordTextFormField({
    super.key,
    IconData visibleIcon = Icons.visibility,
    IconData inVisibleIcon = Icons.visibility_off,
    bool initialObscurity = false,
    this.groupId = EditableText,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    super.forceErrorText,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    GestureTapCallback? onTap,
    bool onTapAlwaysCalled = false,
    TapRegionCallback? onTapOutside,
    TapRegionUpCallback? onTapUpOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.errorBuilder,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    bool? ignorePointers,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Color? cursorErrorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    bool? selectAllOnFocus,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    super.restorationId,
    bool enableIMEPersonalizedLearning = true,
    MouseCursor? mouseCursor,
    EditableTextContextMenuBuilder? contextMenuBuilder =
        _defaultContextMenuBuilder,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
    UndoHistoryController? undoController,
    AppPrivateCommandCallback? onAppPrivateCommand,
    bool? cursorOpacityAnimates,
    ui.BoxHeightStyle? selectionHeightStyle,
    ui.BoxWidthStyle? selectionWidthStyle,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    WidgetStatesController? statesController,
    Clip clipBehavior = Clip.hardEdge,
    bool stylusHandwritingEnabled =
        EditableText.defaultStylusHandwritingEnabled,
    bool canRequestFocus = true,
    List<Locale>? hintLocales,
  }) : super(
         initialValue: controller != null
             ? controller.text
             : (initialValue ?? ''),
         enabled: enabled ?? decoration?.enabled ?? true,
         autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
         builder: (FormFieldState<String> field) {
           final _PasswordTextFormFieldState state =
               field as _PasswordTextFormFieldState;
           InputDecoration effectiveDecoration =
               (decoration ?? const InputDecoration()).applyDefaults(
                 Theme.of(field.context).inputDecorationTheme,
               );

           final String? errorText = field.errorText;
           if (errorText != null) {
             effectiveDecoration = errorBuilder != null
                 ? effectiveDecoration.copyWith(
                     error: errorBuilder(state.context, errorText),
                   )
                 : effectiveDecoration.copyWith(errorText: errorText);
           }

           void onChangedHandler(String value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return UnmanagedRestorationScope(
             bucket: field.bucket,
             child: PasswordTextField(
               visibleIcon: visibleIcon,
               inVisibleIcon: inVisibleIcon,
               initialObscurity: initialObscurity,
               groupId: groupId,
               restorationId: restorationId,
               controller: state._effectiveController,
               focusNode: focusNode,
               decoration: effectiveDecoration,
               keyboardType: keyboardType,
               textInputAction: textInputAction,
               style: style,
               strutStyle: strutStyle,
               textAlign: textAlign,
               textAlignVertical: textAlignVertical,
               textDirection: textDirection,
               textCapitalization: textCapitalization,
               autofocus: autofocus,
               statesController: statesController,
               readOnly: readOnly,
               showCursor: showCursor,
               obscuringCharacter: obscuringCharacter,
               autocorrect: autocorrect,
               smartDashesType:
                   smartDashesType ??
                   (obscureText
                       ? SmartDashesType.disabled
                       : SmartDashesType.enabled),
               smartQuotesType:
                   smartQuotesType ??
                   (obscureText
                       ? SmartQuotesType.disabled
                       : SmartQuotesType.enabled),
               enableSuggestions: enableSuggestions,
               maxLengthEnforcement: maxLengthEnforcement,
               maxLines: maxLines,
               minLines: minLines,
               expands: expands,
               maxLength: maxLength,
               onChanged: onChangedHandler,
               onTap: onTap,
               onTapAlwaysCalled: onTapAlwaysCalled,
               onTapOutside: onTapOutside,
               onTapUpOutside: onTapUpOutside,
               onEditingComplete: onEditingComplete,
               onSubmitted: onFieldSubmitted,
               inputFormatters: inputFormatters,
               enabled: enabled ?? decoration?.enabled ?? true,
               ignorePointers: ignorePointers,
               cursorWidth: cursorWidth,
               cursorHeight: cursorHeight,
               cursorRadius: cursorRadius,
               cursorColor: cursorColor,
               cursorErrorColor: cursorErrorColor,
               scrollPadding: scrollPadding,
               scrollPhysics: scrollPhysics,
               keyboardAppearance: keyboardAppearance,
               enableInteractiveSelection:
                   enableInteractiveSelection ?? (!obscureText || !readOnly),
               selectAllOnFocus: selectAllOnFocus,
               selectionControls: selectionControls,
               buildCounter: buildCounter,
               autofillHints: autofillHints,
               scrollController: scrollController,
               enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
               mouseCursor: mouseCursor,
               contextMenuBuilder: contextMenuBuilder,
               spellCheckConfiguration: spellCheckConfiguration,
               magnifierConfiguration: magnifierConfiguration,
               undoController: undoController,
               onAppPrivateCommand: onAppPrivateCommand,
               cursorOpacityAnimates: cursorOpacityAnimates,
               selectionHeightStyle:
                   selectionHeightStyle ??
                   EditableText.defaultSelectionHeightStyle,
               selectionWidthStyle:
                   selectionWidthStyle ??
                   EditableText.defaultSelectionWidthStyle,
               dragStartBehavior: dragStartBehavior,
               contentInsertionConfiguration: contentInsertionConfiguration,
               clipBehavior: clipBehavior,
               stylusHandwritingEnabled: stylusHandwritingEnabled,
               canRequestFocus: canRequestFocus,
               hintLocales: hintLocales,
             ),
           );
         },
       );

  /// see [TextFormField.controller]
  final TextEditingController? controller;

  /// see [TextFormField.groupId]
  final Object groupId;

  /// see [TextFormField.onChanged]
  final ValueChanged<String>? onChanged;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  FormFieldState<String> createState() => _PasswordTextFormFieldState();
}

/// see [TextFormField] & [_TextFormFieldState]
class _PasswordTextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _textFormField.controller ?? _controller!.value;

  PasswordTextFormField get _textFormField =>
      super.widget as PasswordTextFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_textFormField.controller == null) {
      _createLocalController(
        widget.initialValue != null
            ? TextEditingValue(text: widget.initialValue!)
            : null,
      );
    } else {
      _textFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(PasswordTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_textFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _textFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _textFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_textFormField.controller != null) {
        setValue(_textFormField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.value = TextEditingValue(text: value ?? '');
    }
  }

  @override
  void reset() {
    // Set the controller value before calling super.reset() to let
    // _handleControllerChanged suppress the change.
    _effectiveController.value = TextEditingValue(
      text: widget.initialValue ?? '',
    );
    super.reset();
    _textFormField.onChanged?.call(_effectiveController.text);
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
