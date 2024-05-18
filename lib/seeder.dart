import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_dart/faker_dart.dart' hide Gender;
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/constant/firestore_collection.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/enum/product_gender.dart';
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
    await seedReviews();
  }

  Future<void> seedProducts() async {
    final brands = (await brandRepository.getBrands()).data ?? [];
    final nike = brands.firstWhere((element) => element.name == "Nike");
    final adidas = brands.firstWhere((element) => element.name == "Adidas");
    final rebook = brands.firstWhere((element) => element.name == "Reebook");
    final puma = brands.firstWhere((element) => element.name == "Puma");
    final vans = brands.firstWhere((element) => element.name == "Vans");
    var products = [
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp1.png?alt=media&token=7a9775ab-30d4-4f4a-a682-e00435d8f747",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp1.png?alt=media&token=7a9775ab-30d4-4f4a-a682-e00435d8f747",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp1.png?alt=media&token=7a9775ab-30d4-4f4a-a682-e00435d8f747",
          ],
          price: 200,
          brand: nike,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile.png?alt=media&token=2a318da7-8f14-4d77-8945-207b123210ef",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.red],
          gender: Gender.unisex),

      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp2.png?alt=media&token=d7a58496-f1b5-41f0-86c4-939f21dc7a96",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp2.png?alt=media&token=d7a58496-f1b5-41f0-86c4-939f21dc7a96",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp2.png?alt=media&token=d7a58496-f1b5-41f0-86c4-939f21dc7a96",
          ],
          price: 250,
          brand: nike,
          avgRating: 4.5,
          totalReviews: 10,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(1).png?alt=media&token=773d22c2-60b0-4668-8c41-10989c1fc422",
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp3.png?alt=media&token=cc7ebff5-f29c-4f62-8352-79a269051641",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp3.png?alt=media&token=cc7ebff5-f29c-4f62-8352-79a269051641",
          ],
          price: 300,
          brand: adidas,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(2).png?alt=media&token=b05dd5c8-2037-4980-a1e0-37f8e36073c6",
          avgRating: 4.5,
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),

      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp5.png?alt=media&token=86274832-e88a-4488-9897-6f054c038ce5"
          ],
          price: 400,
          brand: puma,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(3).png?alt=media&token=6cc96beb-9fc7-452f-a648-d55bde7b5ef5",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [
            ProductColor.white,
            ProductColor.black,
          ],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp4.png?alt=media&token=aa410c52-5570-4378-bd4e-aa262f94506a"
          ],
          price: 500,
          brand: rebook,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(4).png?alt=media&token=f53bea1d-34ed-43c2-9527-048273c7570b",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.black, ProductColor.red],
          gender: Gender.unisex),

      //

      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp6.png?alt=media&token=c835cf87-8310-49fd-9280-d05f6f7d15bf",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp6.png?alt=media&token=c835cf87-8310-49fd-9280-d05f6f7d15bf",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp6.png?alt=media&token=c835cf87-8310-49fd-9280-d05f6f7d15bf",
          ],
          price: 700,
          brand: vans,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(5).png?alt=media&token=a0f05755-8b71-4fae-9fd7-8ade84c3a9be",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp7.png?alt=media&token=0ae3a489-d019-42b9-991c-8836f48a229f",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp7.png?alt=media&token=0ae3a489-d019-42b9-991c-8836f48a229f",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp7.png?alt=media&token=0ae3a489-d019-42b9-991c-8836f48a229f",
          ],
          price: 235,
          brand: vans,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(6).png?alt=media&token=9d48078a-285b-467d-a546-a26207475885",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp8.png?alt=media&token=b9c27b76-28e6-4636-873b-04f37113b173",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp8.png?alt=media&token=b9c27b76-28e6-4636-873b-04f37113b173"
          ],
          price: 1000,
          brand: vans,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(7).png?alt=media&token=9d9c4cac-6812-4ccb-8bde-514e27bcef1e",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp9.png?alt=media&token=da6335f9-9fee-4a31-879c-aa38fd31b906",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp9.png?alt=media&token=da6335f9-9fee-4a31-879c-aa38fd31b906"
                "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp9.png?alt=media&token=da6335f9-9fee-4a31-879c-aa38fd31b906"
          ],
          price: 1200,
          brand: vans,
          avgRating: 4.5,
          totalReviews: 10,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(8).png?alt=media&token=24d05c30-e194-4075-b684-962646331d33",
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),
      Product(
          id: "",
          name: "Jordan 1 Retro High Tie Dye",
          description:
              "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a",
          images: [
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp10.png?alt=media&token=ebae3ab8-f5d1-4c50-857a-833145bf0904",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp10.png?alt=media&token=ebae3ab8-f5d1-4c50-857a-833145bf0904",
            "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fp10.png?alt=media&token=ebae3ab8-f5d1-4c50-857a-833145bf0904",
          ],
          price: 1500,
          brand: vans,
          avgRating: 4.5,
          thumbnail:
              "https://firebasestorage.googleapis.com/v0/b/kbuddy-a6986.appspot.com/o/products%2Fthumbnails%2Ffile%20(9).png?alt=media&token=27860adf-27c5-4c32-bbf9-91da0f402b20",
          totalReviews: 10,
          sizes: [39, 39.5, 40, 40.5, 41],
          colors: [ProductColor.white, ProductColor.black, ProductColor.red],
          gender: Gender.unisex),
    ];
    final sortedproducts = products.reversed;

    for (var product in sortedproducts) {
      product.createdAt = DateTime.now();
      final json = product.toJson();
      json["createdAt"] = product.createdAt?.toIso8601String();
      await db.collection(FirestoreCollection.products).add(json);
    }
  }

  Future<void> seedReviews() async {
    final products =
        (await productRepository.getProducts(filter: ProductFilter(limit: 100)))
                .data ??
            [];

    for (var product in products) {
      for (var i = 0; i < 10; i++) {
        final review = Review(
            id: "",
            productId: product.id!,
            score: Faker.instance.datatype.number(min: 1, max: 5),
            createdAt: DateTime.now(),
            user: ApplicationUser(
                id: "",
                name: Faker.instance.name.fullName(),
                imageUrl:
                    "https://c7.alamy.com/comp/2PWERD5/student-avatar-illustration-simple-cartoon-user-portrait-user-profile-icon-youth-avatar-vector-illustration-2PWERD5.jpg"),
            content: Faker.instance.lorem.sentence());
        final json = review.toJson();
        json["createdAt"] = review.createdAt.toIso8601String();
        await db.collection(FirestoreCollection.productReviews).add(json);
      }
    }
  }
}
