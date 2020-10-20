import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rent_all_app/constants/const.dart';

class GraphQlConfiguration{
  static HttpLink httpLink=HttpLink(uri: endPoint);

  GraphQLClient _client;

  GraphQLClient getGraphQLClient() {
    _client ??= GraphQLClient(
      link: httpLink,
      cache: InMemoryCache(),
    );

    return _client;
  }
}