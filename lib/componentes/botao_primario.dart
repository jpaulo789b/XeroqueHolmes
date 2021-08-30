import 'package:fluttergit/componentes/text_widgets.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BotaoPrimario extends StatelessWidget {
  final String? value;
  final Function()? onTap;
  final bool? enable;
  final bool? fullWidth;
  final bool? bordered;
  final Color? corDefault;
  final double? height;
  final IconData? iconStart;
  final IconData? iconEnd;
  final Color? textColor;
  const BotaoPrimario(
      {Key? key,
      this.value,
      @required this.onTap,
      this.enable,
      this.fullWidth = true,
      this.bordered = false,
      this.corDefault,
      this.height,
      this.iconStart,
      this.iconEnd,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: fullWidth == null || fullWidth! ? double.maxFinite : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            visualDensity: VisualDensity.compact,
            primary: corDefault ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
        onPressed: enable != null && enable!
            ? onTap
            : enable != null && !enable!
                ? null
                : onTap,
        child: Padding(
          padding: !fullWidth! ? const EdgeInsets.only(left: 16, right: 16) : EdgeInsets.zero,
          child: iconStart == null && iconEnd == null
              ? TextButtonApp(
                  "$value ?? ''}",
                  customColor: textColor ?? (GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? Colors.white : null),
                  textAlign: TextAlign.center,
                )
              : Container(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconStart != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                iconStart,
                                color: Colors.white,
                                size: 24,
                              ),
                            )
                          : Container(),
                      TextButtonApp(
                        value ?? '',
                        customColor: textColor ?? (GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? Colors.white : null),
                        textAlign: TextAlign.center,
                      ),
                      iconEnd != null ? Icon(iconEnd, color: Colors.white, size: 24) : Container(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
