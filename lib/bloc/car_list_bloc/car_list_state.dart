part of 'car_list_bloc.dart';

abstract class CarListState extends Equatable {
  const CarListState();

  @override
  List<Object> get props => [];
}
class CarListInitial extends CarListState {
  @override
  String toString() {
    return "CarListInitial";
  }
}

class NewCarList extends CarListState {
 final CarDetailData carDetails;
  NewCarList({this.carDetails});
  @override
  String toString() {
    return "NewCarList";
  }
}

class AllCarList extends CarListState {
  @override
  String toString() {
    return "AllCarList";
  }
}

class LoadingCarList extends CarListState {
  const LoadingCarList();
  @override
  String toString() {
    return "LoadingCarList";
  }
}


class FailedFetchData extends CarListState {
  final String errorMessage;

  FailedFetchData({this.errorMessage});

  @override
  String toString() {
    return "FailedFetchData";
  }
}
