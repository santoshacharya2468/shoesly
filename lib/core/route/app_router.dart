import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/features/cart/presentation/page/cart_page.dart';
import 'package:shoesly/features/product/data/model/product.dart';
import 'package:shoesly/features/product/data/model/product_filter.dart';
import 'package:shoesly/features/product/presentation/page/product_dashboard_page.dart';
import 'package:shoesly/features/product/presentation/page/product_details_page.dart';
import 'package:shoesly/features/product/presentation/page/product_filter_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: ProductDashboardRoute.page, initial: true),
        AutoRoute(
          page: ProductDetailsRoute.page,
        ),
        AutoRoute(
          page: ProductFilterRoute.page,
        ),
      ];
}
