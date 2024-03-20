import 'package:http/http.dart' as http;

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromHttpError(http.Response response) {
    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(response.reasonPhrase ?? 'Unauthorized');
      case 404:
        return ServerFailure('Your request was not found, Please try later!');
      case 500:
        return ServerFailure('Internal Server error, Please try later');
      default:
        return ServerFailure(
            'Oops! There was an error (${response.statusCode}), Please try again');
    }
  }

  factory ServerFailure.fromException(Exception e) {
    if (e.toString().contains('SocketException')) {
      return ServerFailure('No Internet Connection');
    }
    return ServerFailure('Unexpected Error, Please try again!');
  }
}
