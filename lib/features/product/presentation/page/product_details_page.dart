import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/core/widget/app_card.dart';
import 'package:shoesly/core/widget/app_indicator.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shoesly/features/cart/presentation/widget/add_to_cart_bottom_sheet_view.dart';
import 'package:shoesly/features/cart/presentation/widget/add_to_cart_success_bottom_sheet_view.dart';
import 'package:shoesly/features/cart/presentation/widget/cart_icon_button.dart';
import 'package:shoesly/features/cart/presentation/widget/price_total_and_action_button_view.dart';
import 'package:shoesly/features/product/data/model/product.dart';
import 'package:shoesly/features/product/presentation/page/app_outlined_button.dart';
import 'package:shoesly/features/product/presentation/widget/product_color_picker.dart';
import 'package:shoesly/features/product/presentation/widget/product_size_selector.dart';
import 'package:shoesly/features/review/presentation/widget/product_reviews.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  num? selectedSize;
  ProductColor? selectedColor;
  int quantity = 1;
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.whenOrNull(
            addToCartSuccess: () {
              EasyLoading.dismiss();
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const AddToCartSuccessBottomSheet());
            },
            addToCartState: EasyLoading.show,
            failure: EasyLoading.showError);
      },
      child: BaseView(
          title: "",
          actions: const [CartIconButton()],
          bottomNavigationBar: PriceTotalAndActionButtonView(
              buttonText: "Add To Cart",
              title: "Total Price",
              subTitle: "\$${product.price * quantity}",
              onButtonPressed: () async {
                if (selectedSize == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select size"),
                    ),
                  );
                  return;
                } else if (selectedColor == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select color"),
                    ),
                  );
                  return;
                }
                final count = await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => AddToCartBottomSheetView(
                          product: product,
                        ));

                if (count != null) {
                  if (mounted) {
                    // ignore: use_build_context_synchronously
                    context.read<CartBloc>().add(CartEvent.addToCart(
                          AddToCartRequestModel(
                              product: product,
                              quantity: count,
                              productColor: selectedColor,
                              size: selectedSize),
                        ));
                  }
                }
              }),
          body: SingleChildScrollView(
            child: ColumnEachChildPadding(
              padding: const EdgeInsets.only(bottom: 08),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppCard(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 12, left: 12, right: 12),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              selectedColor == null
                                  ? Colors.transparent
                                  : selectedColor!.value,
                              BlendMode.color),
                          child: Container(
                            color: Colors.white,
                            child: Image.asset("assets/icons/img.png"),
                            // child: AppCachedNetworkImageView(
                            //   url: product.images[imageIndex],
                            // ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(top: 12, left: 12, right: 12),
                      //   child: ColorFiltered(
                      //     colorFilter: ColorFilter.mode(
                      //       selectedColor == null
                      //           ? Colors.transparent
                      //           : selectedColor!.value,
                      //       BlendMode.hue,
                      //     ),
                      //     child: Container(
                      //       color: Colors.red,
                      //       child: Hero(
                      //         tag: ObjectKey(product.id!).toString(),
                      //         child: AppCachedNetworkImageView(
                      //           url: product.images[imageIndex],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                                children: List.generate(
                                    product.images.length,
                                    (index) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: AppIndicator(
                                            color: index == imageIndex
                                                ? Theme.of(context).primaryColor
                                                : const Color(0xffB7B7B7),
                                          ),
                                        ))),
                            ProductColorPicker(
                              selectedColor: selectedColor,
                              onColorSelected: (color) {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                              colors: product.colors,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                    Text(
                      " ${product.avgRating}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 04,
                    ),
                    Text(
                      "(${product.totalReviews} Reviews)",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                ProductSizeSelector(
                  selectedSize: selectedSize,
                  options: product.sizes,
                  onSizeSelected: (size) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                ),
                Text("Description",
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  product.description,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 12),
                ),
                ProductTopReviewView(
                  productId: product.id!,
                  totalReview: product.totalReviews,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppOutlinedButton(
                      title: "SEE ALL REVIEWS",
                      onPressed: () {
                        context.router
                            .push(ProductReviewListingRoute(product: product));
                      }),
                )
              ],
            ),
          )),
    );
  }
}
