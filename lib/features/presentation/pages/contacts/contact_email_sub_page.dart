import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/portfolio_gallery_image_widget.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_gallery_detail_page.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_email_detail_page.dart';

class ContactEmailSubPage extends StatelessWidget {
  //* BUILD METHOD FOR CUSTOMSCROLLVIEW WITH SLIVERS (SLIVERGRID)
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImagePaths(context),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<String>> imagePathsSnapshot,
      ) {
        if (imagePathsSnapshot.connectionState == ConnectionState.done &&
            imagePathsSnapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: _buildContent(imagePathsSnapshot.data),
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

//* SLIVERGRID
  SliverGrid _buildContent(List<String> imagePaths) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // scrollDirection: Axis.horizontal,
        maxCrossAxisExtent: 150,
        // X axis
        mainAxisSpacing: 10,
        // Y axis
        crossAxisSpacing: 10,
      ),
      // padding: const EdgeInsets.all(10),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PortfolioGalleryImageWidget(
            imagePath: imagePaths[index],
            onImageTap: () => Navigator.push(
              context,
              _createGalleryDetailRoute(imagePaths, index),
            ),
          );
        },
        childCount: imagePaths.length,
      ),
    );
  }

  Future<List<String>> _loadImagePaths(BuildContext context) async {
    final String manifestContentJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContentJson);
    return manifestMap.keys
        .where((String key) => key.contains('assets/images/'))
        .toList();
  }

  MaterialPageRoute _createGalleryDetailRoute(
      List<String> imagePaths, int index) {
    return MaterialPageRoute(
      builder: (context) => ContactEmailDetailPage(
        imagePaths: imagePaths,
        currentIndex: index,
      ),
    );
  }
}

// Examples of ways to add sliver or grid views to the build method of the PortfolioGallerySubPage class

//* BUILD METHOD FOR GRIDVIEW

// @override
// Widget build(BuildContext context) {
//   return FutureBuilder(
//     future: _loadImagePaths(context),
//     builder: (
//       BuildContext context,
//       AsyncSnapshot<List<String>> imagePathsSnapshot,
//     ) {
//       if (imagePathsSnapshot.connectionState == ConnectionState.done &&
//           imagePathsSnapshot.hasData) {
//         return _buildContent(imagePathsSnapshot.data);
//       }

//       return Center(child: CircularProgressIndicator());
//     },
//   );
// }

//* GRIDVIEW CUSTOM EXTENT CHILDREN BUILDER DELEGATE

// GridView _buildContent(List<String> imagePaths) {
//   return GridView.custom(
//     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//       maxCrossAxisExtent: 150,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//     ),
//     padding: const EdgeInsets.all(10),
//     childrenDelegate: SliverChildBuilderDelegate(
//       (BuildContext context, int index) {
//         return _buildImageWidget(imagePaths[index]);
//       },
//       childCount: imagePaths.length,
//     ),
//   );
// }

//* GRIDVIEW CUSTOM EXTENT CHILDREN EXPLICIT DELEGATE

// GridView _buildContent(List<String> imagePaths) {
//   return GridView.custom(
//     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//       maxCrossAxisExtent: 150,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//     ),
//     padding: const EdgeInsets.all(10),
//     childrenDelegate: SliverChildListDelegate(
//       imagePaths
//           .map<Widget>((String imagePath) => _buildImageWidget(imagePath))
//           .toList(),
//     ),
//   );
// }

//* GRIDVIEW BUILDER EXTENT DELEGATE

// GridView _buildContent(List<String> imagePaths) {
//   return GridView.builder(
//     itemCount: imagePaths.length,
//     itemBuilder: (BuildContext context, int index) {
//       return _buildImageWidget(imagePaths[index]);
//     },
//     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//       maxCrossAxisExtent: 150,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//     ),
//     padding: const EdgeInsets.all(10),
//   );
// }

//* GRIDVIEW EXPLICIT COUNT DELEGATE

// GridView _buildContent(List<String> imagePaths) {
//   return GridView(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 5,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//     ),
//     padding: const EdgeInsets.all(10),
//     children: imagePaths
//         .map<Widget>((String imagePath) => _buildImageWidget(imagePath))
//         .toList(),
//   );
// }

//* GRIDVIEW EXPLICIT EXTENT DELEGATE

// GridView _buildContent(List<String> imagePaths) {
//   return GridView(
//     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//       maxCrossAxisExtent: 150,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//     ),
//     padding: const EdgeInsets.all(10),
//     children: imagePaths
//         .map<Widget>((String imagePath) => _buildImageWidget(imagePath))
//         .toList(),
//   );
// }

//* GRIDVIEW.EXTENT EXPLICIT

// GridView _buildContent(List<String> imagePaths) {
//   return GridView.extent(
//     maxCrossAxisExtent: 150,
//     mainAxisSpacing: 10,
//     crossAxisSpacing: 10,
//     padding: const EdgeInsets.all(10),
//     children: imagePaths
//         .map<Widget>((String imagePath) => _buildImageWidget(imagePath))
//         .toList(),
//   );
// }

//* GRIDVIEW.COUNT EXPLICIT

// GridView _buildContent(List<String> imagePaths) {
//   return GridView.count(
//     // scrollDirection: Axis.horizontal,
//     crossAxisCount: 5,
//     mainAxisSpacing: 10,
//     crossAxisSpacing: 10,
//     padding: const EdgeInsets.all(10),
//     children: imagePaths
//         .map<Widget>((String imagePath) => _buildImageWidget(imagePath))
//         .toList(),
//   );
// }
