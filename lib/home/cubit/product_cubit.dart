import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/product_model.dart';
import '../service/api_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiService apiService;
  ProductCubit({required this.apiService}) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await apiService.fetchProducts();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
