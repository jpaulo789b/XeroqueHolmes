import 'package:fluttergit/componentes/text_widgets.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:fluttergit/style/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class TextFieldPadrao extends StatelessWidget {
  final Function(String? text)? onChanged;
  final String? hintText;
  final Widget? prefix;
  final Widget? sufix;
  final Widget? sufixButtom;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? autoFocus;
  final String? textLabel;
  final String? valorNoCampo;
  final EdgeInsets? padding;
  final int? widthInput;
  final Function()? onClick;
  final int? maxLines;
  final int? minLines;
  final double radius;
  final TextEditingController? controller;
  final String? suffixText;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final Color? borderColor;
  final Color? fillColor;
  final int? maxLength;
  final bool? editable;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldPadrao(
      {Key? key,
      this.onChanged,
      this.hintText,
      this.prefix,
      this.sufix,
      this.autoFocus,
      this.inputType,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.textLabel,
      this.sufixButtom,
      this.valorNoCampo,
      this.padding,
      this.widthInput,
      this.onClick,
      this.maxLines,
      this.minLines,
      this.radius = 5,
      this.controller,
      this.suffixText,
      this.focusNode,
      this.textAlign = TextAlign.start,
      this.borderColor,
      this.maxLength,
      this.fillColor,
      this.editable,
      this.inputFormatters})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tamanhoPadraoLinha = 42.0;
    var tamanoRadius = minLines == null ? radius : 10.0;
    final _controllerApp = GetIt.I.get<ControladorApp>();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLabel != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextBody1(
                          textLabel,
                        ),
                      )
                    : Container(),
                ConstrainedBox(
                  constraints:  BoxConstraints(
                      minHeight: tamanhoPadraoLinha,
                      maxHeight: minLines != null
                          ? tamanhoPadraoLinha * minLines!
                          : tamanhoPadraoLinha),
                  child: TextField(
                    textAlign: textAlign,
                    onTap: onClick,
                    focusNode: (editable ?? true)
                        ? focusNode
                        : AlwaysDisabledFocusNode(),
                    maxLength: maxLength,
                    inputFormatters: inputFormatters,
                    controller: controller ?? (valorNoCampo != null
                                ? TextEditingController(text: valorNoCampo)
                                : null),
                    readOnly: onClick != null,
                    onChanged: onChanged,
                    maxLines: maxLines,
                    minLines: minLines,
                    keyboardType: inputType,
                    keyboardAppearance:
                        _controllerApp.themeMode == ThemeMode.dark
                            ? Brightness.dark
                            : Brightness.light,
                    style: TextUtil.stylebody2(),
                    autofocus: autoFocus ?? false,
                    obscureText: obscureText ?? false,
                    decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: minLines != null ? 5 : 2),
                        prefix: prefix,
                        suffix: sufix,
                        suffixText: suffixText,
                        suffixStyle: TextUtil.styleoverLine1(),
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon,
                        isDense: false,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(tamanoRadius)),
                          borderSide: BorderSide(
                              width: 1,
                              color: borderColor ?? Theme.of(context).dividerColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(tamanoRadius)),
                          borderSide: BorderSide(
                              width: 1,
                              color: borderColor ?? Theme.of(context).dividerColor),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: borderColor ?? Theme.of(context).dividerColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(tamanoRadius),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextUtil.stylebody2(),
                        hintText: hintText ?? "",
                        fillColor: fillColor ?? Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        sufixButtom ?? Container(),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}