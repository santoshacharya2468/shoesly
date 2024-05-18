// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/brand/data/repository/brand_repository.dart' as _i9;
import '../../features/brand/data/repository/i_brand_repository.dart' as _i8;
import '../../features/brand/presentation/bloc/brand_bloc.dart' as _i18;
import '../../features/cart/data/repository/cart_repository.dart' as _i11;
import '../../features/cart/data/repository/i_cart_repository.dart' as _i10;
import '../../features/cart/presentation/bloc/cart_bloc.dart' as _i19;
import '../../features/order/data/repository/i_order_repository.dart' as _i5;
import '../../features/order/data/repository/order_repository.dart' as _i6;
import '../../features/order/presentation/bloc/order_bloc.dart' as _i7;
import '../../features/product/data/repository/i_product_repository.dart'
    as _i12;
import '../../features/product/data/repository/product_repository.dart' as _i13;
import '../../features/product/presentation/bloc/product_bloc.dart' as _i17;
import '../../features/review/data/repository/i_review_repository.dart' as _i14;
import '../../features/review/data/repository/review_repository.dart' as _i15;
import '../../features/review/presentation/bloc/review_bloc.dart' as _i16;
import '../../seeder.dart' as _i20;
import 'module_injection.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    gh.singleton<_i3.FirebaseFirestore>(() => localModule.firestore());
    gh.singleton<_i4.FirebaseAuth>(() => localModule.firebaseAuth());
    gh.factory<_i5.IOrderRepository>(() => _i6.OrderRepository(
          db: gh<_i3.FirebaseFirestore>(),
          auth: gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i7.OrderBloc>(() => _i7.OrderBloc(gh<_i5.IOrderRepository>()));
    gh.factory<_i8.IBrandRepository>(
        () => _i9.BrandRepository(db: gh<_i3.FirebaseFirestore>()));
    gh.factory<_i10.ICartRepository>(
        () => _i11.CartRepository(db: gh<_i3.FirebaseFirestore>()));
    gh.factory<_i12.IProductRepository>(
        () => _i13.ProductRepository(db: gh<_i3.FirebaseFirestore>()));
    gh.factory<_i14.IReviewRepository>(
        () => _i15.ReviewRepository(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i16.ReviewBloc>(
        () => _i16.ReviewBloc(gh<_i14.IReviewRepository>()));
    gh.factory<_i17.ProductBloc>(
        () => _i17.ProductBloc(gh<_i12.IProductRepository>()));
    gh.factory<_i18.BrandBloc>(
        () => _i18.BrandBloc(gh<_i8.IBrandRepository>()));
    gh.factory<_i19.CartBloc>(() => _i19.CartBloc(
          gh<_i10.ICartRepository>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i20.DatabaseSeeder>(() => _i20.DatabaseSeeder(
          gh<_i3.FirebaseFirestore>(),
          gh<_i8.IBrandRepository>(),
          gh<_i12.IProductRepository>(),
        ));
    return this;
  }
}

class _$LocalModule extends _i21.LocalModule {}
