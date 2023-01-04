import 'package:macos/models/attribute_model.dart';

class ClassModel {
  List<AttributeModel> attributes;
  String modelName;
  bool isNullable;
  ClassModel(
      {required this.modelName,
      required this.attributes,
      required this.isNullable});

  String getClassCode() {
    String data = "${_imports()}\n\nclass $modelName {\n\n";
    data += _getAttributes();
    data += "\n\n";
    data += _getContructor();
    data += "\n\n";
    data += _getToMap();
    data += "\n\n";
    data += _fromSnapShot();

    data += "\n\n}";
    return data;
  }

  String _imports() {
    return "import 'package:cloud_firestore/cloud_firestore.dart';";
  }

  String _getAttributes() {
    String data = "";

    for (var element in attributes) {
      String typeCode = element.type.replaceAll("?", "");
      typeCode = isNullable ? "$typeCode?" : typeCode;
      data += "${isNullable ? "" : "late"} $typeCode ${element.name};\n";
    }
    return data;
  }

  String _getContructor() {
    String data = "$modelName();";
    return data;
  }

  String _getToMap() {
    String data = "Map<String, dynamic> toMap() => {\n";

    for (var element in attributes) {
      data += '       "${element.name}" : ${element.name},\n';
    }
    return "$data };";
  }

  String _fromSnapShot() {
    String data =
        "$modelName.fromSnapshot(DocumentSnapshot doc) {\n        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;\n";

    for (var element in attributes) {
      if (element.name == "uid") {
        data += '      uid = doc.id;\n';
      } else {
        data += "     ${element.name} = map['${element.name}'];\n";
      }
    }
    return "$data }";
  }
}
