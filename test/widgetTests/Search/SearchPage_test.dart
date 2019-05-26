import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/search/ApiProvider.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

void main() async {
  final util = new Util();
  const String SEARCH_QUERY = "test";

  final searchApiProvider = SearchApiProvider(
    query: SEARCH_QUERY,
  );
  searchApiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONProblemSearchResult();
    return Response(json.encode(mapJSON), 200);
  });

  final SearchPage searchPage = SearchPage(
    apiProvider: searchApiProvider,
  );
  
}