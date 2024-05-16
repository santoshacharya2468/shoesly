import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/features/brand/presentation/widget/brand_list_view.dart';
import 'package:shoesly/features/cart/presentation/widget/cart_icon_button.dart';
import 'package:shoesly/features/product/data/model/product_filter.dart';
import 'package:shoesly/features/product/presentation/bloc/product_bloc.dart';
import 'package:shoesly/features/product/presentation/widget/product_listing_view.dart';

@RoutePage()
class ProductDashboardPage extends StatefulWidget {
  const ProductDashboardPage({super.key});
  @override
  State<ProductDashboardPage> createState() => _ProductDashboardPageState();
}

class _ProductDashboardPageState extends State<ProductDashboardPage> {
  final ProductBloc productBloc = getIt<ProductBloc>();
  ProductFilter filter = ProductFilter();

  loadProducts() {
    productBloc.add(ProductEvent.getProducts(filter: filter));
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Discover",
        titleStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        actions: const [CartIconButton()],
        body: BlocProvider(
          create: (context) => productBloc,
          child: Column(
            children: [
              BrandListView(
                onSelected: (brand) {
                  filter = ProductFilter(brand: brand?.id);
                  loadProducts();
                },
              ),
              const Expanded(
                child: ProductListingView(),
              ),
            ],
          ),
        ));
  }
}
