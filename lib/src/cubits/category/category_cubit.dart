import 'package:bloc/bloc.dart';
import 'package:cubit_apis_group_55/core/db/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  //Todo Take one instance => use it from any widget
  static CategoryCubit get(context) => BlocProvider.of(context);

  List<String> categories = [];

  void getCategories() async {
    emit(LoadingGetCategories());
    try {
      var response = await DioHelper.dio
          .get("https://fakestoreapi.com/products/categories");

      if (response.statusCode == 200) {
        var list = response.data as List;

        categories = list.map((e) => e.toString()).toList();

        emit(SuccessGetCategories());
      } else {
        emit(ErrorGetCategories());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetCategories());
    }
  }
}
