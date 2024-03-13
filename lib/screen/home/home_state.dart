import '../../model/music_response_model.dart';

abstract class HomeState{}

class InitialState extends HomeState{
}

class LoadingState extends HomeState {}

class LoadedState extends HomeState{
  List<Item> dataList;
  CommonResponseModel musicResponseModel;
  LoadedState(this.dataList,this.musicResponseModel);
}

class ChangeList extends HomeState{
  bool list;
  ChangeList(this.list);
}