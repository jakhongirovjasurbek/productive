import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';

class LineGraphMonthly extends StatefulWidget {
  const LineGraphMonthly({super.key, });



  @override
  State<LineGraphMonthly> createState() => _LineGraphMonthlyState();
}

class _LineGraphMonthlyState extends State<LineGraphMonthly> {
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
                  minY: 0,
                  maxX: 12,
                  maxY: 50,
                  gridData:  FlGridData(show: true, drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppColors.conteinerdescriptions,
                        strokeWidth: 1,
                      );
                    },),

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
                            child: Text(getMonthStringRepresentation(index),style: TextStyle(color: context.colors.whiteA700),),
                          );
                        },
                      ),
                    ),


                       leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (index, _) {
                          return GestureDetector(
                            
                            onTap: () {
                              
                            },
                            child: Text(getStringRepresentation(index),style: TextStyle(color: context.colors.whiteA700),)) ;
                        },
                        reservedSize: 42,
                      ),
                    ),
                  
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      show: true,
                      color: AppColors.expensesFood,
                      shadow: Shadow(
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                        color: AppColors.conteinerdescriptions.withOpacity(.6),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.expensesFood.withOpacity(.1),
                        spotsLine: const BarAreaSpotsLine(
                          show: false,
                          flLineStyle: FlLine(color: Colors.white),
                        ),
                      ),
                      spots: [
                        const FlSpot(1, 30),
                        const FlSpot(2, 35),
                        const FlSpot(3, 30),
                        const FlSpot(4, 20),
                        const FlSpot(5, 20),
                        const FlSpot(6, 15),
                        const FlSpot(7, 10),
                        const FlSpot(8, 10),
                        const FlSpot(9, 35),
                        const FlSpot(10, 30),
                        const FlSpot(11, 35),
                        const FlSpot(12, 40),
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
        return '2';
      case 2:
        return '4';
      case 3:
        return '6';
      case 4:
        return '8';
      case 5:
        return '12';
      case 6:
        return '14';
      case 7:
        return '18';
      case 8:
        return '20';
      case 9:
        return '22';
      case 10:
        return '26';
      case 11:
        return '28';
      case 12:
        return '30';
      default:
        return '';
    }
  }


    String getStringRepresentation(double value) {
    switch (value) {
      case 1:
        return '\$0';
      case 2:
        return '\$50';
      case 3:
        return '\$100';
      case 4:
        return '\$150';
      case 5:
        return '\$200';

      default:
        return '';
    }
  }
}


