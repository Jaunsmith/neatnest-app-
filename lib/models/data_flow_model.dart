class DataflowModel {
  final int identityVerifyIndex;
  final int methodVerifyIndex;

  DataflowModel({
    required this.identityVerifyIndex,
    required this.methodVerifyIndex,
  });

  DataflowModel copyWith({int? identityVerifyIndex, int? methodVerifyIndex}) {
    return DataflowModel(
      identityVerifyIndex: identityVerifyIndex ?? this.identityVerifyIndex,
      methodVerifyIndex: methodVerifyIndex ?? this.methodVerifyIndex,
    );
  }
}
