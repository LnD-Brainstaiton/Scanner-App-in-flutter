import '../../core/model/github_search_query_param.dart';
import '../model/github_project_search_response.dart';

abstract class GithubRepository {
  Future<GithubProjectSearchResponse> searchProject(
      GithubSearchQueryParam queryParam);

  Future<Item> getProject(String userName, String repositoryName);
}
