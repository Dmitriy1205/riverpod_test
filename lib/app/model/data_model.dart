class DataModel {
  final String? fileName;

  DataModel({this.fileName});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      fileName: json["filename"],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModel &&
          runtimeType == other.runtimeType &&
          fileName == other.fileName;

  @override
  int get hashCode => fileName.hashCode;
}
