// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_xeroque_resultado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoReposUsuario _$FavoReposUsuarioFromJson(Map<String, dynamic> json) =>
    FavoReposUsuario(
      description: json['description'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$FavoReposUsuarioToJson(FavoReposUsuario instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'url': instance.url,
    };

ResponseFavoReposUsuario _$ResponseFavoReposUsuarioFromJson(
        Map<String, dynamic> json) =>
    ResponseFavoReposUsuario(
      totalCount: json['totalCount'] as int?,
      nodes: (json['nodes'] as List<dynamic>?)
          ?.map((e) => FavoReposUsuario.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseFavoReposUsuarioToJson(
        ResponseFavoReposUsuario instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes,
    };

DetalheUsuario _$DetalheUsuarioFromJson(Map<String, dynamic> json) =>
    DetalheUsuario(
      login: json['login'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      starredRepositories: json['starredRepositories'] == null
          ? null
          : ResponseFavoReposUsuario.fromJson(
              json['starredRepositories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetalheUsuarioToJson(DetalheUsuario instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'company': instance.company,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'starredRepositories': instance.starredRepositories,
    };

ResponseDetalheUsuario _$ResponseDetalheUsuarioFromJson(
        Map<String, dynamic> json) =>
    ResponseDetalheUsuario(
      node: json['node'] == null
          ? null
          : DetalheUsuario.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseDetalheUsuarioToJson(
        ResponseDetalheUsuario instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

ResponsePesquisaXeroque _$ResponsePesquisaXeroqueFromJson(
        Map<String, dynamic> json) =>
    ResponsePesquisaXeroque(
      userCount: json['userCount'] as int?,
      edges: (json['edges'] as List<dynamic>?)
          ?.map(
              (e) => ResponseDetalheUsuario.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponsePesquisaXeroqueToJson(
        ResponsePesquisaXeroque instance) =>
    <String, dynamic>{
      'userCount': instance.userCount,
      'edges': instance.edges,
    };
