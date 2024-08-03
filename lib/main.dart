import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/cubit/product_cubit.dart';
import 'home/product_page.dart';
import 'home/service/api_service.dart';

void main() {
  final ApiService apiService = ApiService(baseUrl: 'https://fakestoreapi.com');
  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
        ProductCubit(apiService: apiService)..fetchProducts(),
        child: const ProductPage(),
      ),
    );
  }
}
