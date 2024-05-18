import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/core/widget/star_view.dart';
import 'package:shoesly/features/review/data/model/review.dart';

class SingleReviewView extends StatelessWidget {
  final Review review;
  const SingleReviewView({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            child: review.user.imageUrl != null
                ? CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(review.user.imageUrl!),
                  )
                : const CircleAvatar(),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: ColumnEachChildPadding(
            padding: const EdgeInsets.only(bottom: 4),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(review.user.name ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(review.createdAt.toString().split(" ").first,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith())
                ],
              ),
              Row(
                children: List.generate(
                    review.score.toInt(), (index) => const StarView()),
              ),
              Text(review.content)
            ],
          ))
        ],
      ),
    );
  }
}
