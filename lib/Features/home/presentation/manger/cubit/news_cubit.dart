import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/functions/remove_empty_fields.dart';
import '../../../data/models/news.dart';
import '../../../data/repo/news_repo_impl.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepoImp newsRepo;
  NewsCubit(this.newsRepo) : super(NewsInitial());
  List<News> _news = [];
  List<News> _latestNews = [];
  void fetchNews(String category) async {
    emit(NewsLoading());

    final results = await newsRepo.fetchNews(category);
    results.fold((failure) {
      emit(NewsFailure(message: failure.message));
    }, (news) {
      final List<News> filteredNews = removeEmptyFields(news);
      _latestNews = filteredNews.sublist(0, 6);
      filteredNews.removeRange(0, 6);
      _news = filteredNews;
      emit(NewsLoaded(news: _news, latestNews: _latestNews));
    });
  }

  get news => _news;
  get latestNews => _latestNews;
}
