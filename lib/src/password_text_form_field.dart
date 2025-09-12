import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_text_field/src/password_text_field.dart';

/// A [FormField] that contains a [PasswordTextField].
/// If you want to see the details of the API, check the [TextFormField].
///
/// It has almost the same API as [TextFormField], so it can be replaced.
class PasswordTextFormField extends StatefulWidget {
  /// Creates a [FormField] that contains a [PasswordTextField].
  const PasswordTextFormField({
    super.key,
    this.visibleIcon = Icons.visibility,
    this.inVisibleIcon = Icons.visibility_off,
    this.initialObscurity = false,
    this.iconPadding = EdgeInsets.zero,
    this.groupId = EditableText,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.forceErrorText,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onTapUpOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.errorBuilder,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorErrorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectAllOnFocus,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.onAppPrivateCommand,
    this.cursorOpacityAnimates,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.contentInsertionConfiguration,
    this.statesController,
    this.clipBehavior = Clip.hardEdge,
    this.stylusHandwritingEnabled =
        EditableText.defaultStylusHandwritingEnabled,
    this.canRequestFocus = true,
    this.hintLocales,
  });

  /// Displaying toggle icon(show).
  /// Defaults is [Icons.visibility].
  final IconData visibleIcon;

  /// Displaying toggle icon(hide).
  /// Defaults is [Icons.visibility_off].
  final IconData inVisibleIcon;

  /// The obscure feature is enabled by default.
  /// Default is [false].
  final bool initialObscurity;

  /// Padding around the icon.
  /// Default is [EdgeInsets.zero].
  final EdgeInsets iconPadding;

  /// see [TextFormField.controller]
  final TextEditingController? controller;

  /// see [TextFormField.groupId]
  final Object groupId;

  /// see [TextFormField.initialValue]
  final String? initialValue;

  /// see [TextFormField.focusNode]
  final FocusNode? focusNode;

  /// see [TextFormField.forceErrorText]
  final String? forceErrorText;

  /// see [TextFormField.decoration]
  final InputDecoration decoration;

  /// see [TextFormField.keyboardType]
  final TextInputType? keyboardType;

  /// see [TextFormField.textCapitalization]
  final TextCapitalization textCapitalization;

  /// see [TextFormField.textInputAction]
  final TextInputAction? textInputAction;

  /// see [TextFormField.style]
  final TextStyle? style;

  /// see [TextFormField.strutStyle]
  final StrutStyle? strutStyle;

  /// see [TextFormField.textDirection]
  final TextDirection? textDirection;

  /// see [TextFormField.textAlign]
  final TextAlign textAlign;

  /// see [TextFormField.textAlignVertical]
  final TextAlignVertical? textAlignVertical;

  /// see [TextFormField.autofocus]
  final bool autofocus;

  /// see [TextFormField.readOnly]
  final bool readOnly;

  /// see [TextFormField.showCursor]
  final bool? showCursor;

  /// see [TextFormField.obscuringCharacter]
  final String obscuringCharacter;

  /// see [TextFormField.autocorrect]
  final bool autocorrect;

  /// see [TextFormField.smartDashesType]
  final SmartDashesType? smartDashesType;

  /// see [TextFormField.smartQuotesType]
  final SmartQuotesType? smartQuotesType;

  /// see [TextFormField.enableSuggestions]
  final bool enableSuggestions;

  /// see [TextFormField.maxLengthEnforcement]
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// see [TextFormField.maxLines]
  final int? maxLines;

  /// see [TextFormField.minLines]
  final int? minLines;

  /// see [TextFormField.expands]
  final bool expands;

  /// see [TextFormField.maxLength]
  final int? maxLength;

  /// see [TextFormField.onChanged]
  final ValueChanged<String>? onChanged;

  /// see [TextFormField.onTap]
  final GestureTapCallback? onTap;

  /// see [TextFormField.onTapAlwaysCalled]
  final bool onTapAlwaysCalled;

  /// see [TextFormField.onTapOutside]
  final TapRegionCallback? onTapOutside;

  /// see [TextFormField.onTapUpOutside]
  final TapRegionUpCallback? onTapUpOutside;

  /// see [TextFormField.onEditingComplete]
  final VoidCallback? onEditingComplete;

  /// see [TextFormField.onFieldSubmitted]
  final ValueChanged<String>? onFieldSubmitted;

  /// see [TextFormField.onSaved]
  final FormFieldSetter<String>? onSaved;

  /// see [TextFormField.validator]
  final FormFieldValidator<String>? validator;

  /// see [TextFormField.errorBuilder]
  final FormFieldErrorBuilder? errorBuilder;

