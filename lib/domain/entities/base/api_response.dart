class ApiResponse<T> {
  const ApiResponse({
    this.success,
    this.data,
    this.error,
  });

  final bool? success;

  final T? data;

  final String? error;
}
