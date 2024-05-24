import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiring_test/features/category/model/category_model.dart';
import 'package:hiring_test/features/product/presentation/product_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryProvider = StreamProvider.autoDispose<List<CategoryModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('product_category')
      .snapshots()
      .map((event) {
    final list = <CategoryModel>[];
    list.add(CategoryModel(name: 'All', id: -1));
    for (var docs in event.docs) {
      list.add(CategoryModel.fromJson(docs.data()));
    }

    return list;
  });
});

class CategoryWidget extends StatefulHookConsumerWidget {
  const CategoryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends ConsumerState<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProvider);
    final category = ref.watch(filterProvider);
    return state.maybeWhen(orElse: () {
      return const SizedBox();
    }, data: (data) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: data.map((e) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () async {
                  ref
                      .read(filterProvider.notifier)
                      .update((state) => state.copyWith(
                            categoryModel: e,
                          ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  e.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: category.categoryModel?.id == e.id
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: category.categoryModel?.id == e.id
                        ? Colors.black
                        : Colors.black45,
                  ),
                ),
              ),
            ),
          );
        }).toList()),
      );
    });
  }
}

// final category = [
//     {
//       "id": 1,
//       "name": "Nike",
//       "slug": "nike",
//       "description":
//           "A global leader in athletic footwear, apparel, and equipment known for innovation and performance."
//     },
//     {
//       "id": 2,
//       "name": "Adidas",
//       "slug": "adidas",
//       "description":
//           "Renowned for its sportswear and shoes, blending performance and style for athletes and casual wearers alike."
//     },
//     {
//       "id": 3,
//       "name": "Puma",
//       "slug": "puma",
//       "description":
//           "Offers stylish and performance-oriented sportswear and footwear, known for its iconic designs and collaborations."
//     },
//     {
//       "id": 4,
//       "name": "Under Armour",
//       "slug": "under-armour",
//       "description":
//           "Specializes in high-performance sportswear and footwear, emphasizing innovation and technology."
//     },
//     {
//       "id": 5,
//       "name": "Reebok",
//       "slug": "reebok",
//       "description":
//           "A leading brand in fitness and lifestyle footwear and apparel, known for its heritage and contemporary designs."
//     },
//     {
//       "id": 6,
//       "name": "New Balance",
//       "slug": "new-balance",
//       "description":
//           "Combines function and fashion, producing footwear and apparel with a focus on performance and comfort."
//     },
//     {
//       "id": 7,
//       "name": "Asics",
//       "slug": "asics",
//       "description":
//           "Known for its high-performance running shoes and sportswear, emphasizing technology and quality."
//     },
//     {
//       "id": 8,
//       "name": "Skechers",
//       "slug": "skechers",
//       "description":
//           "Offers a wide range of lifestyle and performance footwear known for comfort and innovative designs."
//     },
//     {
//       "id": 9,
//       "name": "Brooks",
//       "slug": "brooks",
//       "description":
//           "Specializes in running shoes and apparel, committed to providing the best experience for runners."
//     },
//     {
//       "id": 10,
//       "name": "Saucony",
//       "slug": "saucony",
//       "description":
//           "Produces high-quality running shoes and apparel, known for its focus on runners' needs and performance."
//     },
//     {
//       "id": 11,
//       "name": "Mizuno",
//       "slug": "mizuno",
//       "description":
//           "Offers performance-driven sportswear and footwear, integrating advanced technology and craftsmanship."
//     },
//     {
//       "id": 12,
//       "name": "Converse",
//       "slug": "converse",
//       "description":
//           "Iconic brand known for its classic sneakers and casual footwear, blending timeless style and comfort."
//     }
//   ];

//   Future<void> addCategory()async {
//     final firestore = FirebaseFirestore.instance;
//     for (var cat in category) {
//       await firestore.collection('product_category').add(cat);
//     }
//   }

