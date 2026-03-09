import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/widgets/common_background.dart';
import '../../model/profile_model.dart';

class LeaveHistoryScreen extends StatelessWidget {
  final List<LeaveData> upcomingLeaves;
  final List<LeaveData> leaveHistory;

  const LeaveHistoryScreen({
    super.key,
    required this.upcomingLeaves,
    required this.leaveHistory,
  });

  String _formatLeaveDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return "";
    try {
      final dt = DateTime.parse(dateStr);
      const months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];
      return "${months[dt.month - 1]} ${dt.day.toString().padLeft(2, '0')}, ${dt.year}";
    } catch (_) {
      return dateStr;
    }
  }

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
          "Leaves History",
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: false,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (upcomingLeaves.isNotEmpty) ...[
                Text(
                  "Upcoming Leaves",
                  style: GoogleFonts.rubik(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 95, 145, 245),
                  ),
                ),
                const SizedBox(height: 12),
                ...upcomingLeaves.map(
                  (leave) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildLeaveTile(
                      dateRange: _formatLeaveDate(leave.date),
                      reason: leave.reason ?? "Leave",
                      status: "SCHEDULED",
                      isUpcoming: true,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              if (leaveHistory.isNotEmpty) ...[
                Text(
                  "Completed Leaves",
                  style: GoogleFonts.rubik(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 35, 208, 102),
                  ),
                ),
                const SizedBox(height: 12),
                ...leaveHistory.map(
                  (leave) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildLeaveTile(
                      dateRange: _formatLeaveDate(leave.date),
                      reason: leave.reason ?? "Leave",
                      status: "COMPLETED",
                      isUpcoming: false,
                    ),
                  ),
                ),
              ],
              if (upcomingLeaves.isEmpty && leaveHistory.isEmpty)
                Text(
                  "No leave history found.",
                  style: GoogleFonts.rubik(color: Colors.grey, fontSize: 13),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaveTile({
    required String dateRange,
    required String reason,
    required String status,
    required bool isUpcoming,
  }) {
    return Container(
      width: 350,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateRange,
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F1F1F),
                    ),
                  ),
                  Text(
                    reason,
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? const Color(0xFFEEF2FF)
                      : const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.rubik(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: isUpcoming
                        ? const Color(0xFF4F46E1)
                        : const Color(0xFF166534),
                  ),
                ),
              ),
            ],
          ),
          if (isUpcoming) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 32,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFFCCBD)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Cancel Leave",
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF5216),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
