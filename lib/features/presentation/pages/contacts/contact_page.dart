import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/contacts_sliver_app_bar.dart';
import 'package:second_app/features/presentation/pages/account_details/account_personal_info_sub_page.dart';
import 'package:second_app/features/presentation/delegates/sliver_persistent_header_delegate_impl.dart';
// import 'package:second_app/features/presentation/pages/contact_page/contact_info_page.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_name_sub_page.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_email_sub_page.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_status_sub_page.dart';

import 'package:tuple/tuple.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  final List<Tuple3> _pages = [
    Tuple3('Contact Name', ContactNameSubPage(), Icon(Icons.account_box)),
    Tuple3('Contact Email', ContactEmailSubPage(), Icon(Icons.attach_email)),
    Tuple3(
      'Contact Status',
      ContactStatusSubPage(),
      Icon(Icons.whatshot),
    )
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
            ContactsSliverAppBar(_pages[_tabController.index].item1),
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
