// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controlador_git_holmes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorGitHolmes on _ControladorGitHolmesBase, Store {
  final _$statusPesquisaAtom =
      Atom(name: '_ControladorGitHolmesBase.statusPesquisa');

  @override
  StatusConsulta get statusPesquisa {
    _$statusPesquisaAtom.reportRead();
    return super.statusPesquisa;
  }

  @override
  set statusPesquisa(StatusConsulta value) {
    _$statusPesquisaAtom.reportWrite(value, super.statusPesquisa, () {
      super.statusPesquisa = value;
    });
  }

  @override
  String toString() {
    return '''
statusPesquisa: ${statusPesquisa}
    ''';
  }
}