// final product = [
//   {
//     "id": 1,
//     "name": "Nike Air Zoom Pegasus",
//     "category_id": 1,
//     "brand_id": 1,
//     "image_url": "https://example.com/images/nike_air_zoom_pegasus.jpg",
//     "description":
//         "Versatile running shoe with responsive cushioning and a breathable upper.",
//     "price": 120.00,
//     "avg_rating": 4.5,
//     "total_ratings": 1500
//   },
//   {
//     "id": 2,
//     "name": "Adidas Ultraboost",
//     "category_id": 1,
//     "brand_id": 2,
//     "image_url": "https://example.com/images/adidas_ultraboost.jpg",
//     "description":
//         "High-performance running shoe with Boost cushioning for energy return.",
//     "price": 180.00,
//     "avg_rating": 4.7,
//     "total_ratings": 2300
//   },
//   {
//     "id": 3,
//     "name": "Puma RS-X",
//     "category_id": 5,
//     "brand_id": 3,
//     "image_url": "https://example.com/images/puma_rs_x.jpg",
//     "description":
//         "Retro-inspired sneaker combining comfort and style for casual wear.",
//     "price": 110.00,
//     "avg_rating": 4.4,
//     "total_ratings": 900
//   },
//   {
//     "id": 4,
//     "name": "Under Armour HOVR Phantom",
//     "category_id": 1,
//     "brand_id": 4,
//     "image_url": "https://example.com/images/ua_hovr_phantom.jpg",
//     "description":
//         "Innovative running shoe with HOVR cushioning technology for a 'zero gravity feel'.",
//     "price": 140.00,
//     "avg_rating": 4.6,
//     "total_ratings": 1200
//   },
//   {
//     "id": 5,
//     "name": "Reebok Nano X1",
//     "category_id": 5,
//     "brand_id": 5,
//     "image_url": "https://example.com/images/reebok_nano_x1.jpg",
//     "description":
//         "Versatile training shoe designed for various workouts, with responsive cushioning.",
//     "price": 130.00,
//     "avg_rating": 4.5,
//     "total_ratings": 800
//   },
//   {
//     "id": 6,
//     "name": "New Balance Fresh Foam 1080v11",
//     "category_id": 1,
//     "brand_id": 6,
//     "image_url": "https://example.com/images/nb_fresh_foam_1080v11.jpg",
//     "description":
//         "Premium running shoe with plush Fresh Foam cushioning for long-distance comfort.",
//     "price": 150.00,
//     "avg_rating": 4.8,
//     "total_ratings": 1100
//   },
//   {
//     "id": 7,
//     "name": "Asics Gel-Kayano 27",
//     "category_id": 1,
//     "brand_id": 7,
//     "image_url": "https://example.com/images/asics_gel_kayano_27.jpg",
//     "description":
//         "Stability running shoe with advanced Gel technology for superior cushioning.",
//     "price": 160.00,
//     "avg_rating": 4.7,
//     "total_ratings": 950
//   },
//   {
//     "id": 8,
//     "name": "Skechers D'Lites",
//     "category_id": 5,
//     "brand_id": 8,
//     "image_url": "https://example.com/images/skechers_dlites.jpg",
//     "description":
//         "Fashionable and comfortable sneakers with lightweight cushioning.",
//     "price": 80.00,
//     "avg_rating": 4.3,
//     "total_ratings": 650
//   },
//   {
//     "id": 9,
//     "name": "Brooks Ghost 13",
//     "category_id": 1,
//     "brand_id": 9,
//     "image_url": "https://example.com/images/brooks_ghost_13.jpg",
//     "description":
//         "Smooth and balanced running shoe with soft cushioning for a natural ride.",
//     "price": 130.00,
//     "avg_rating": 4.6,
//     "total_ratings": 1300
//   },
//   {
//     "id": 10,
//     "name": "Saucony Endorphin Speed",
//     "category_id": 1,
//     "brand_id": 10,
//     "image_url": "https://example.com/images/saucony_endorphin_speed.jpg",
//     "description":
//         "Lightweight, fast running shoe with PWRRUN cushioning for enhanced speed.",
//     "price": 160.00,
//     "avg_rating": 4.7,
//     "total_ratings": 700
//   },
//   {
//     "id": 11,
//     "name": "Mizuno Wave Rider 24",
//     "category_id": 1,
//     "brand_id": 11,
//     "image_url": "https://example.com/images/mizuno_wave_rider_24.jpg",
//     "description":
//         "Responsive running shoe with Mizuno Wave technology for a smooth ride.",
//     "price": 130.00,
//     "avg_rating": 4.5,
//     "total_ratings": 600
//   },
//   {
//     "id": 12,
//     "name": "Converse Chuck Taylor All Star",
//     "category_id": 5,
//     "brand_id": 12,
//     "image_url": "https://example.com/images/converse_chuck_taylor.jpg",
//     "description":
//         "Iconic high-top sneakers known for their timeless style and comfort.",
//     "price": 60.00,
//     "avg_rating": 4.8,
//     "total_ratings": 5000
//   }
// ];

