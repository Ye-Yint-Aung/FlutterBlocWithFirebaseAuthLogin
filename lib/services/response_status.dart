import 'package:equatable/equatable.dart';

class ResponseObj{
  ApiStatus? apiStatus;
  ErrorStatus? errorStatus;
  dynamic data;
  ResponseObj({this.apiStatus, this.errorStatus, this.data});
}
enum ErrorStatus{unknown, notFound, server, network,timeout}
enum ApiStatus {init, loading, success, failure}

class ResponseState extends Equatable{
  ApiStatus? apiStatus;
  ErrorStatus? errorStatus;
  dynamic data;
  ResponseState({this.apiStatus, this.errorStatus, this.data});
  ResponseState.init() : data = null, apiStatus =ApiStatus.init;

  ResponseState copyWith({dynamic data, ApiStatus? apiStatus, ErrorStatus? errorStatus}){
    return ResponseState(data: data ?? this.data , apiStatus: apiStatus ?? this.apiStatus, errorStatus: errorStatus ?? this.errorStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data,apiStatus,errorStatus];
}