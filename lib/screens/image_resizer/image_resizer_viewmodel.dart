// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image/image.dart' as img;

class ImageResizerViewModel {
  RxList<File> selectedFiles = RxList();

  List<ImageFileFormat> imageFileFormals = [
    ImageFileFormat(folderName: "Android", width: 892, height: 1920),
    ImageFileFormat(folderName: "iOS 6.7", width: 1290, height: 2796),
    ImageFileFormat(folderName: "iOS 6.5", width: 1242, height: 2688),
    ImageFileFormat(folderName: "iOS 5.5", width: 1242, height: 2208),
  ];

  void onBrowseFile() async {
    const XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: <String>['jpg', 'jpeg'],
    );
    const XTypeGroup pngTypeGroup = XTypeGroup(
      label: 'PNGs',
      extensions: <String>['png'],
    );
    final List<XFile> files = await openFiles(acceptedTypeGroups: <XTypeGroup>[
      jpgsTypeGroup,
      pngTypeGroup,
    ]);

    if (files.isNotEmpty) {
      selectedFiles.value = files.map((e) => File(e.path)).toList();
    }
  }

  void Process() async {
    String? selectedDirectory = await FilePicker.platform
        .getDirectoryPath(dialogTitle: "Select Directory");

    if (selectedDirectory == null) {
      return;
    }

    String dirName = "Screenshots_${DateTime.now()}";

    Directory directoryy = Directory("$selectedDirectory/$dirName");

    if (!await directoryy.exists()) {
      await directoryy.create();
    }

    for (ImageFileFormat element in imageFileFormals) {
      String fileName = element.folderName;

      Directory directory = Directory("$selectedDirectory/$dirName/$fileName");

      if (!await directory.exists()) {
        await directory.create();
      }

      for (int i = 0; i < selectedFiles.length; i++) {
        File testFile = selectedFiles[i];

        String a = String.fromCharCode(65 + i);

        File result = File("${directory.path}/($a).png");

        final cmd = img.Command()
          ..decodeImageFile(testFile.path)
          ..copyResize(width: element.width, height: element.height)
          ..writeToFile(result.path);
        await cmd.executeThread();
      }
    }
  }
}

class ImageFileFormat {
  String folderName;
  int height;
  int width;
  ImageFileFormat({
    required this.folderName,
    required this.height,
    required this.width,
  });
}
