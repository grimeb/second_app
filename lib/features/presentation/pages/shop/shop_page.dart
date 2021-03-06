import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/shop_sliver_app_bar.dart';
import 'package:second_app/features/presentation/delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_gallery_sub_page.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_tutorial_sub_page.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_projects_sub_page.dart';
import 'package:tuple/tuple.dart';

/*
  REMINDER  // Import this root page in the shop_drawer.dart file so it shows up when clicked
*/

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  final List<Tuple3> _pages = [
    Tuple3('Search', PortfolioTutorialsSubPage(), Icon(Icons.search)),
    Tuple3('Quantity', PortfolioGallerySubPage(), Icon(Icons.add_to_queue)),
    Tuple3('Add to cart', PortfolioProjectsSubPage(),
        Icon(Icons.add_shopping_cart)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            ShopSliverAppBar(_pages[_tabController.index].item1),
            SliverPersistentHeader(
              delegate: SliverPersistentHeaderDelegateImpl(
                color: Colors.purple,
                tabBar: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: _pages
                      .map<Tab>((Tuple3 page) => Tab(text: page.item1))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.purple[500],
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          controller: _tabController,
          tabs: _pages
              .map<Tab>((Tuple3 page) => Tab(
                    text: page.item1,
                    icon: page.item3,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

// int _selectedPage = 0;
// PageController _pageController = PageController();

// /////////// Under Scaffold in the build method ////////////
// body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             PortfolioSliverAppBar(_pages[_selectedPage].item1),
//           ];
//         },
//         body: PageView(
//           children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
//           onPageChanged: (index) {
//             setState(() {
//               _selectedPage = index;
//             });
//           },
//           controller: _pageController,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.purple,
//         iconSize: 40,
//         selectedFontSize: 20,
//         // type: BottomNavigationBarType.shifting,
//         items: [
//           BottomNavigationBarItem(
//             // backgroundColor: Colors.red,
//             icon: Icon(Icons.video_library),
//             label: 'Tutorials',
//           ),
//           BottomNavigationBarItem(
//             // backgroundColor: Colors.purple,
//             icon: Icon(Icons.image),
//             label: 'Gallery',
//           )
//         ],
//         currentIndex: _selectedPage,
//         onTap: (index) {
//           setState(() {
//             _selectedPage = index;
//             _pageController.animateToPage(_selectedPage,
//                 duration: Duration(milliseconds: 300), curve: Curves.linear);
//           });
//         },
//       ),
