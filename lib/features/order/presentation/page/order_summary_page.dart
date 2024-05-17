import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/widget/base_view.dart';

@RoutePage()
class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseView(
        title: "Order Summary",
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Information"),
            ],
          ),
        ));
  }
}
