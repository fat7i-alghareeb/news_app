import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/functions/remove_empty_fields.dart';
import '../../../data/models/article.dart';
import '../../../data/repo/news_repo_impl.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepoImp newsRepo;
  NewsCubit(this.newsRepo) : super(NewsInitial());
  List<Article> _news = [];
  List<Article> _latestNews = [];
  void fetchNews(String category) async {
    emit(NewsLoading());

    final results = await newsRepo.fetchNews(category);
    results.fold(
      (failure) {
        emit(NewsFailure(message: failure.message));
      },
      (news) {
        final List<Article> filteredNews = removeEmptyFields(news);
        _latestNews = filteredNews.sublist(
          0,
          (filteredNews.length * .3).toInt(),
        );
        filteredNews.removeRange(
          0,
          (filteredNews.length * .3).toInt(),
        );
        _news = filteredNews;
        emit(NewsLoaded(news: _news, latestNews: _latestNews));
      },
    );
  }

  get news => _news;
  get latestNews => _latestNews;
}
