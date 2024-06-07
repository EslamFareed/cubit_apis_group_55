part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class LoadingGetCategories extends CategoryState{}
class SuccessGetCategories extends CategoryState{}
class ErrorGetCategories extends CategoryState{}