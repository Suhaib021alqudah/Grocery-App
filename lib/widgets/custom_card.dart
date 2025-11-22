import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.productImage,
    required this.prdouctPrice,
    required this.productRating,
    required this.productName,
    required this.productRatingCount,
    required this.onTap
  });
  final String productName;
  final String productImage;
  final double prdouctPrice;
  final String productRating;
  final String productRatingCount;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: width * (170 / 430),
      height: height * (245 / 932),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * (160 / 430),
                height: height * (147 / 932),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    productImage,
      
                    fit: BoxFit.contain,
      
                    width: width * (146 / 430),
                    height: height * (100 / 932),
                  ),
                ),
              ),
              SizedBox(height: height * (8 / 932)),
      
              Text(
                productName,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * (8 / 932)),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/star.svg'),
                  SizedBox(width: width * 0.01),
                  Text(
                    productRating,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' ${productRatingCount}',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * (8 / 932)),
      
              Text(
                '\$${prdouctPrice}',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
      
          Positioned(
            right: width * (18 / 430),
            bottom: height * (100 / 932),
            child: GestureDetector(
              onTap:onTap,
              child: Container(
                width: width * (38 / 430),
                height: height * (38 / 932),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(child: Icon(Icons.add)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
