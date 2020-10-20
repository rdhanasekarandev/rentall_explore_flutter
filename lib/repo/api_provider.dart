import 'package:flutter/material.dart';
import 'package:rent_all_app/api/config/graphql_configuration.dart';
import 'package:rent_all_app/api/datamodal/api_datamodel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rent_all_app/api/query/graphql_query.dart';

class RepoProvider{

  GraphQlConfiguration graphQlConfiguration = GraphQlConfiguration();

  Future<List<Result>> getListing(){
    return graphQlConfiguration
              .getGraphQLClient()
              .query(QueryOptions(documentNode: gql(query)))
              .then((value) {
                return toApiDataModelRepo(value);
              });
  }

  Future<List<Result>> getMostViewdListing(){
    return graphQlConfiguration
        .getGraphQLClient()
        .query(QueryOptions(documentNode: gql(query)))
        .then((value) {
      return toMostViewedDataModelRepo(value);
    });
  }

  List<Result> toApiDataModelRepo(QueryResult queryResult){
    if(queryResult.hasException){
      print(queryResult.exception.toString());
      throw Exception();
    }
    if (queryResult.loading) {
      print("loading");
    }
    final list = queryResult.data['getRecommend']['results'] as List<dynamic>;

    return list.map((e) => Result.fromJson(e)).toList();
  }


  List<Result> toMostViewedDataModelRepo(QueryResult queryResult){
    if(queryResult.hasException){
      print(queryResult.exception.toString());
      throw Exception();
    }
    if (queryResult.loading) {
      print("loading");
    }
    final list = queryResult.data['getMostViewedListing']['results'] as List<dynamic>;

    return list.map((e) => Result.fromJson(e)).toList();
  }

}