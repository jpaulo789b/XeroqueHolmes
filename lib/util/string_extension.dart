String capitalize(String? s) {
  s = (s ?? "").toLowerCase();
  if (s.isEmpty) return "";
  return s[0].toUpperCase() + s.substring(1);
}

String camelCase(String? s) {
  if (s == null) return "";
  s = s.toLowerCase();
  String retorno = "";
  var d = s.split(" ");
  for (var element in d) {
    retorno += capitalize(element) + " ";
  }
  return retorno.trim();
}

String formarMaxChars(String? name, int? size) {
  if ( name == null || name.isEmpty ) {
    return "";
  } else {
    var add = 0;
    var retorno = "";
    name.split(" ").forEach((element) {
      if (add <= 1) {
        add++;
        retorno += element+" ";
      }
    });
    return retorno.isNotEmpty ? retorno:name;
  }
}

String removeSpecialChars(String s) {
  return s;
}
