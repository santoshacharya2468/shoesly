import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/widget/app_netork_image.dart';
import 'package:shoesly/core/widget/app_outlined_text_button.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shoesly/features/cart/presentation/widget/add_to_cart_bottom_sheet_view.dart';
import 'package:shoesly/features/cart/presentation/widget/add_to_cart_success_bottom_sheet_view.dart';
import 'package:shoesly/features/cart/presentation/widget/cart_icon_button.dart';
import 'package:shoesly/features/product/data/model/product.dart';
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
  BlendMode lighten = BlendMode.color;
  int quantity = 1;
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
            loading: EasyLoading.show,
            failure: EasyLoading.showError);
      },
      child: BaseView(
          title: "",
          actions: const [CartIconButton()],
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3)), // changes position of shadow
            ]),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "\$${product.price * quantity}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const Spacer(),
                AppOutlinedTextButton(
                    text: "Add To Cart",
                    onPressed: () async {
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
                          //  constraints: const BoxConstraints(maxHeight: 280),
                          context: context,
                          builder: (_) => AddToCartBottomSheetView(
                                product: product,
                              ));

                      if (count != null) {
                        context.read<CartBloc>().add(CartEvent.addToCart(
                              AddToCartRequestModel(
                                  product: product,
                                  quantity: count,
                                  productColor: selectedColor,
                                  size: selectedSize),
                            ));
                      }
                    })
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: ColumnEachChildPadding(
              padding: const EdgeInsets.only(bottom: 08),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: BlendMode.values
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      lighten = e;
                                    });
                                  },
                                  child: Text(e.name)),
                            ))
                        .toList(),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Hero(
                        tag: ObjectKey(product.id!).toString(),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            selectedColor == null
                                ? Colors.transparent
                                : selectedColor!.value,
                            lighten,
                          ),
                          child: AppCachedNetworkImageView(
                            url: product.image,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 05,
                      child: ProductColorPicker(
                        selectedColor: selectedColor,
                        onColorSelected: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        colors: product.colors,
                      ),
                    )
                  ],
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyLarge,
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
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  product.description,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 12),
                ),
                ProductReviews(
                  productId: product.id!,
                )
              ],
            ),
          )),
    );
  }
}
