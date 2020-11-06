import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:second_app/features/presentation/components/portfolio_gallery_image_widget.dart';

class ContactEmailDetailPage extends StatefulWidget {
  final List<String> imagePaths;
  final int currentIndex;

  const ContactEmailDetailPage(
      {Key key, @required this.imagePaths, @required this.currentIndex})
      : super(key: key);
  @override
  _ContactEmailDetailPageState createState() => _ContactEmailDetailPageState();
}

class _ContactEmailDetailPageState extends State<ContactEmailDetailPage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    // return _buildPhotoViewGallery();
    return Stack(
      children: <Widget>[
        _buildPhotoViewGallery(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      // child: _buildDottedIndicator(),
      child: _buildImageCarouselSlider(),
    );
  }

  Widget _buildImageCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: widget.imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return PortfolioGalleryImageWidget(
          imagePath: widget.imagePaths[index],
          onImageTap: () => _pageController.jumpToPage(index),
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.21,
        height: 100,
        enlargeCenterPage: true,
        initialPage: _currentIndex,
      ),
    );
  }

  // Row _buildDottedIndicator() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: widget.imagePaths
  //         .map<Widget>((String imagePath) => _buildDot(imagePath))
  //         .toList(),
  //   );
  // }

  // Container _buildDot(String imagePath) {
  //   return Container(
  //     width: 8,
  //     height: 8,
  //     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: _currentIndex == widget.imagePaths.indexOf(imagePath)
  //           ? Colors.white
  //           : Colors.grey.shade700,
  //     ),
  //   );
  // }

  PhotoViewGallery _buildPhotoViewGallery() {
    return PhotoViewGallery.builder(
      itemCount: widget.imagePaths.length,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(widget.imagePaths[index]),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
        );
      },
      enableRotation: true,
      backgroundDecoration: BoxDecoration(color: Colors.purple),
      scrollPhysics: const BouncingScrollPhysics(),
      // scrollDirection: Axis.vertical,
      pageController: _pageController,
      loadingBuilder: (BuildContext context, ImageChunkEvent event) {
        return Center(child: CircularProgressIndicator());
      },
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

// return PhotoViewGalleryPageOptions(
//           imageProvider: AssetImage(imagePath),
//           minScale: PhotoViewComputedScale.contained * 0.8,
//           maxScale: PhotoViewComputedScale.covered * 1.8,
//         );
