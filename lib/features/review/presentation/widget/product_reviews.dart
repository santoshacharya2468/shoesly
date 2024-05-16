import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/widget/error_view.dart';
import 'package:shoesly/core/widget/loading_place_holder.dart';
import 'package:shoesly/features/review/presentation/bloc/review_bloc.dart';
import 'package:shoesly/features/review/presentation/widget/single_review_view.dart';

class ProductReviews extends StatefulWidget {
  final String productId;
  const ProductReviews({super.key, required this.productId});

  @override
  State<ProductReviews> createState() => _ProductReviewsState();
}

class _ProductReviewsState extends State<ProductReviews> {
  final ReviewBloc reviewBloc = getIt<ReviewBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          reviewBloc..add(ReviewEvent.getReviews(productId: widget.productId)),
      child: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          return state.when(
              initial: loadingView,
              loading: loadingView,
              error: errorView,
              loaded: (reviews) {
                return Column(
                  children: [
                    Text("Reviews",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return SingleReviewView(review: review);
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
