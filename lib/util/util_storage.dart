import 'package:fluttergit/controllers/controlador_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

abstract class UtilStorage {
  var store = StoreRef.main();
  Database get getDb => GetIt.I.get<ControladorNoSQL>().getDb;
  
  Future<bool> salvarNoBanco(String keyRef,{List<Map<String,dynamic>>? lista, Map<String,dynamic>? objeto}) {
    if(objeto != null){
      return store.record(keyRef).put(getDb, objeto).then((value){
          return true;
      }).catchError((onError){
        return false;
      });
    } else if(lista != null) {
      return intMapStoreFactory.store(keyRef).addAll(getDb, lista).then((value){
        return true;
      }).catchError((onError){
        return false;
      });
    }else {
      return Future.value(false);
    }
  }

  Future<List<T>> queryLista<T>(String keyRef, {Function(List<T> items)? sucesso}){
    List<T> queryResult = [];
    return intMapStoreFactory.store(keyRef).find(getDb).then((values){
      for (var record in values) {
        queryResult.add(unmarshal(record.value,type: T));
      }
      sucesso?.call(queryResult);
      return queryResult;
    }).catchError((onError){
      return Future.value(queryResult);
    });
  }

  Future<bool> removerDoBanco(String keyRef){
    return store.record(keyRef).delete(getDb).then((value) 
      => true
      ).catchError((onError)
      => false
    );
  }

  Future<T> queryObjeto<T>(String keyRef,{Function(dynamic item)? sucesso}){
    return store.record(keyRef).get(getDb).then((value){
    sucesso?.call(unmarshal(value as Map,type: T));
      return unmarshal(value as Map,type: T);
    }).catchError((onError){
      return Future.value(null);
    }).then((value) => value as T);
  }
  
}



T unmarshal<T>(Map map, {Type? type}) {
  type ??= T;

  switch (type) {
    // case UsuarioAutorizar:
    //   return UsuarioAutorizar.fromJson(map) as T;
    // case EmpresaMaster:
    //   return EmpresaMaster.fromJson(map) as T;
    default:
      throw StateError('Unable to unmarshal value of type \'$type\'');
  }
}
