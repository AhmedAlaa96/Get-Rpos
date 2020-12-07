import 'package:auto_size_text/auto_size_text.dart';
import 'package:candidate_mobile_application/Components/LoadingIndicator.dart';
import 'package:candidate_mobile_application/Components/RepoListItem.dart';
import 'package:candidate_mobile_application/Models/RepoModel.dart';
import 'package:candidate_mobile_application/Providers/ApiManager.dart';
import 'package:candidate_mobile_application/Components/RepoCard.dart';
import 'package:candidate_mobile_application/resources/AppColors.dart';
import 'package:candidate_mobile_application/resources/AppDimens.dart';
import 'package:candidate_mobile_application/resources/AppStrings.dart';
import 'package:candidate_mobile_application/resources/AppStyles.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Repos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _body;
  List<RepoModel> repoModels;

  @override
  void initState() {
    _body = Container();
    getData();
    super.initState();
  }

  /// [getData] getData from Api using [ApiManager().getRepos()]
  void getData() async{
    repoModels = await ApiManager().getRepos();


    setState(()=>  _body = _gridViewWidget());
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            AppStrings.titleText,
            style: AppStyles.titleStyle.copyWith(color: AppColors.whiteColor,fontSize: AppDimens.size24Px),
            maxLines: 1,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: ()=> setState(()=> _body = _gridViewWidget()),
                autofocus: true,
            ),
            IconButton(
                icon: Icon(Icons.list_outlined),
                onPressed: ()=> setState(()=> _body = _listViewWidget())
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: repoModels != null &&  repoModels.length > 0 ? _body :LoadingIndicator()
              )
            ],
          ),
        ),

      ),
    );
  }

  /// [listViewWidget] function return list view widget
  Widget _listViewWidget() => ListView.builder(
    itemCount: repoModels.length,
    itemBuilder: (context,index) =>  RepoListItem(repoModels[index]),
    shrinkWrap: true,
    physics: ScrollPhysics(),
  );


  /// [gridViewWidget] function return grid view widget
  Widget _gridViewWidget() => GridView.builder(
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    physics: ScrollPhysics(),
    itemCount: repoModels.length,
    itemBuilder: (BuildContext context, int index){
    return RepoCard(repoModels[index]);
    }
  );
}
