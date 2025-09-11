import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [PasswordTextField] is a [TextField] that manages the toggle of obscure.
/// If you want to see the details of the API, check the [TextField].
///
/// It has almost the same API as [TextField], so it can be replaced.
class PasswordTextField extends StatefulWidget {
  /// Creates a Material Design text field that manages visible/inVisible icon.
  const PasswordTextField({
    super.key,
    this.visibleIcon = Icons.visibility,
    this.inVisibleIcon = Icons.visibility_off,
    this.initialObscurity = false,
    this.iconPadding = EdgeInsets.zero,
    this.groupId = EditableText,
    this.controller,
    this.focusNode,
    this.undoController,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.statesController,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.cursorErrorColor,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.selectAllOnFocus,
    this.selectionControls,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onTapUpOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.stylusHandwritingEnabled =
        EditableText.defaultStylusHandwritingEnabled,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.hintLocales,
  });

  /// Displaying toggle icon(show).
  ///
  /// Defaults is [Icons.visibility].
  final IconData visibleIcon;

  /// Displaying toggle icon(hide).
  ///
  /// Defaults is [Icons.visibility_off].
  final IconData inVisibleIcon;

  /// Padding around the icon.
  /// Defaults is [EdgeInsets.zero].
  final EdgeInsets iconPadding;

  /// The obscure feature is enabled by default.
  ///
  /// Default is [false].
  final bool initialObscurity;

  /// see [TextField.magnifierConfiguration]
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// see [TextField.groupId]
  final Object groupId;

  /// see [TextField.controller]
  final TextEditingController? controller;

  /// see [TextField.focusNode]
  final FocusNode? focusNode;

  /// see [TextField.decoration]
  final InputDecoration decoration;

  /// see [TextField.keyboardType]
  final TextInputType? keyboardType;

  /// see [TextField.textInputAction]
  final TextInputAction? textInputAction;

  /// see [TextField.textCapitalization]
  final TextCapitalization textCapitalization;

  /// see [TextField.style]
  final TextStyle? style;

  /// see [TextField.strutStyle]
  final StrutStyle? strutStyle;

  /// see [TextField.textAlign]
  final TextAlign textAlign;

  /// see [TextField.textAlignVertical]
  final TextAlignVertical? textAlignVertical;

  /// see [TextField.textDirection]
  final TextDirection? textDirection;

  /// see [TextField.autofocus]
  final bool autofocus;

  /// see [TextField.statesController]
  final WidgetStatesController? statesController;

  /// see [TextField.obscuringCharacter]
  final String obscuringCharacter;

  /// see [TextField.autocorrect]
  final bool autocorrect;

  /// see [TextField.smartDashesType]
  final SmartDashesType? smartDashesType;

  /// see [TextField.smartQuotesType]
  final SmartQuotesType? smartQuotesType;

  /// see [TextField.enableSuggestions]
  final bool enableSuggestions;

  /// see [TextField.maxLines]
  final int? maxLines;

  /// see [TextField.minLines]
  final int? minLines;

  /// see [TextField.expands]
  final bool expands;

  /// see [TextField.readOnly]
  final bool readOnly;

  /// see [TextField.showCursor]
  final bool? showCursor;

  /// see [TextField.maxLength]
  final int? maxLength;

  /// see [TextField.maxLengthEnforcement]
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// see [TextField.onChanged]
  final ValueChanged<String>? onChanged;

  /// see [TextField.onEditingComplete]
  final VoidCallback? onEditingComplete;

  /// see [TextField.onSubmitted]
  final ValueChanged<String>? onSubmitted;

  /// see [TextField.onAppPrivateCommand]
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// see [TextField.inputFormatters]
  final List<TextInputFormatter>? inputFormatters;

  /// see [TextField.enabled]
  final bool? enabled;

  /// see [TextField.ignorePointers]
  final bool? ignorePointers;

  /// see [TextField.cursorWidth]
  final double cursorWidth;

  /// see [TextField.cursorHeight]
  final double? cursorHeight;

