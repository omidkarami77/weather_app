// ignore_for_file: depend_on_referenced_packages, prefer_final_locals

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/params/ForecastParams.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/feature_weather/domain/usecases/get_current_weather_usecase.dart.dart';
import 'package:weather_app/features/feature_weather/domain/usecases/get_forecast_weather_usecase.dart.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/bloc/cw_status.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/bloc/fw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForeCastWeatherUse getForeCastWeatherUse;

  HomeBloc(this.getCurrentWeatherUseCase, this.getForeCastWeatherUse)
      : super(HomeState(cwStatus: CwLoading(), fwStatus: FwLoading())) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));

      DataState dataState = await getCurrentWeatherUseCase(event.cityName);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
      }
    });

    /// load 7 days Forecast weather for city Event
    on<LoadFwEvent>((event, emit) async {
      /// emit State to Loading for just Fw
      emit(state.copyWith(newFwStatus: FwLoading()));

      DataState dataState = await getForeCastWeatherUse(event.param);

      /// emit State to Completed for just Fw
      if (dataState is DataSuccess) {
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      }

      /// emit State to Error for just Fw
      if (dataState is DataFailed) {
        emit(state.copyWith(newFwStatus: FwError(dataState.error!)));
      }
    });
  }
}
