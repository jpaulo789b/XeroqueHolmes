import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttergit/componentes/item_detalhes_usuario.dart';
import 'package:fluttergit/componentes/logo_app.dart';
import 'package:fluttergit/componentes/text_widgets.dart';
import 'package:fluttergit/models/git_xeroque_resultado.dart';
import 'package:fluttergit/style/text_util.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaVisualizarUsuario extends StatefulWidget {
  const TelaVisualizarUsuario({Key? key}) : super(key: key);

  @override
  _TelaVisualizarUsuarioState createState() => _TelaVisualizarUsuarioState();
}

class _TelaVisualizarUsuarioState extends State<TelaVisualizarUsuario> {
  late DetalheUsuario usuario;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    usuario = ModalRoute.of(context)!.settings.arguments as DetalheUsuario;
    return Scaffold(
        appBar: AppBar(
          title: const LogoApp(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            runSpacing: 26,
            children: [
              ItemDetalhesDoUsuario(usuario: usuario),
              const TextHeadLine1("Todos os repositórios marcados como favorito",textAlign: TextAlign.center,),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    var favrepo = usuario.starredRepositories!.nodes![index];
                    return ListTile(
                      title: TextBody1(
                        favrepo!.name ?? 'Sem nome',
                        weight: FontWeight.bold,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Descrição: ',
                                style: TextUtil.stylebody1().copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: (favrepo.description?.isNotEmpty ?? false) ? favrepo.description : 'Sem descrição',
                                style: TextUtil.stylebody1().copyWith(fontStyle: FontStyle.italic),
                              )
                            ]),
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Url: ',
                                style: TextUtil.stylebody1().copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: (favrepo.url?.isNotEmpty ?? false) ? favrepo.url : 'Sem url',
                                  style: TextUtil.stylebody1().copyWith(fontStyle: FontStyle.italic),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (() {
                                      launch(favrepo.url!);
                                    }))
                            ]),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        thickness: 0.7,
                      ),
                  itemCount: usuario.starredRepositories!.nodes!.length)
            ],
          ),
        ));
  }
}
