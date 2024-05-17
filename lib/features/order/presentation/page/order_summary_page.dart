import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/extension/cart_extension.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';
import 'package:shoesly/features/cart/presentation/widget/price_total_and_action_button_view.dart';
import 'package:shoesly/features/order/data/model/add_order_request.dart';
import 'package:shoesly/features/order/presentation/bloc/order_bloc.dart';
import 'package:shoesly/features/order/presentation/widget/order_summary_cart_item_view.dart';
import 'package:shoesly/features/order/presentation/widget/order_summary_price_view.dart';

@RoutePage()
class OrderSummaryPage extends StatefulWidget {
  final List<CartItem> carts;
  const OrderSummaryPage({super.key, required this.carts});

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  final OrderBloc _orderBloc = getIt<OrderBloc>();
  final double shippingFee = 20;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _orderBloc,
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.when(
              initial: () {},
              loading: () {
                EasyLoading.show(status: "Placing your order");
              },
              success: () {
                EasyLoading.showSuccess("Your order has been placed");
                context.router.pushAndPopUntil(const ProductDashboardRoute(),
                    predicate: (f) => false);
              },
              failure: EasyLoading.showError);
        },
        child: BaseView(
            title: "Order Summary",
            bottomNavigationBar: PriceTotalAndActionButtonView(
              title: "Grand Total",
              subTitle: "\$${widget.carts.total.toStringAsFixed(2)}",
              buttonText: "CHECK OUT",
              onButtonPressed: () {
                _orderBloc.add(OrderEvent.addOrder(
                    order: AddOrderRequest(
                  items: widget.carts,
                  subTotal: widget.carts.total,
                  shippingFee: shippingFee,
                  shippingAddress:
                      ShippingAddress(address: "Semarang, Indonesia"),
                  total: widget.carts.total + shippingFee,
                  paymentMethod: PaymentMethod.cash,
                )));
              },
            ),
            body: SingleChildScrollView(
              child: ColumnEachChildPadding(
                crossAxisAlignment: CrossAxisAlignment.start,
                padding: const EdgeInsets.only(bottom: 10),
                children: [
                  _titleView("Information"),
                  _buildTileAction(
                    title: "Payment Method",
                    subtitle: "Credit Card",
                  ),
                  const Divider(),
                  _buildTileAction(
                    title: "Location",
                    subtitle: "Semarang, Indonesia",
                  ),
                  OrderSummaryCartItemView(
                    items: widget.carts,
                  ),
                  OrderSummaryPriceView(
                    subTotal: widget.carts.total,
                    shippingFee: shippingFee,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _titleView(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget _buildTileAction({required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              // style: Theme.of(context).textTheme.,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
        const Icon(
          Icons.chevron_right,
          color: Colors.grey,
          size: 15,
        )
      ],
    );
  }
}
