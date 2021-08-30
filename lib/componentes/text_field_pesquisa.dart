import 'dart:async';

import 'package:fluttergit/componentes/card_padrao.dart';
import 'package:fluttergit/style/text_util.dart';
import 'package:flutter/material.dart';

class TextFieldPesquisa extends StatefulWidget {
  final Function(String text) onTextChanged;
  final String? labelText;
  final Widget? suffixIcon;
  final bool corDiferenteDoCard;
  const TextFieldPesquisa({
    Key? key,
    required this.onTextChanged, this.labelText, this.suffixIcon, this.corDiferenteDoCard = false,
  }) : super(key: key);

  @override
  _TextFieldPesquisaState createState() => _TextFieldPesquisaState();
}

class _TextFieldPesquisaState extends State<TextFieldPesquisa> {
  Timer? _debounce;
  String valorInicial = "";
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _textEditingController.text = valorInicial;
    return CardPadrao(
      cardShadow: CardShadow.secundaria,
      color: Theme.of(context).cardTheme.color,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: 40,
        child: TextField(
          onChanged: (v) {
             if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  widget.onTextChanged(v);
                });
            },
          controller: _textEditingController,
          style:TextUtil.stylebody1(),
          decoration: InputDecoration(
              focusColor: Colors.black,
              border: InputBorder.none,
              hintText: widget.labelText ?? 'Pesquise por nome',
              hintStyle: TextUtil.stylebody2(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextUtil.stylebody1(),
              prefixIcon:const Icon(
                Icons.search, size: 18, 
              ),
              suffixIcon: widget.suffixIcon ?? GestureDetector(
                onTap: (){
                  setState(() {
                    valorInicial= "";
                    FocusScope.of(context).requestFocus(FocusNode());
                    widget.onTextChanged.call("");
                  });
                },
                  child: Icon(Icons.close, size: 18, color: Theme.of(context).iconTheme.color))),
        ),
      ),
    );
  }
}
