// import 'dart:convert';
// import 'package:fluttergit/componentes/card_padrao.dart';
// import 'package:fluttergit/componentes/text_widgets.dart';
// import 'package:fluttergit/util/string_extension.dart';
// import 'package:flutter/material.dart';

// abstract class DropDownItemBasico {
//   String? tituloDropDown;
// }
// class DropDownPadrao extends StatefulWidget {
//   final List<dynamic>? itensExibir;
//   final Function(dynamic)? callback;
//   final String? textLabel;
//   final String? keyExibirNome;
//   final String? prefixLabel;
//   final dynamic valor;
//   final String? tituloModal;
//   final String? subTituloModal;
//   final bool showBorder;
//   final bool ocultarSelectCasoUm;

//   const DropDownPadrao({Key? key,
//       this.itensExibir = const [],
//       @required this.callback,
//       this.valor,
//       this.textLabel,
//       @required this.keyExibirNome,
//       this.prefixLabel,
//       this.tituloModal = "Selecione uma opção",
//       this.subTituloModal = "", this.showBorder = true, this.ocultarSelectCasoUm = false}) : super(key: key);

//   @override
//   _DropDownPadraoState createState() => _DropDownPadraoState();
// }

// class _DropDownPadraoState extends State<DropDownPadrao> {
//   dynamic valorAtual;
//   @override
//   void initState() {
//     valorAtual = widget.valor;
//     super.initState();
//   }
//  late void Function(void Function()) setStateLabel;
//   dynamic show;
//   @override
//   Widget build(BuildContext context) {
//     show = const JsonCodec().decode(JsonCodec().encode(valorAtual ?? {'${widget.keyExibirNome}': 'Selecione uma opção'}));
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Visibility(
//           visible: widget.textLabel != null,
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 13.0),
//             child: TextBody1(
//               "${widget.textLabel}",
//             //   weight: FontWeight.bold,
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: (widget.ocultarSelectCasoUm && (widget.itensExibir?.length ?? 0) != 0) ? null:showDialogoDeSelecao,
//           child: Container(
//             height: 42,
//             padding: EdgeInsets.only(left: 16, right: 16),
//             decoration: widget.showBorder ? BoxDecoration(
//                 border: Border.all(color: Theme.of(context).dividerColor),
//                 color: Theme.of(context).scaffoldBackgroundColor,
//                 borderRadius: BorderRadius.circular(5)):null,
//             width: double.maxFinite,
//             child: Stack(
//               alignment: Alignment.centerLeft,
//               children: [
//                 Row(
//                   mainAxisAlignment: widget.showBorder ? MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: StatefulBuilder(
//                         builder: (BuildContext context, setSteLabel) {
//                           setStateLabel = setSteLabel;
//                           if('Selecione uma opção' == show[widget.keyExibirNome])
//                           return TextHeadLine2(camelCase("${show[widget.keyExibirNome]}"));
//                           return TextHeadLine2(camelCase("${widget.prefixLabel != null ? '${show[widget.prefixLabel] ?? widget.prefixLabel } - ' : ''}${show[widget.keyExibirNome]}"));
//                         },
//                       ),
//                     ),
//                     if(widget.ocultarSelectCasoUm && (widget.itensExibir?.length ?? 0) != 0)
//                         Container()
//                     else
//                         Icon(Icons.arrow_drop_down) 
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   showDialogoDeSelecao() {

//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Container(
//               height: double.minPositive,
//               width: double.maxFinite,
//               alignment: Alignment.center,
//               margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: double.maxFinite,
//                     child: CardPadrao(
//                       cardShadow: CardShadow.secundaria,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 40, bottom: 8),
//                             child: TextHeadLine2("${widget.tituloModal}"),
//                           ),
//                           const Divider(
//                             thickness: 0.3,
//                           ),
//                           ConstrainedBox(
//                             // height: 300,
//                             constraints: BoxConstraints(maxHeight: 280),
//                             child: StatefulBuilder(
//                               builder: (context, setStateLista) {
//                                 return ListView.builder(
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, index) {
//                                     var show = const JsonCodec().decode(const JsonCodec().encode(widget.itensExibir![index]));
//                                     return GestureDetector(
//                                       onTap: () {
//                                         setStateLista(() {
//                                                 valorAtual = widget.itensExibir![index];
//                                               });
//                                       },
//                                       child: Row(
//                                         children: [
//                                           Radio(
//                                             value: valorAtual == widget.itensExibir![index],
//                                             groupValue: true,
//                                             activeColor: Theme.of(context).primaryColor,
//                                             onChanged:(value) => {setStateLista(() {
//                                                 valorAtual = widget.itensExibir![index];
//                                               })},
//                                             focusColor:  Theme.of(context).primaryColor,
//                                           ),
//                                           Expanded(child: TextBody2(camelCase("${widget.prefixLabel != null ? '${show[widget.prefixLabel] ?? widget.prefixLabel } - ' : ''}${show[widget.keyExibirNome]}")))
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                   itemCount: widget.itensExibir!.length,
//                                 );
//                               },
//                             ),
//                           ),
//                           Divider(
//                             thickness: 0.3,
//                           ),
//                           Container(
//                             width: double.maxFinite,
//                             child: GestureDetector(
//                               onTap: () {
//                                 FocusScope.of(context).requestFocus(FocusNode());
//                                 widget.callback?.call(valorAtual);
//                                 show = JsonCodec().decode(JsonCodec().encode(valorAtual));
//                                 setStateLabel.call((){});
//                                 Navigator.pop(context);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(24),
//                                 child: TextButtonDefault(
//                                   "Concluir",
//                                   corPrimaria: true,
//                                 ),
//                               ),
//                             ),
//                             alignment: Alignment.centerRight,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

// }
