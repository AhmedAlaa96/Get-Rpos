import 'dart:convert';
import 'dart:io';

import 'package:candidate_mobile_application/Models/RepoModel.dart';
import 'package:candidate_mobile_application/resources/AppStrings.dart';
import 'package:date_format/date_format.dart';

import 'package:http/http.dart' show Response;
import 'package:http/http.dart' as http;


/// <h2> [ApiManager] <p>Class used to handle network call with github api</p></h2>
class ApiManager{

  Map<String,String> _mapHeader = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.acceptCharsetHeader: "UTF-8",
  };
  /// <h2>[getRepos] <p>Function has no parameters returns list of <u>[RepoModel]</u> according to last week and order by watchers</p></h2>
  Future<List<RepoModel>> getRepos() async{
    final date = DateTime.now().subtract(Duration(days: 7));
    String dateFormat = formatDate(date, ["yyyy","-","mm","-","dd"]);

    var response = await get(AppStrings.apiUrl+"search/repositories?q=created:>$dateFormat&sort=stars&order=decs");
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      List<RepoModel>repoModels = List<RepoModel>();
      for(var item in jsonData['items']){
          repoModels.add(RepoModel.fromJson(item));
      }
      return repoModels;
    }
    return null;
  }

  /// <h2>[get]<p>Function it's simplified function of http get request</p></h2>
  /// <br><b><u>Params: </u></b>[apiUrl] a String parameter contain get request link and query parameters
  /// <br><b><u>Return</u></b> [Response] object contains repos data
  Future<Response> get(
      String apiUrl) async {
    try {

      final response = await http.get(Uri.encodeFull(apiUrl), headers: _mapHeader);

      return response;
    } catch (e) {
      print("get req Failed $e");
    }
  }

}