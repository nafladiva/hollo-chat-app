class GeneralResponseModel {
  final String message;

  const GeneralResponseModel({
    this.message = '',
  });

  factory GeneralResponseModel.fromMap(Map<String, dynamic> map) {
    return GeneralResponseModel(
      message: map['message'],
    );
  }
}
