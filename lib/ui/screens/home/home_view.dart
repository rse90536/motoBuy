import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motobuy/bloc/car_list_bloc/car_list_bloc.dart';
import 'package:motobuy/repositories/car_repositories.dart';

class HomeView extends StatefulWidget {
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
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CarListBloc(CarListInitial(), CarRepository()),
        child: TestBody(),
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
              return CircularProgressIndicator();
            } else if (state is LoadingCarList) {
              return CircularProgressIndicator();
            } else if (state is NewCarList) {
              return ListView.builder(
                  itemCount: state.carDetails.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.carDetails.data[index].title),
                    );
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

