import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:motobuy/model/car_detail.dart';
import 'package:motobuy/repositories/car_repositories.dart';

part 'car_list_event.dart';
part 'car_list_state.dart';

class CarListBloc extends Bloc<CarListEvent, CarListState> {
  CarRepository _carRepository;
  CarListBloc(CarListState carListInitial,this._carRepository) : super(CarListInitial());

  @override
  Stream<CarListState> mapEventToState(
    CarListEvent event,
  ) async* {
    if(event is DoFetchEvent){
      yield LoadingCarList();
      try{
      var carDetails = await _carRepository.getNewestCarList();
      yield NewCarList(carDetails: carDetails );
      }catch(e){
          yield FailedFetchData(errorMessage: e.toString());

      }
    }
  }
}
