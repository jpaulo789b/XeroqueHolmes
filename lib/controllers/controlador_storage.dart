
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

part 'controlador_storage.g.dart';

class ControladorNoSQL = _ControladorNoSQLBase with _$ControladorNoSQL;

abstract class _ControladorNoSQLBase with Store {
  final DatabaseFactory _dbFactory = databaseFactoryIo;

  late Database db;

  Database get getDb => db;

  Future<void> initDatabase() async {
    var path = await getApplicationDocumentsDirectory();
    db = await _dbFactory.openDatabase("${path.path}/dbapp.appx");
  }
}

