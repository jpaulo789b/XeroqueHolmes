import 'package:json_annotation/json_annotation.dart';
part 'git_xeroque_resultado.g.dart';

@JsonSerializable()
class FavoReposUsuario {
  factory FavoReposUsuario.fromJson(Map<String, dynamic> json) => _$FavoReposUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$FavoReposUsuarioToJson(this);
  FavoReposUsuario clone() => _$FavoReposUsuarioFromJson(toJson());

  String? description;
  String? name;
  String? url;

  FavoReposUsuario({
    this.description,
    this.name,
    this.url,
  });
}

@JsonSerializable()
class ResponseFavoReposUsuario {
  factory ResponseFavoReposUsuario.fromJson(Map<String, dynamic> json) => _$ResponseFavoReposUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseFavoReposUsuarioToJson(this);
  ResponseFavoReposUsuario clone() => _$ResponseFavoReposUsuarioFromJson(toJson());
  int? totalCount;
  List<FavoReposUsuario?>? nodes;

  ResponseFavoReposUsuario({
    this.totalCount,
    this.nodes,
  });
 
}

@JsonSerializable()
class DetalheUsuario {
  factory DetalheUsuario.fromJson(Map<String, dynamic> json) => _$DetalheUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$DetalheUsuarioToJson(this);
  DetalheUsuario clone() => _$DetalheUsuarioFromJson(toJson());

  String? login;
  String? name;
  String? location;
  String? email;
  String? company;
  String? avatarUrl;
  String? bio;
  ResponseFavoReposUsuario? starredRepositories;

  DetalheUsuario({
    this.login,
    this.name,
    this.location,
    this.email,
    this.company,
    this.avatarUrl,
    this.bio,
    this.starredRepositories,
  });
  
}

@JsonSerializable()
class ResponseDetalheUsuario {
  factory ResponseDetalheUsuario.fromJson(Map<String, dynamic> json) => _$ResponseDetalheUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDetalheUsuarioToJson(this);
  ResponseDetalheUsuario clone() => _$ResponseDetalheUsuarioFromJson(toJson());

  DetalheUsuario? node;

  ResponseDetalheUsuario({
    this.node,
  });
 
}

@JsonSerializable()
class ResponsePesquisaXeroque {
  factory ResponsePesquisaXeroque.fromJson(Map<String, dynamic> json) => _$ResponsePesquisaXeroqueFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePesquisaXeroqueToJson(this);
  ResponsePesquisaXeroque clone() => _$ResponsePesquisaXeroqueFromJson(toJson());
  int? userCount;
  List<ResponseDetalheUsuario?>? edges;

  ResponsePesquisaXeroque({
    this.userCount,
    this.edges,
  });
  
}
