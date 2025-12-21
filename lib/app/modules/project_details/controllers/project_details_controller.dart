import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class ProjectDetailsController extends BaseController {
  ProjectDetailsController(BuildContext context, {GithubProjectUiData? dataModel}) {
    _repository = Provider.of<GithubRepository>(context, listen: false);
    if (dataModel != null) {
      getGithubRepository(dataModel.ownerLoginName, dataModel.repositoryName);
    }
  }

  late final GithubRepository _repository;

  GithubProjectUiData _projectUiData = GithubProjectUiData();

  GithubProjectUiData get projectUiData => _projectUiData;

  void getGithubRepository(String userName, String repositoryName) {
    callDataService(
      _repository.getProject(userName, repositoryName),
      onSuccess: _handleProjectDetailsResponseSuccess,
    );
  }

  void _handleProjectDetailsResponseSuccess(Item project) {
    _projectUiData = GithubProjectUiData(
      repositoryName: project.name != null ? project.name! : "",
      ownerLoginName: project.owner != null ? project.owner!.login! : "",
      ownerAvatar: project.owner != null ? project.owner!.avatarUrl! : "",
      numberOfStar: project.stargazersCount ?? 0,
      numberOfFork: project.forks ?? 0,
      score: project.score ?? 0.0,
      watchers: project.watchers ?? 0,
      description: project.description ?? "",
    );
    notifyListeners();
  }
}
