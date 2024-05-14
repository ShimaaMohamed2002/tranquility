// import 'dart:async';
// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:tranquility/core/theme.dart';
//
// late List<CameraDescription> cameras;
//
// class ScanFaceView extends StatefulWidget {
//   const ScanFaceView({Key? key}) : super(key: key);
//
//   @override
//   State<ScanFaceView> createState() => _ScanFaceViewState();
// }
//
// class _ScanFaceViewState extends State<ScanFaceView> {
//   late CameraController controller;
//   XFile? image;
//   bool isProcessing = false;
//   bool isComplete = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = CameraController(cameras[1], ResolutionPreset.max, imageFormatGroup: ImageFormatGroup.jpeg);
//     controller.setFlashMode(FlashMode.off);
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     }).catchError((Object e) {
//       if (e is CameraException) {
//         switch (e.code) {
//           case 'CameraAccessDenied':
//             // Handle access errors here.
//             break;
//           default:
//             // Handle other errors here.
//             break;
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Scan Face")),
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         width: double.infinity,
//         child: Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: !controller.value.isInitialized
//                   ? Center(child: CircularProgressIndicator())
//                   : image != null
//                       ? Container(
//                           // color: Theme.of(context).primaryColor,
//                           child: IntrinsicWidth(
//                             child: Stack(
//                               fit: StackFit.expand,
//                               children: [
//                                 Image.file(
//                                   File(image!.path),
//                                 ),
//                                 if (isProcessing) Lottie.asset("assets/lotties/scan2.json"),
//                                 Align(
//                                   alignment: AlignmentDirectional.topStart,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(16),
//                                     child: CircleAvatar(
//                                       // backgroundColor: Colors.white,
//                                       child: IconButton(
//                                         onPressed: () {
//                                           image = null;
//                                           isProcessing = false;
//                                           isComplete = false;
//                                           setState(() {});
//                                         },
//                                         color: Colors.white,
//                                         icon: Icon(Icons.clear),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : ClipRRect(
//                           borderRadius: BorderRadius.circular(25),
//                           child: CameraPreview(
//                             controller,
//                             child: Column(
//                               children: [
//                                 Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 16),
//                                   child: Align(
//                                     alignment: AlignmentDirectional.bottomCenter,
//                                     child: FloatingActionButton(
//                                       onPressed: () async {
//                                         image = await controller.takePicture();
//                                         setState(() {});
//                                       },
//                                       child: Icon(Icons.camera_alt),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//             ),
//             SizedBox(height: 36),
//             if (image != null && !isProcessing && !isComplete)
//               FilledButton(
//                 onPressed: () {
//                   isProcessing = true;
//                   setState(() {});
//                   Timer(Duration(seconds: 3), () {
//                     isProcessing = false;
//                     isComplete = true;
//                     setState(() {});
//                   });
//                 },
//                 child: Text("Start Processing"),
//               ),
//             if (isComplete)
//               Column(
//                 children: [
//                   Text(
//                     "You are Happy",
//                     style: TextStyle(fontSize: 36, color: AppTheme.secondary),
//                   ),
//                   SizedBox(height: 16,),
//                   FilledButton(onPressed: () {
//                     Navigator.pop(context);
//                   }, child: Text("Finish"))
//
//                 ],
//               ),
//             if (isProcessing)
//               Column(
//                 children: [
//                   SizedBox(height: 22),
//                   LinearProgressIndicator(
//                     borderRadius: BorderRadius.circular(16),
//                     color: AppTheme.secondary,
//                     backgroundColor: Theme.of(context).primaryColor,
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Processing...",
//                     style: TextStyle(fontSize: 16, color: AppTheme.secondary),
//                   ),
//                 ],
//               ),
//             Spacer(),
//             if (!isComplete)
//               Text(
//               "Keep your phone steady , remove glasses  & be in  bright area",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.secondary),
//               textAlign: TextAlign.center,
//             ),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }
// }
