import 'package:cubit_apis_group_55/core/utils/show_snack.dart';
import 'package:cubit_apis_group_55/src/cubits/category/category_cubit.dart';
import 'package:cubit_apis_group_55/src/cubits/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit.get(context).getProducts();
    CategoryCubit.get(context).getCategories();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is LoadingGetCategories) {
                  return const Center(child: CircularProgressIndicator());
                }

                var list = CategoryCubit.get(context).categories;
                return SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Text(list[index]),
                      );
                    },
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              },
            ),
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is ErrorGetProducts) {
                  ShowSnack.showMessage(context,
                      "Error in getting products, please try again later");
                }
              },
              builder: (context, state) {
                if (state is LoadingGetProducts) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                    ),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
                var list = ProductCubit.get(context).products;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(list[index].image!),
                        ),
                        title: Text(list[index].title!),
                        subtitle: Text(
                            "${list[index].category} - ${list[index].price}"),
                      ),
                    );
                  },
                  itemCount: list.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
