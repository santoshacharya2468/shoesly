import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/core/widget/app_card.dart';
import 'package:shoesly/core/widget/app_netork_image.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/core/widget/star_view.dart';
import 'package:shoesly/features/product/data/model/product.dart';

class SingleProductView extends StatelessWidget {
  final Product product;
  const SingleProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(ProductDetailsRoute(product: product));
      },
      child: Column(
        children: [
          Expanded(
            child: AppCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Hero(
                      tag: ObjectKey(product.id!).toString(),
                      child: AppCachedNetworkImageView(
                        url: product.image,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 15,
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.network(
                          product.brand.logo,
                          // ignore: deprecated_member_use
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ColumnEachChildPadding(
            padding: const EdgeInsets.only(top: 04),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 13),
              ),
              Row(
                children: [
                  StarAndAvgScoreView(
                    avgScore: product.avgRating,
                  ),
                  Text(
                    "(${product.totalReviews} Reviews)",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Text(
                "\$${product.price}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}
