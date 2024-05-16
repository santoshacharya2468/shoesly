import 'package:json_annotation/json_annotation.dart';

const requestModel = JsonSerializable(createFactory: false);
const responseModel = JsonSerializable(createToJson: false);
const model = JsonSerializable(explicitToJson: true);
