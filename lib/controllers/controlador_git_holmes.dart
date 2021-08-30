import 'dart:developer';

import 'package:fluttergit/conection/github_graph.dart';
import 'package:fluttergit/models/git_xeroque_resultado.dart';
import 'package:fluttergit/util/status.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart' hide Store;
import 'package:mobx/mobx.dart';
part 'controlador_git_holmes.g.dart';

class ControladorGitHolmes = _ControladorGitHolmesBase with _$ControladorGitHolmes;

abstract class _ControladorGitHolmesBase with Store {
  @observable
  StatusConsulta statusPesquisa = StatusConsulta.carregando;
  late ResponsePesquisaXeroque resultadoPesquisa;
  void loadBase(Function() onDone) {
    Future.delayed(const Duration(seconds: 2)).then((_) => onDone());
  }

  void pesquisarNoGit(String? nome, {Function()? carregando, Function()? sucesso, Function(String)? falha}) {
    statusPesquisa = StatusConsulta.carregando;
    String query =
        '{ search(query: "${nome ?? ""} in:${nome ?? ""}:name ", type: USER, first: 10) { userCount edges { node { ... on User { login name location email company avatarUrl bio starredRepositories(orderBy: {field: STARRED_AT, direction: DESC}) { totalCount nodes { description name url } } } } } } } ';
    GetIt.I
        .get<GitHubGraphQL>()
        .client!
        .query(QueryOptions(
          document: gql(
            query,
          ),
        ))
        .then((value) {
      if (value.hasException) {
        falha?.call("Ops! Houve uma falha");
      } else {
        resultadoPesquisa = ResponsePesquisaXeroque.fromJson(value.data!["search"]);
        sucesso?.call();
      }
      statusPesquisa =  StatusConsulta.sucesso;
    }).catchError((onError) {
      falha?.call("");
      log(onError);
      statusPesquisa = StatusConsulta.falha;
    });
  }
}
