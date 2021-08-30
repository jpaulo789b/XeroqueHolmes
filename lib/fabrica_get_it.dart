import 'package:fluttergit/conection/github_graph.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:fluttergit/controllers/controlador_git_holmes.dart';
import 'package:fluttergit/controllers/controlador_storage.dart';
import 'package:fluttergit/controllers/navigator_controller.dart';
import 'package:get_it/get_it.dart';

Future<void> iniciarGetit(GetIt getIt) async {
  getIt.registerSingleton(ControladorNoSQL());
  await getIt.get<ControladorNoSQL>().initDatabase();
  getIt.registerSingleton(GitHubGraphQL());
  getIt.get<GitHubGraphQL>().initGraphGitClient();
  getIt.registerSingleton(ControladorApp());
  getIt.registerSingleton(NavigatorController());
  getIt.registerSingleton(ControladorGitHolmes());
}