  /// see [TextFormField.inputFormatters]
  final List<TextInputFormatter>? inputFormatters;

  /// see [TextFormField.enabled]
  final bool? enabled;

  /// see [TextFormField.ignorePointers]
  final bool? ignorePointers;

  /// see [TextFormField.cursorWidth]
  final double cursorWidth;

  /// see [TextFormField.cursorHeight]
  final double? cursorHeight;

  /// see [TextFormField.cursorRadius]
  final Radius? cursorRadius;

  /// see [TextFormField.cursorColor]
  final Color? cursorColor;

  /// see [TextFormField.cursorErrorColor]
  final Color? cursorErrorColor;

  /// see [TextFormField.keyboardAppearance]
  final Brightness? keyboardAppearance;

  /// see [TextFormField.scrollPadding]
  final EdgeInsets scrollPadding;

  /// see [TextFormField.enableInteractiveSelection]
  final bool? enableInteractiveSelection;

  /// see [TextFormField.selectAllOnFocus]
  final bool? selectAllOnFocus;

  /// see [TextFormField.selectionControls]
  final TextSelectionControls? selectionControls;

  /// see [TextFormField.buildCounter]
  final InputCounterWidgetBuilder? buildCounter;

  /// see [TextFormField.scrollPhysics]
  final ScrollPhysics? scrollPhysics;

  /// see [TextFormField.autofillHints]
  final Iterable<String>? autofillHints;

  /// see [TextFormField.autovalidateMode]
  final AutovalidateMode? autovalidateMode;

  /// see [TextFormField.scrollController]
  final ScrollController? scrollController;

  /// see [TextFormField.restorationId]
  final String? restorationId;

  /// see [TextFormField.enableIMEPersonalizedLearning]
  final bool enableIMEPersonalizedLearning;

  /// see [TextFormField.mouseCursor]
  final MouseCursor? mouseCursor;

  /// see [TextFormField.contextMenuBuilder]
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// see [TextFormField.spellCheckConfiguration]
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// see [TextFormField.magnifierConfiguration]
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// see [TextFormField.undoController]
  final UndoHistoryController? undoController;

  /// see [TextFormField.onAppPrivateCommand]
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// see [TextFormField.cursorOpacityAnimates]
  final bool? cursorOpacityAnimates;

  /// see [TextFormField.selectionHeightStyle]
  final ui.BoxHeightStyle? selectionHeightStyle;

  /// see [TextFormField.selectionWidthStyle]
  final ui.BoxWidthStyle? selectionWidthStyle;

  /// see [TextFormField.dragStartBehavior]
  final DragStartBehavior dragStartBehavior;

  /// see [TextFormField.contentInsertionConfiguration]
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// see [TextFormField.statesController]
  final WidgetStatesController? statesController;

  /// see [TextFormField.clipBehavior]
  final Clip clipBehavior;

  /// see [TextFormField.stylusHandwritingEnabled]
  final bool stylusHandwritingEnabled;

  /// see [TextFormField.canRequestFocus]
  final bool canRequestFocus;

  /// see [TextFormField.hintLocales]
  final List<Locale>? hintLocales;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  late bool _obscure = widget.initialObscurity;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      forceErrorText: widget.forceErrorText,
      decoration: widget.decoration.copyWith(
        suffixIcon: Padding(
          padding: widget.iconPadding,
          child: IconButton(
            icon: Icon(_obscure ? widget.inVisibleIcon : widget.visibleIcon),
            onPressed: () => setState(() {
              _obscure = !_obscure;
            }),
          ),
        ),
      ),
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: _obscure,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapAlwaysCalled: widget.onTapAlwaysCalled,
      onTapOutside: widget.onTapOutside,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      errorBuilder: widget.errorBuilder,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      ignorePointers: widget.ignorePointers,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      cursorErrorColor: widget.cursorErrorColor,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectAllOnFocus: widget.selectAllOnFocus,
      selectionControls: widget.selectionControls,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      autovalidateMode: widget.autovalidateMode,
      scrollController: widget.scrollController,
      restorationId: widget.restorationId,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      mouseCursor: widget.mouseCursor,
      contextMenuBuilder: widget.contextMenuBuilder,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
      undoController: widget.undoController,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      dragStartBehavior: widget.dragStartBehavior,
      contentInsertionConfiguration: widget.contentInsertionConfiguration,
      statesController: widget.statesController,
      clipBehavior: widget.clipBehavior,
      stylusHandwritingEnabled: widget.stylusHandwritingEnabled,
      canRequestFocus: widget.canRequestFocus,
    );
  }
}
