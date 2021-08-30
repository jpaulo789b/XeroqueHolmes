import 'package:graphql/client.dart';

class GitHubGraphQL {
  GraphQLClient? client;
  void initGraphGitClient() {
    final Link _link = HttpLink(
      'https://api.github.com/graphql',
      defaultHeaders: {
        'Authorization': 'Bearer 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',
      },
    );

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
