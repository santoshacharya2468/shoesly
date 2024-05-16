import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/widget/app_card.dart';
import 'package:shoesly/core/widget/app_netork_image.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';
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
  final CartBloc _cartBloc = getIt<CartBloc>();

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return BaseView(
        title: "",
        actions: [
          CartIconButton(onpressed: () {
            _cartBloc.add(CartEvent.addToCart(AddToCartRequestModel(
                product: product,
                quantity: 1,
                productColor: selectedColor,
                size: selectedSize)));
          })
        ],
        body: BlocProvider(
          create: (context) => _cartBloc,
          child: SingleChildScrollView(
            child: ColumnEachChildPadding(
              padding: const EdgeInsets.only(bottom: 08),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppCard(
                    child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          selectedColor == null
                              ? Colors.white
                              : selectedColor!.value,
                          BlendMode.hue,
                        ),
                        child: Hero(
                          tag: ObjectKey(product.id!).toString(),
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
                )),
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
          ),
        ));
  }
}
