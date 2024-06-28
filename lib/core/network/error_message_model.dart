import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMassageModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });
  factory ErrorMassageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMassageModel(
      statusMessage: json['status_message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }
  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
