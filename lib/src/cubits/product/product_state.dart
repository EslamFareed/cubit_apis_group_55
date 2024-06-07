part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}


class LoadingGetProducts extends ProductState{}
class SuccessGetProducts extends ProductState{}
class ErrorGetProducts extends ProductState{}