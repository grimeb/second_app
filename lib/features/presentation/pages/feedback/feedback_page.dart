import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/account_details_sliver_app_bar.dart';
import 'package:second_app/features/presentation/delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:second_app/features/presentation/pages/account_details/account_personal_info_sub_page.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_gallery_sub_page.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_projects_sub_page.dart';
import 'package:tuple/tuple.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage>
    with SingleTickerProviderStateMixin {
  final List<Tuple3> _pages = [
    Tuple3('Personal Info', AccountPersonalInfoSubPage(),
        Icon(Icons.account_balance)),
    Tuple3('Security', PortfolioGallerySubPage(), Icon(Icons.add_moderator)),
    Tuple3('People & Sharing', PortfolioProjectsSubPage(),
        Icon(Icons.admin_panel_settings)),
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
            AccountDetailsSliverAppBar(_pages[_tabController.index].item1),
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

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
        ]));
  }
}

// TextFormField(
//   // The validator receives the text that the user has entered.
//   validator: (value) {
//     if (value.isEmpty) {
//       return 'Please enter some text';
//     }
//     return null;
//   },
// );
