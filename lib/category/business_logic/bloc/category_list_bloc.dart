import 'package:bloc/bloc.dart';
import 'package:marketplace/category/data/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final CategoryRepository repository;
  CategoryListBloc({required this.repository}) : super(CategoryListInitial()) {
    on<FetchCategoryListEvent>((event, emit) async {
      try {
        emit(FetchCategoryListLoading());

        final categories = await repository.fetchCategories();

        emit(FetchCategoryListSuccess(categories: categories));
      } catch (e) {
        emit(FetchCategoryListFailure(message: e.toString()));
      }
    });
  }
}
