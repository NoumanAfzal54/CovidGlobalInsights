import 'package:escobar/countries_list.dart';
import 'package:escobar/splash_Screen.dart';
import 'package:escobar/states_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'Models/WorldStatesModel.dart';

class WorldstateScreen extends StatefulWidget {
  const WorldstateScreen({super.key});

  @override
  State<WorldstateScreen> createState() => _WorldstateScreenState();
}

class _WorldstateScreenState extends State<WorldstateScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
    Color(0xffde3218),
  ];
  @override
  Widget build(BuildContext context) {
    stateservices s1 = stateservices();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            FutureBuilder(
                future: s1.fetchworldstatesrecord(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: controller, //it will animate
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            //dataMap accepts double value
                            "Total":
                                double.parse(snapshot.data!.cases.toString()), //First the value is converted in string then in double
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString()),
                            "Active":
                                double.parse(snapshot.data!.active.toString())
                          },
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          animationDuration: Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: Card(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: 'Total Cases',
                                    value: snapshot.data!.cases.toString()),
                                ReusableRow(
                                    title: 'Total Recovered',
                                    value: snapshot.data!.recovered.toString()),
                                ReusableRow(
                                    title: 'Total Deaths',
                                    value: snapshot.data!.deaths.toString()),
                                ReusableRow(
                                    title: 'Total Active',
                                    value: snapshot.data!.active.toString()),
                                ReusableRow(
                                    title: 'Total Critical',
                                    value: snapshot.data!.critical.toString()),
                                ReusableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                ReusableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString())
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => countrieslist()));
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text("Track Countires")),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          )
        ],
      ),
    );
  }
}
