import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';

class LinesWeekly extends StatefulWidget {
  const LinesWeekly({super.key});

  @override
  State<LinesWeekly> createState() => _LinesWeeklyState();
}

class _LinesWeeklyState extends State<LinesWeekly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: LineChart(
                LineChartData(
                  minX: 1,
                  minY: 10,
                  maxX: 12,
                  maxY: 50,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppColors.conteinerdescriptions,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 40,
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (index, _) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(getMonthStringRepresentation(index),
                                style:
                                    TextStyle(color: context.colors.whiteA700)),
                          );
                        },
                      ),
                    ),

                 leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 70,
                        interval: 10,
                        getTitlesWidget: (index, _) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(getMonthString(index),
                                style:
                                    TextStyle(color: context.colors.whiteA700)),
                          );
                        },
                      ),
                    ),






                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      show: true,
                      color: context.colors.expensesFood,
                      shadow: Shadow(
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                        color: AppColors.conteinerdescriptions.withOpacity(.6),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: context.colors.expensesFood.withOpacity(.1),
                      ),
                      spots: [
                        const FlSpot(1, 20),
                        const FlSpot(2, 25),
                        const FlSpot(3, 20),
                        const FlSpot(4, 35),
                        const FlSpot(5, 40),
                        const FlSpot(6, 15),
                        const FlSpot(7, 50),
                        const FlSpot(8, 28),
                        const FlSpot(9, 35),
                        const FlSpot(10, 50),
                        const FlSpot(11, 15),
                        const FlSpot(12, 10)
                      ],
                    ),
                  ],

                ),
              
              
              
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getMonthStringRepresentation(double value) {
    
    switch (value) {
      case 1:
        return 'Yan';
      case 2:
        return 'Fev';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Iyn';
      case 7:
        return 'Iyl';
      case 8:
        return 'Avg';
      case 9:
        return 'Sen';
      case 10:
        return 'Okt';
      case 11:
        return 'Noy';
      case 12:
        return 'Dek';
      default:
        return '';
    }
  }

   String getMonthString(double value) {
    switch (value) {
      case 0:
        return '\$0';
      case 10:
        return '\$0';
      case 20:
        return '\$20';
      case 30:
        return '\$30';
      case 40:
        return '\$40';
      case 50:
        return '\$50';
      case 7:
        return '\$0';
      case 8:
        return '\$20';
      case 9:
        return '\$50';
      case 10:
        return '\$60';
      case 11:
        return '\$1';
      case 12:
        return '\$11';
      default:
        return '';
    }
  }
}