Future<void> addreview() async {
  final firestore = FirebaseFirestore.instance;
  for (var p in review) {
    await firestore.collection('reviews').add(p);
  }
}

final review = [
  {
    "product_id": 1,
    "avg_rating": 4.5,
    "reviews": [
      {
        "review_id": 101,
        "name": "John Doe",
        "rating": 5,
        "comment":
            "Amazing running shoes! Extremely comfortable and lightweight. Highly recommended."
      }
    ]
  },
  {
    "product_id": 2,
    "avg_rating": 4.7,
    "reviews": [
      {
        "review_id": 102,
        "name": "Alice Johnson",
        "rating": 5,
        "comment":
            "Fantastic performance and energy return. My best running shoes so far."
      }
    ]
  },
  {
    "product_id": 3,
    "avg_rating": 4.4,
    "reviews": [
      {
        "review_id": 103,
        "name": "Bob Brown",
        "rating": 5,
        "comment":
            "Great retro design and super comfy. Perfect for casual wear."
      }
    ]
  },
  {
    "product_id": 4,
    "avg_rating": 4.6,
    "reviews": [
      {
        "review_id": 104,
        "name": "Emma Wilson",
        "rating": 5,
        "comment":
            "Innovative cushioning, feels like walking on air. Great for long runs."
      }
    ]
  },
  {
    "product_id": 5,
    "avg_rating": 4.5,
    "reviews": [
      {
        "review_id": 105,
        "name": "Chris Martin",
        "rating": 5,
        "comment": "Versatile and durable. Perfect for various workouts."
      }
    ]
  },
  {
    "product_id": 6,
    "avg_rating": 4.8,
    "reviews": [
      {
        "review_id": 106,
        "name": "Nina Roberts",
        "rating": 5,
        "comment": "Plush and comfortable. Excellent for long-distance running."
      }
    ]
  },
  {
    "product_id": 7,
    "avg_rating": 4.7,
    "reviews": [
      {
        "review_id": 107,
        "name": "David Lee",
        "rating": 5,
        "comment":
            "Superior cushioning and stability. Best shoes for my overpronation."
      }
    ]
  },
  {
    "product_id": 8,
    "avg_rating": 4.3,
    "reviews": [
      {
        "review_id": 108,
        "name": "Sarah Kim",
        "rating": 5,
        "comment":
            "Fashionable and comfy. Love wearing these for casual outings."
      }
    ]
  },
  {
    "product_id": 9,
    "avg_rating": 4.6,
    "reviews": [
      {
        "review_id": 109,
        "name": "Ethan Brown",
        "rating": 5,
        "comment": "Smooth and balanced. Perfect for my daily runs."
      }
    ]
  },
  {
    "product_id": 10,
    "avg_rating": 4.7,
    "reviews": [
      {
        "review_id": 110,
        "name": "Olivia Davis",
        "rating": 5,
        "comment": "Lightweight and fast. Really enhances my running speed."
      }
    ]
  },
  {
    "product_id": 11,
    "avg_rating": 4.5,
    "reviews": [
      {
        "review_id": 111,
        "name": "Michael Scott",
        "rating": 5,
        "comment": "Responsive and smooth. Excellent shoes for all my runs."
      }
    ]
  },
  {
    "product_id": 12,
    "avg_rating": 4.8,
    "reviews": [
      {
        "review_id": 112,
        "name": "Emily White",
        "rating": 5,
        "comment": "Timeless style and very comfortable. My go-to casual shoes."
      }
    ]
  }
];
