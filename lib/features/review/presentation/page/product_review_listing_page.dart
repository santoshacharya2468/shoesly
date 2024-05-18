import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/enum/review_score_filter.dart';
import 'package:shoesly/core/widget/app_list_view.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/error_view.dart';
import 'package:shoesly/core/widget/loading_place_holder.dart';
import 'package:shoesly/core/widget/star_view.dart';
import 'package:shoesly/features/product/data/model/product.dart';
import 'package:shoesly/features/review/data/model/review_filter.dart';
import 'package:shoesly/features/review/presentation/bloc/review_bloc.dart';
import 'package:shoesly/features/review/presentation/widget/review_filter_view.dart';
import 'package:shoesly/features/review/presentation/widget/single_review_view.dart';

@RoutePage()
class ProductReviewListingPage extends StatefulWidget {
  final Product product;
  const ProductReviewListingPage({super.key, required this.product});

  @override
  State<ProductReviewListingPage> createState() =>
      _ProductReviewListingPageState();
}

class _ProductReviewListingPageState extends State<ProductReviewListingPage> {
  ReviewScoreFilter scoreFilter = ReviewScoreFilter.all;
  final ReviewBloc bloc = getIt<ReviewBloc>();

  void loadReviews() {
    final filter = ReviewFilter(count: 100, scoreFilter: scoreFilter);
    bloc.add(
        ReviewEvent.getReviews(productId: widget.product.id!, filter: filter));
  }

  @override
  void initState() {
    super.initState();
    loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return BaseView(
        title: "Reviews(${product.totalReviews})",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: StarAndAvgScoreView(
              avgScore: product.avgRating,
            ),
          ),
        ],
        body: BlocProvider(
          create: (context) => bloc,
          child: Column(
            children: [
              ReviewFilterView(
                selected: scoreFilter,
                filter: (f) {
                  setState(() {
                    scoreFilter = f;
                  });
                  loadReviews();
                },
              ),
              Expanded(child: BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                return state.when(
                    initial: loadingView,
                    loading: loadingView,
                    error: errorView,
                    loaded: (reviews) {
                      return AppListView(
                          itemCount: reviews.length,
                          noDatatext: "No reviews found",
                          itemBuilder: (context, index) {
                            final review = reviews[index];
                            return SingleReviewView(
                              review: review,
                            );
                          });
                    });
              }))
            ],
          ),
        ));
  }
}