  /// see [TextField.cursorRadius]
  final Radius? cursorRadius;

  /// see [TextField.cursorOpacityAnimates]
  final bool? cursorOpacityAnimates;

  /// see [TextField.cursorColor]
  final Color? cursorColor;

  /// see [TextField.cursorErrorColor]
  final Color? cursorErrorColor;

  /// see [TextField.selectionHeightStyle]
  final ui.BoxHeightStyle? selectionHeightStyle;

  /// see [TextField.selectionWidthStyle]
  final ui.BoxWidthStyle? selectionWidthStyle;

  /// see [TextField.keyboardAppearance]
  final Brightness? keyboardAppearance;

  /// see [TextField.scrollPadding]
  final EdgeInsets scrollPadding;

  /// see [TextField.enableInteractiveSelection]
  final bool? enableInteractiveSelection;

  /// see [TextField.selectAllOnFocus]
  final bool? selectAllOnFocus;

  /// see [TextField.selectionControls]
  final TextSelectionControls? selectionControls;

  /// see [TextField.dragStartBehavior]
  final DragStartBehavior dragStartBehavior;

  /// see [TextField.onTap]
  final GestureTapCallback? onTap;

  /// see [TextField.onTapAlwaysCalled]
  final bool onTapAlwaysCalled;

  /// see [TextField.onTapOutside]
  final TapRegionCallback? onTapOutside;

  /// see [TextField.onTapUpOutside]
  final TapRegionUpCallback? onTapUpOutside;

  /// see [TextField.mouseCursor]
  final MouseCursor? mouseCursor;

  /// see [TextField.buildCounter]
  final InputCounterWidgetBuilder? buildCounter;

  /// see [TextField.scrollPhysics]
  final ScrollPhysics? scrollPhysics;

  /// see [TextField.scrollController]
  final ScrollController? scrollController;

  /// see [TextField.autofillHints]
  final Iterable<String>? autofillHints;

  /// see [TextField.clipBehavior]
  final Clip clipBehavior;

  /// see [TextField.restorationId]
  final String? restorationId;

  /// see [TextField.stylusHandwritingEnabled]
  final bool stylusHandwritingEnabled;

  /// see [TextField.enableIMEPersonalizedLearning]
  final bool enableIMEPersonalizedLearning;

  /// see [TextField.contentInsertionConfiguration]
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// see [TextField.contextMenuBuilder]
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// see [TextField.canRequestFocus]
  final bool canRequestFocus;

  /// see [TextField.undoController]
  final UndoHistoryController? undoController;

  /// see [TextField.hintLocales]
  final List<Locale>? hintLocales;

  /// see [TextField.spellCheckConfiguration]
  final SpellCheckConfiguration? spellCheckConfiguration;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _obscure = widget.initialObscurity;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscure,
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
      groupId: widget.groupId,
      controller: widget.controller,
      focusNode: widget.focusNode,
      undoController: widget.undoController,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      autofocus: widget.autofocus,
      statesController: widget.statesController,
      obscuringCharacter: widget.obscuringCharacter,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      ignorePointers: widget.ignorePointers,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      cursorColor: widget.cursorColor,
      cursorErrorColor: widget.cursorErrorColor,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      dragStartBehavior: widget.dragStartBehavior,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectAllOnFocus: widget.selectAllOnFocus,
      selectionControls: widget.selectionControls,
      onTap: widget.onTap,
      onTapAlwaysCalled: widget.onTapAlwaysCalled,
      onTapOutside: widget.onTapOutside,
      onTapUpOutside: widget.onTapUpOutside,
      mouseCursor: widget.mouseCursor,
      buildCounter: widget.buildCounter,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      contentInsertionConfiguration: widget.contentInsertionConfiguration,
      clipBehavior: widget.clipBehavior,
      restorationId: widget.restorationId,
      stylusHandwritingEnabled: widget.stylusHandwritingEnabled,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      contextMenuBuilder: widget.contextMenuBuilder,
      canRequestFocus: widget.canRequestFocus,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
      hintLocales: widget.hintLocales,
    );
  }
}
