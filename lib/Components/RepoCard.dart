import 'package:auto_size_text/auto_size_text.dart';
import 'package:candidate_mobile_application/Models/RepoModel.dart';
import 'package:candidate_mobile_application/Utils/Utils.dart';
import 'package:candidate_mobile_application/resources/AppColors.dart';
import 'package:candidate_mobile_application/resources/AppDimens.dart';
import 'package:candidate_mobile_application/resources/AppStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class RepoCard extends StatelessWidget {

  RepoModel _repoModel;

  /// Constructor
  /// @Params [repoModel] RepoModel object for view repo's data in the card
  RepoCard(this._repoModel);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      return GestureDetector(
        /// OnTap card go to repo url
        onTap: ()=> Utils.openRepoUrl(this._repoModel.repoUrl),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.90,
            minHeight: 200,
          ),
          child: Card(
            semanticContainer: false,
            color: AppColors.whiteColor,
            elevation: AppDimens.elevation11Px,
            margin: EdgeInsets.all(AppDimens.margin8Px),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radius8Px),
            ),
            child: Container(
              padding: EdgeInsets.all(AppDimens.padding8Px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: AppDimens.margin8Px,top:AppDimens.margin8Px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          this._repoModel.title,
                          style:AppStyles.titleStyle,
                          maxLines: 1,
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(AppDimens.margin8Px),
                    child: AutoSizeText(
                      this._repoModel.description == null?"Description is not provided":this._repoModel.description,
                      style:AppStyles.descriptionStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(AppDimens.margin8Px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        this._repoModel.language == null ? Container():
                        Container(width: AppDimens.size12Px,height: AppDimens.size12Px,
                          decoration: BoxDecoration(
                            color: Utils.fromStringToColor(AppColors.languageColors[this._repoModel.language]),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: AppDimens.margin4Px),
                          child: AutoSizeText(
                            this._repoModel.language??"Language is not provided",
                            style:AppStyles.languageStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(right: AppDimens.margin8Px,left: AppDimens.margin8Px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            this._repoModel.avatarUrl == null ? Container():
                            Container(
                              width: AppDimens.size24Px,
                              height: AppDimens.size24Px,
                              color: Colors.transparent,
                              child: CircleAvatar(
                                radius: AppDimens.radius30Px,
                                backgroundImage:
                                NetworkImage(this._repoModel.avatarUrl),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            this._repoModel.owner == null ? Container():
                            Container(
                              margin: EdgeInsets.only(left: AppDimens.margin4Px),
                              child: AutoSizeText(
                                this._repoModel.owner,
                                style:AppStyles.languageStyle,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(child: Icon(Icons.remove_red_eye,color: AppColors.greyColor,)),

                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: AppDimens.margin4Px),
                              child: AutoSizeText(
                                this._repoModel.watchers.toString(),
                                style:AppStyles.watchersStyle,
                                maxLines: 1,
                                overflow:TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ]
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      );
    });
  }




}


