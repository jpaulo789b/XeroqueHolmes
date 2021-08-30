import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttergit/componentes/card_padrao.dart';
import 'package:fluttergit/componentes/text_widgets.dart';
import 'package:fluttergit/models/git_xeroque_resultado.dart';
import 'package:fluttergit/style/text_util.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetalhesDoUsuario extends StatelessWidget {
  const ItemDetalhesDoUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  final DetalheUsuario usuario;

  @override
  Widget build(BuildContext context) {
    return CardPadrao(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Hero(
                  tag: "${usuario.login}",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${usuario.avatarUrl}"),
                  ),
                ),
              ),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeadLine1("${usuario.name}"),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.location_city,
                          size: 15,
                        ),
                      ),
                      TextOverLine1(usuario.location ?? 'Localização indisponível'),
                    ],
                  )
                ],
              ))
            ],
          ),
          const Divider(
            height: 16,
            thickness: 0.6,
          ),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Email: ',
                style: TextUtil.stylebody1().copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: (usuario.email?.isNotEmpty ?? false) ? usuario.email : 'Sem e-mail',
                style: TextUtil.stylebody1().copyWith(fontStyle: FontStyle.italic),
              )
            ]),
          ),
          const Divider(
            height: 16,
            thickness: 0.6,
          ),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Bio: ',
                style: TextUtil.stylebody1().copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: (usuario.bio?.isNotEmpty ?? false) ? usuario.bio : 'Sem Bio',
                style: TextUtil.stylebody1().copyWith(fontStyle: FontStyle.italic),
              )
            ]),
          ),
          const Divider(
            height: 16,
            thickness: 0.6,
          ),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Url Perfil: ',
                style: TextUtil.stylebody1().copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: "https://github.com/${usuario.login}",
                  style: TextUtil.stylebody1().copyWith(fontStyle: FontStyle.italic),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      launch("https://github.com/${usuario.login}");
                    }))
            ]),
          ),
          const Divider(
            height: 16,
            thickness: 0.6,
          ),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Repositórios com favorito: ',
                style: TextUtil.stylebody1().copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "${usuario.starredRepositories?.totalCount ?? 0}",
                style: TextUtil.stylebody1().copyWith(fontStyle: FontStyle.italic),
              )
            ]),
          )
        ],
      ),
    );
  }
}
