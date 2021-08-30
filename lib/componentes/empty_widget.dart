import 'package:fluttergit/componentes/text_widgets.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatefulWidget {
  final EmptyImage? imagem;
  final String titulo;
  final String mensagem;
  final Widget? child;
  final EdgeInsetsGeometry? margim;
  const EmptyWidget({Key? key, this.imagem, this.titulo = "", this.mensagem = "", this.child, this.margim}) : super(key: key);

  @override
  _EmptyWidgetState createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margim ?? EdgeInsets.zero,
      child: Wrap(
        children: [
          Center(
            child: Visibility(
              visible: widget.imagem != null || (widget.imagem!.imagemExibir.contains("htt")),
              child: Visibility(
                visible: (widget.imagem!.imagemExibir.contains("htt")),
                child: Image.network(
                  widget.imagem?.imagemExibir ?? "",
                  width: 124,
                  height: 124,
                ),
                replacement: widget.imagem != null
                    ? Image.asset(
                        widget.imagem!.imagemExibir,
                        width: 124,
                        height: 124,
                      )
                    : Container(),
              ),
            ),
          ),

          Center(
            child: Visibility(
                visible: widget.titulo.isNotEmpty,
                child: TextHeadLine1(
                  widget.titulo,
                  textAlign: TextAlign.center,
                )),
          ),

          Center(
            child: Visibility(
                visible: widget.mensagem.isNotEmpty,
                child: TextBody1(
                  widget.mensagem,
                  textAlign: TextAlign.center,
                )),
          ),
          Visibility(visible: widget.child != null, child: widget.child ?? Container())
        ],
      ),
    );
  }
}

class EmptyImage {
  static const falha = EmptyImage(imagemExibir: "assets/failTo.png");
  static const semResultado = EmptyImage(imagemExibir: "assets/semresultado.png");

  final String imagemExibir;

  const EmptyImage({required this.imagemExibir});
  static EmptyImage fromUrl(String url) => EmptyImage(imagemExibir: url);
  static EmptyImage fromAsset(String url) => EmptyImage(imagemExibir: url);
}
