import 'package:flutter/material.dart';

enum CardShadow { primaria, secundaria, zero }

class CardPadrao extends StatelessWidget {
  final double? radius;
  final Color? color;
  final EdgeInsetsGeometry margin;
  final Widget? child;
  final Clip? clipBehavior;
  final double? elevation;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final bool? selecionado;
  final bool desabilitadoSelecao;
  final bool secundario;
  final CardShadow? cardShadow;
  final List<Color>? gradient;
  const CardPadrao(
      {Key? key,
      this.radius,
      this.color,
      this.margin = const EdgeInsets.all(4),
      this.child,
      this.clipBehavior,
      this.elevation,
      this.padding,
      this.borderRadius,
      this.selecionado = false,
      this.desabilitadoSelecao = false,
      this.secundario = false,
      this.cardShadow = CardShadow.zero,
      this.gradient,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        gradient: (gradient?.isNotEmpty ?? false)
            ? LinearGradient(
                colors: gradient!,
              )
            : null,
        color: secundario ? color ?? Theme.of(context).canvasColor : color ?? Theme.of(context).cardColor,
        border: desabilitadoSelecao
            ? Border.all(color: Theme.of(context).dividerColor)
            : selecionado == null
                ? null
                : selecionado == false
                    ? null
                    : Border.all(color: Theme.of(context).primaryColor),
        borderRadius: borderRadius ?? BorderRadius.circular((radius ?? 8)),
        boxShadow: (color != null && color == Colors.transparent || cardShadow == CardShadow.zero)
            ? []
            : [
                BoxShadow(
                  color: color ?? Theme.of(context).shadowColor,
                  spreadRadius: 0,
                  blurRadius: (cardShadow == CardShadow.primaria) ? 8 : 4,
                  offset: Offset(
                    0,
                    (cardShadow == CardShadow.primaria) ? 6 : (elevation ?? 2),
                  ), // changes position of shadow
                ),
              ],
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: child ?? Container(),
        clipBehavior: clipBehavior ?? Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
      ),
    );
  }
}