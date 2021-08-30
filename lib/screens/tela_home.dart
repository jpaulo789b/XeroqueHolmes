import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttergit/componentes/empty_widget.dart';
import 'package:fluttergit/componentes/item_detalhes_usuario.dart';
import 'package:fluttergit/componentes/logo_app.dart';
import 'package:fluttergit/componentes/text_field_pesquisa.dart';
import 'package:fluttergit/controllers/controlador_git_holmes.dart';
import 'package:fluttergit/util/status.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final _refreshController = RefreshController();
  final _controllerGitHolmes = GetIt.I.get<ControladorGitHolmes>();
  void _refresh() {
    _controllerGitHolmes.pesquisarNoGit(
      "",
      falha: (p0) {
        _refreshController.refreshCompleted();
      },
      sucesso: () {
        _refreshController.refreshFailed();
      },
    );
  }

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoApp(),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _refresh,
        physics: const BouncingScrollPhysics(),
        header: const WaterDropHeader(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFieldPesquisa(
                  onTextChanged: (text) {
                    _controllerGitHolmes.pesquisarNoGit(text);
                  },
                ),
              ),
              Observer(
                builder: (_) {
                  switch (_controllerGitHolmes.statusPesquisa) {
                    case StatusConsulta.sucesso:
                      return _controllerGitHolmes.resultadoPesquisa.edges!.isNotEmpty ?
                       ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            var usuario = _controllerGitHolmes.resultadoPesquisa.edges![index]!.node!;
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/telaPerfilUsuario', arguments: usuario);
                                },
                                child: ItemDetalhesDoUsuario(usuario: usuario));
                          },
                          itemCount: _controllerGitHolmes.resultadoPesquisa.edges!.length)
                    : const EmptyWidget(imagem: EmptyImage.semResultado,titulo: "Ops!",mensagem: "o nome ou apelido buscado não correspondeu a nenhuma busca",);
                    case StatusConsulta.carregando:
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 200),
                        child: const CircularProgressIndicator(),
                      );
                    case StatusConsulta.falha:
                      return const EmptyWidget(
                        imagem: EmptyImage.falha,
                        titulo: "Ops!",
                        mensagem: "Não foi possível concluir sua solicitação",
                      );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
