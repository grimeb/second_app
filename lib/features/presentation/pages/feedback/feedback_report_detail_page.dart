// // import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:second_app/features/presentation/components/hero_widget.dart';
// import 'package:video_player/video_player.dart';

// class FeedbackReportDetailPage extends StatefulWidget {
//   final Object heroTag;
//   final String desc;
//   final String videoUrl;

//   const FeedbackReportDetailPage({
//     Key key,
//     @required this.heroTag,
//     @required this.desc,
//     @required this.videoUrl,
//   }) : super(key: key);

//   @override
//   _FeedbackReportDetailPageState createState() => _FeedbackReportDetailPageState();
// }

// class _FeedbackReportDetailPageState extends State<FeedbackReportDetailPage> {
//   ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _chewieController = ChewieController(
//         videoPlayerController: VideoPlayerController.network(widget.videoUrl),
//         // videoPlayerController:VideoPlayerController.asset('/assets/videos/IntroClip.mp4'),
//         // videoPlayerController:
//         // VideoPlayerController.file(File(widget.videoUrl)),
//         aspectRatio: 16 / 9,
//         autoInitialize: true,
//         autoPlay: true,
//         looping: true,
//         errorBuilder: (context, errorMessage) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 errorMessage,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tutorial Detail'),
//       ),
//       body: _buildContent(context),
//     );
//   }

//   Widget _buildContent(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           _buildHeroWidget(context),
//           _buildDesc(),
//         ],
//       ),
//     );
//   }

//   HeroWidget _buildHeroWidget(BuildContext context) {
//     return HeroWidget(
//       heroTag: widget.heroTag,
//       width: MediaQuery.of(context).size.width,
//       builder: (BuildContext context) {
//         return _buildHeroWidgetContent(widget.videoUrl);
//       },
//     );
//   }

//   Chewie _buildHeroWidgetContent(String imageUrl) {
//     return Chewie(
//       controller: _chewieController,
//     );
//   }

//   Widget _buildDesc() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         widget.desc,
//         style: TextStyle(fontSize: 30),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _chewieController.videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
// }
