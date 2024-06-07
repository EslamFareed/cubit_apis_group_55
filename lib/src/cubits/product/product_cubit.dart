import 'package:bloc/bloc.dart';
import 'package:cubit_apis_group_55/core/db/dio_helper.dart';
import 'package:cubit_apis_group_55/src/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];
  void getProducts() async {
    emit(LoadingGetProducts());
    try {
      var response =
          await DioHelper.dio.get("https://fakestoreapi.com/products");
      if (response.statusCode == 200) {
        var data = response.data as List;

        products = data.map((e) => ProductModel.fromJson(e)).toList();

        emit(SuccessGetProducts());
      } else {
        emit(ErrorGetProducts());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetProducts());
    }
  }
}
