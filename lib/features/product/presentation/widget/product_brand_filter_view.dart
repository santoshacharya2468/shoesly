import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/widget/error_view.dart';
import 'package:shoesly/core/widget/loading_place_holder.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';
import 'package:shoesly/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:shoesly/features/brand/presentation/widget/single_brand_view.dart';

class ProductBrandFilterView extends StatefulWidget {
  final void Function(Brand? brand) onSelected;
  final Brand? selectedBrand;
  const ProductBrandFilterView(
      {super.key, required this.onSelected, required this.selectedBrand});

  @override
  State<ProductBrandFilterView> createState() => _ProductBrandFilterViewState();
}

class _ProductBrandFilterViewState extends State<ProductBrandFilterView> {
  final BrandBloc brandBloc = getIt<BrandBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Brands",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 08,
        ),
        BlocProvider(
          create: (context) => brandBloc..add(const BrandEvent.getBrands()),
          child: SizedBox(
            height: 100,
            child:
                BlocBuilder<BrandBloc, BrandState>(builder: (context, state) {
              return state.when(
                  initial: loadingView,
                  loading: loadingView,
                  error: errorView,
                  loaded: (brands) {
                    return ListView.builder(
                      itemCount: brands.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final brand = brands[index];
                        return SingleBrandView(
                          brand: brand,
                          type: ViewType.circularType,
                          selected: widget.selectedBrand == brand,
                          onPressed: () {
                            setState(() {
                              widget.onSelected(brand);
                            });
                          },
                        );
                      },
                    );
                  });
            }),
          ),
        ),
      ],
    );
  }
}
