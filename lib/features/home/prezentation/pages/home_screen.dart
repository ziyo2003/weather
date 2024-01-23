import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_api_project/core/data_status/status.dart';
import 'package:new_api_project/features/home/prezentation/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int son = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.pure:
            context.read<WeatherBloc>().add(getDatas());
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          case Status.loading:
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          case Status.failure:
            return const Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.red, fontSize: 28),
              ),
            );
          case Status.success:
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              extendBodyBehindAppBar: true,
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 400,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[200],
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                getSvg(state.all[0].humidity),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                state.all[0].name,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.all[0].name,
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Text(
                                state.all[0].country,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.all[0].name,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Text(
                                state.all[0].country,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  String getSvg(int id) {
    switch (id) {
      case 1:
        return "assets/1.svg";
      case 2:
        return "assets/2.svg";
      case 3:
        return "assets/3.svg";
      case 4:
        return "assets/4.svg";
      default:
        return "sddbbg";
    }
  }
}
