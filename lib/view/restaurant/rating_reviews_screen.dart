import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../generated/l10n.dart';
import '../../utils/widgets/common_background.dart';
import '../../controller/profile_controller.dart';
import '../../model/rating_review_model.dart';

class RatingReviewsScreen extends StatelessWidget {
  const RatingReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Rating & Reviewa",
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: false,
      ),
      child: GetBuilder<ProfileController>(
        builder: (profileController) {
          final reviews = profileController.ratingReviewData?.reviews ?? [];
          if (profileController.isRatingReviewLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (reviews.isEmpty) {
            return Center(
              child: Text(
                "No reviews found.",
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: reviews.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildReviewTile(context, reviews[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildReviewTile(BuildContext context, ReviewItem review) {
    double ratingVal = double.tryParse(review.rating?.toString() ?? "0") ?? 0.0;
    return Container(
      width: 350,
      height: 154,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xFFDCFCE7),
                    child: Text(
                      (review.username?.isNotEmpty == true)
                          ? review.username![0].toUpperCase()
                          : "S",
                      style: GoogleFonts.rubik(
                        color: const Color(0xFF166534),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.username ?? "Anonymous",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F1F1F),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < ratingVal.floor()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: const Color(0xFFF59E0B),
                              size: 14,
                            );
                          }),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          review.rating?.toString() ?? "0.0",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                review.createdAt ?? "",
                style: GoogleFonts.rubik(
                  fontSize: 10,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.comment ?? "No comment provided.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.rubik(
              fontSize: 13,
              color: const Color(0xFF4B5563),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  S.of(context).orderColon,
                  style: GoogleFonts.rubik(
                    fontSize: 11,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  review.orderCode ?? "-",
                  style: GoogleFonts.rubik(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4B5563),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
