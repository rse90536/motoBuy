import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motobuy/bloc/car_list_bloc/car_list_bloc.dart';
import 'package:motobuy/repositories/car_repositories.dart';
import 'package:motobuy/ui/widget/loading.dart';
import 'package:motobuy/ui/widget/motor_card.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/homeView';
  const HomeView({
    Key key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MotoBuy",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      backgroundColor: Colors.grey,
      body:Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/homeView.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),
            BlocProvider(
              create: (context) => CarListBloc(CarListInitial(), CarRepository()),
              child: TestBody(),
            ),
          ],
        ),
      ),
    );
    //   Scaffold(
    //   appBar: AppBar(
    //     titleSpacing: 20,
    //     title: Text("Moto交易平台",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
    //   ),
    //   body:
    // );
  }
}

class TestBody extends StatefulWidget {
  const TestBody({
    Key key,
  }) : super(key: key);

  @override
  _TestBodyState createState() => _TestBodyState();
}

class _TestBodyState extends State<TestBody> {
  CarListBloc bloc;

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CarListBloc>(context);
    bloc.add(DoFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<CarListBloc, CarListState>(
          builder: (context, state) {
            if (state is CarListInitial) {

              return Loading();
            } else if (state is LoadingCarList) {
              return Loading();
            } else if (state is NewCarList) {
              return ListView.builder(
                  itemCount: state.carDetails.data.length,
                  itemBuilder: (context, index) {
                    return MotorCardWidget(carDetail: state.carDetails.data[index],);
//                      ListTile(
//                      title: Text(state.carDetails.data[index].title),
//                    );
                  });
            } else if (state is FailedFetchData) {
              return ErrorWidget(state.errorMessage.toString());
            } else {
              return Container();
            }
          },
        ),
      );
  }
}

