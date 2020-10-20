import 'package:flutter/cupertino.dart';
import 'package:rent_all_app/repo/api_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'api_datamodel.dart';

class ListingBloc{

  final recommendedList = BehaviorSubject<List<Result>>();
  final mostViewedList = BehaviorSubject<List<Result>>();
  final RepoProvider repoProvider;

  ListingBloc({
    @required this.repoProvider
  }){
    getRepos()
        .then(recommendedList.add)
        .catchError((err) => print('Error getting repo ${err.toString()}'));
    getRepoMostViewed()
        .then(mostViewedList.add)
        .catchError((err)=>print('Error getting repo ${err.toString()}'));
  }

  Future<List<Result>> getRepos() async {
    return await repoProvider.getListing();
  }

  Future<List<Result>> getRepoMostViewed() async {
    return await repoProvider.getMostViewdListing();
  }

  void dispose() {
    recommendedList.close();
    mostViewedList.close();
  }

}