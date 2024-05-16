import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/constant/firestore_collection.dart';
import 'package:shoesly/core/model/application_user.dart';
import 'package:shoesly/features/brand/data/repository/i_brand_repository.dart';
import 'package:shoesly/features/product/data/model/product.dart';
import 'package:shoesly/features/product/data/model/product_filter.dart';
import 'package:shoesly/features/product/data/repository/i_product_repository.dart';
import 'package:shoesly/features/review/data/model/review.dart';

@injectable
class DatabaseSeeder {
  final FirebaseFirestore db;
  final IBrandRepository brandRepository;
  final IProductRepository productRepository;
  DatabaseSeeder(this.db, this.brandRepository, this.productRepository);

  Future<void> seed() async {
    await seedProducts();
  }

  Future<void> seedProducts() async {
    final brands = (await brandRepository.getBrands()).data ?? [];
    final nike = brands.firstWhere((element) => element.name == "Nike");
    final adidas = brands.firstWhere((element) => element.name == "Adidas");
    final rebook = brands.firstWhere((element) => element.name == "Reebook");
    final puma = brands.firstWhere((element) => element.name == "Puma");
    final vans = brands.firstWhere((element) => element.name == "Vans");
    final products = [
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          image:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fimage_1__1_-removebg-preview.png?alt=media&token=781d8314-43f3-4ac9-b95c-0f7e24224c81",
          price: 235,
          brand: nike,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [],
          gender: Gender.unisex),

      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          image:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fimage_19-removebg-preview.png?alt=media&token=b7568eca-168b-4f31-a002-2429b9751936",
          price: 235,
          brand: nike,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          image:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2FProduct.png?alt=media&token=eee018a8-59ac-428e-ba15-37ccac62aefe",
          price: 235,
          brand: adidas,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          image:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2FProduct__1_-removebg-preview.png?alt=media&token=bca028bc-ea93-43d1-b5ae-78c342420e49",
          price: 235,
          brand: rebook,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [],
          gender: Gender.unisex),

      //

      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          image:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fimage_26-removebg-preview.png?alt=media&token=1cbed0dc-9b7b-4fcb-99b2-4503ededdb83",
          price: 235,
          brand: puma,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          image:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fimage_9-removebg-preview.png?alt=media&token=1b0b0d08-0349-4c46-8a10-59a71d7fe17f",
          price: 235,
          brand: vans,
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [],
          gender: Gender.unisex),
    ];

    for (var product in products) {
      product.createdAt = DateTime.now();
      final json = product.toJson();
      json["createdAt"] = product.createdAt?.toIso8601String();
      await db.collection(FirestoreCollection.products).add(json);
    }
  }

  Future<void> seedReviews() async {
    final products =
        (await productRepository.getProducts(filter: ProductFilter())).data ??
            [];

    for (var product in products) {
      for (var i = 0; i < 10; i++) {
        final review = Review(
            id: "",
            productId: product.id!,
            score: 4.5,
            createdAt: DateTime.now(),
            user: ApplicationUser(
                id: "",
                name: "Nolan Cardor",
                imageUrl:
                    "https://c7.alamy.com/comp/2PWERD5/student-avatar-illustration-simple-cartoon-user-portrait-user-profile-icon-youth-avatar-vector-illustration-2PWERD5.jpg"),
            content: "Perfect for keeping your feet dry and warm in damp");
        final json = review.toJson();
        json["createdAt"] = review.createdAt.toIso8601String();
        await db
            .collection(FirestoreCollection.productReviews)
            .doc(product.id)
            .collection("reviews")
            .add(json);
      }
    }
  }
}
