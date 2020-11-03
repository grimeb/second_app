import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/schedule_sliver_app_bar.dart';
import 'package:second_app/features/presentation/delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:second_app/features/presentation/pages/schedule/schedule_previous_sub_page.dart';
import 'package:second_app/features/presentation/pages/schedule/schedule_upcoming_sub_page.dart';
import 'package:second_app/features/presentation/pages/schedule/schedule_create_sub_page.dart';
import 'package:tuple/tuple.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
  final List<Tuple3> _pages = [
    Tuple3('Upcoming', ScheduleUpcomingSubPage(), Icon(Icons.today)),
    Tuple3('Previous', SchedulePreviousSubPage(), Icon(Icons.update)),
    Tuple3(
      'Create',
      ScheduleCreateSubPage(),
      Icon(Icons.domain_verification),
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
            ScheduleSliverAppBar(_pages[_tabController.index].item1),
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
