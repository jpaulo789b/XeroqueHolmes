
import 'package:fluttergit/componentes/text_widgets.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BotaoSecundario extends StatelessWidget {
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
  final Color? corTextoBotao;
  final bool? botaoBordaPrimaria;
  const BotaoSecundario({
    Key? key, this.value, this.onTap, this.enable, this.fullWidth = true, this.bordered = false, this.corDefault, this.height, this.iconStart, this.iconEnd, this.textColor, this.corTextoBotao, this.botaoBordaPrimaria
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    final _controller = GetIt.I.get<ControladorApp>();
    return SizedBox(
      height: height ?? 48,
      width: fullWidth == null || fullWidth! ?  double.maxFinite:null,
      child: ElevatedButton(
        onPressed: enable != null && enable! ? onTap: enable != null  && !enable! ? null:onTap,
        // disabledColor: Colors.transparent,

        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
                color:
                    _controller.themeMode == ThemeMode.dark
                        ? (botaoBordaPrimaria ?? false) ? Theme.of(context).primaryColor : Theme.of(context).dividerColor : Theme.of(context).dividerColor)),
        ),
        child: Padding(
          padding: !fullWidth! ? const EdgeInsets.only(left: 16,right: 16):EdgeInsets.zero,
          child: iconStart == null && iconEnd == null ? 
            TextButtonApp(value ?? '',customColor: textColor ?? (_controller.themeMode == ThemeMode.dark ? Colors.white: const Color(0xff51555A)), textAlign: TextAlign.center,)
            :Container(
            alignment: Alignment.center,
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconStart != null ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(iconStart, color: _controller.themeMode == ThemeMode.dark ? Colors.white: Colors.black,size: 24,),
                ):Container(),
                TextButtonApp(value ?? "",customColor:corTextoBotao ?? (_controller.themeMode == ThemeMode.dark? Colors.white: Colors.black),),
                iconEnd != null ? Icon(iconEnd, color: _controller.themeMode == ThemeMode.dark ? Colors.white: Colors.black,size: 24):Container(),
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}