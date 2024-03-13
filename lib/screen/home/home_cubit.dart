import 'package:event_book_task/model/music_response_model.dart';
import 'package:event_book_task/screen/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/api_repository.dart';


class HomeCubit extends Cubit<HomeState>{


  HomeCubit():super(InitialState());


  callMusicListAPI() async{
    ApiRepository apiRepository = ApiRepository();
    emit(LoadingState());

    CommonResponseModel cResponseModel=
    await apiRepository.getMusicList();

    emit(LoadedState(cResponseModel.item ?? [],cResponseModel));
  }

  callBusinessListAPI() async{
    ApiRepository apiRepository = ApiRepository();
    emit(LoadingState());

    CommonResponseModel musicResponseModel=
    await apiRepository.getBusinessList();

    emit(LoadedState(musicResponseModel.item ?? [],musicResponseModel));
  }

  callSportsListAPI() async{
    ApiRepository apiRepository = ApiRepository();
    emit(LoadingState());

    CommonResponseModel cResponseModel=
    await apiRepository.getSportsList();

    emit(LoadedState(cResponseModel.item ?? [],cResponseModel));
  }

  callWorkShopListAPI() async{
    ApiRepository apiRepository = ApiRepository();
    emit(LoadingState());

    CommonResponseModel cResponseModel=
    await apiRepository.getWorkShopList();

    emit(LoadedState(cResponseModel.item ?? [],cResponseModel));
  }


  calAllListAPI() async{
    ApiRepository apiRepository = ApiRepository();
    emit(LoadingState());

    CommonResponseModel cResponseModel=
    await apiRepository.getAllList();

    emit(LoadedState(cResponseModel.item ?? [],cResponseModel));
  }


  void toggleView() {
    emit(ChangeList(state is ChangeList));
  }
}