import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos/screens/image_resizer/image_resizer_viewmodel.dart';

class ImageResizer extends StatelessWidget {
  ImageResizer({super.key});

  final ImageResizerViewModel viewmodel = ImageResizerViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Resizer"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 100,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  viewmodel.onBrowseFile();
                },
                child: Text("Browse"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 100,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  viewmodel.Process();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  foregroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("Process"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Obx(() => ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(viewmodel.selectedFiles[index].path),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    minVerticalPadding: 20,
                    leading: Image.file(viewmodel.selectedFiles[index]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: Colors.grey.shade100,
                  );
                }),
                itemCount: viewmodel.selectedFiles.length,
                shrinkWrap: true,
              ))
        ],
      ),
    );
  }
}
