import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_fruit/app_colors.dart';
import 'package:simple_fruit/models/category_model.dart';
import 'package:simple_fruit/models/product_model.dart';
import 'package:simple_fruit/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [
    CategoryModel(
      categoryImage: 'assets/category/Fruits.png',
      categoryName: 'Fruits',
    ),
    CategoryModel(
      categoryImage: 'assets/category/Beverages.png',
      categoryName: 'Beverages',
    ),
    CategoryModel(
      categoryImage: 'assets/category/Laundry.png',
      categoryName: 'Laundry',
    ),
    CategoryModel(
      categoryImage: 'assets/category/milk and eggs.png',
      categoryName: 'Milk & Eggs',
    ),
    CategoryModel(
      categoryImage: 'assets/category/Vegetables.png',
      categoryName: 'Vegetables',
    ),
    CategoryModel(
      categoryImage: 'assets/category/Beverages.png',
      categoryName: 'Beverages',
    ),
    CategoryModel(
      categoryImage: 'assets/category/Vegetables.png',
      categoryName: 'Vegetables',
    ),
  ];

  List<ProductModel> products = [
    ProductModel(
      productName: 'Banana',
      productImage: 'assets/products/banana.png',
      productPrice: 3.99,
      productRating: '4.8',
      productRatingCount: '(287)',
    ),
    ProductModel(
      productName: 'Orange',
      productImage: 'assets/products/orange.png',
      productPrice: 4.55,
      productRating: '4.8',
      productRatingCount: '(287)',
    ),

    ProductModel(
      productName: 'Pepper',
      productImage: 'assets/products/pepper.png',
      productPrice: 6.6,
      productRating: '4.1',
      productRatingCount: '(350)',
    ),
    ProductModel(
      productName: 'Banana',
      productImage: 'assets/products/banana.png',
      productPrice: 9.9,
      productRating: '5',
      productRatingCount: '(500)',
    ),
  ];

  List basket = [];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    List<String> banners = [
      'assets/banners/Slider 1.png',
      'assets/banners/Slider 2.png',
      'assets/banners/Slider 3.png',
    ];

    void toggleSelection(ProductModel product) {
      setState(() {
        if (basket.contains(product))
          basket.remove(product);
        else
          basket.add(product);
      });
    }

    bool isSelected(ProductModel product) => basket.contains(product);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/motorcycle.svg'),
            SizedBox(width: width * 0.01),
            Text(
              '61 Hopper street.. ,',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: width * 0.01),
            SvgPicture.asset('assets/icons/aroww_down.svg'),
            Spacer(),
            SvgPicture.asset('assets/icons/basket.svg'),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(banners[itemIndex]),
            options: CarouselOptions(
              height: height * 0.25,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(microseconds: 1500),
              autoPlayCurve: Curves.easeInOut,
            ),
          ),
          SizedBox(height: height * 0.017),
          SizedBox(
            height: height * 0.1,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: width * (70 / 430),
                      height: height * (70 / 932),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(categories[index].categoryImage),
                      ),
                    ),

                    Text(
                      categories[index].categoryName,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: height * 0.036),
          Padding(
            padding: const EdgeInsets.only(right: 26, left: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fruits',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  'View All',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * (36 / 932)),
          Stack(
            children: [
              SizedBox(
                width: width,
                height: height * (242 / 932),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,

                  itemBuilder: (context, index) {
                    return CustomCard(
                      productImage: products[index].productImage,
                      prdouctPrice: products[index].productPrice,
                      productRating: products[index].productRating,
                      productName: products[index].productName,
                      productRatingCount: products[index].productRatingCount,
                      onTap: () => toggleSelection(products[index]),
                    );
                  },
                ),
              ),
              if (basket.isNotEmpty)
                Positioned(
                  left: width * (12 / 430),
                  right: width * (12 / 430),
                  bottom: height * (2 / 932),
                  child: Container(
                    width: width,
                    height: height * (70 / 932),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.greenColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: height * (40 / 932),
                          child: SizedBox(
                            width: width * (240 / 432),
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              scrollDirection: Axis.horizontal,
                              itemCount: basket.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Container(
                                    width: width * (36 / 430),
                                    height: height * (36 / 932),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        products[index].productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Text(
                          'View Basket',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * (6 / 430),
                            right: width * (20 / 430),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/basket.svg',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
