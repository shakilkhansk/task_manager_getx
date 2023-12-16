class ApiResponse {
  final int? statusCode;
  final bool isSuccess;
  final dynamic jsonResponse;
  final String? status;
  final String? errorMessage;

  ApiResponse({
    this.statusCode = -1,
    required this.isSuccess,
    this.jsonResponse,
    this.status,
    this.errorMessage = 'Something went wrong',
  });
}