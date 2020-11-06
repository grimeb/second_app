import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/pages/account_details/account_page.dart';
import 'package:second_app/features/presentation/pages/notifications/notifications_page.dart';
import 'package:second_app/features/presentation/pages/portfolio/portfolio_page.dart';
import 'package:second_app/features/presentation/pages/contacts/contact_page.dart';
import 'package:second_app/features/presentation/pages/schedule/schedule_page.dart';

class ShopDrawer extends StatelessWidget {
  // const ShopDrawer({Key: key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.blue),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(context),
            _buildAccountItem(context),
            _buildDivider(),
            _buildPortfolioItem(context),
            _buildDivider(),
            _buildContactsItem(context),
            _buildDivider(),
            _buildScheduleItem(context),
            _buildDivider(),
            _buildCartItem(context),
            _buildDivider(),
            _buildShopItem(context),
            _buildDivider(),
            _buildNotificationItem(context),
            _buildDivider(),
            _buildMessageItem(context),
            _buildDivider(),
            _buildFeedbackItem(context),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        'Tech Kwon Do',
        style: TextStyle(
            backgroundColor: Colors.black12, fontWeight: FontWeight.w900),
      ),
      accountEmail: Text(
        'TechKwonDo@outlook.com',
        style: TextStyle(
            backgroundColor: Colors.black26, fontWeight: FontWeight.w900),
      ),
      currentAccountPicture: GestureDetector(
        onTap: () => showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Tech Kwon Do'),
            content: Text('An about me website made using Google sites'),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage('https://i.imgur.com/3nKpoQ9.png'),
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://i.redd.it/ivi678rpfhr21.jpg'))),
    );
  }

  ListTile _buildPortfolioItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Portfolio',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.work,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PortfolioPage()),
        );
      },
    );
  }

  ListTile _buildScheduleItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Schedule',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.today,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SchedulePage()),
        );
      },
    );
  }

  ListTile _buildCartItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Cart',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.add_shopping_cart_sharp,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PortfolioPage()),
        );
      },
    );
  }

  ListTile _buildNotificationItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Notifications',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.add_alert,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NotificationsPage()),
        );
      },
    );
  }

  ListTile _buildMessageItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Messages',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.announcement_sharp,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PortfolioPage()),
        );
      },
    );
  }

  ListTile _buildFeedbackItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Feedback',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.adb,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PortfolioPage()),
        );
      },
    );
  }

  ListTile _buildContactsItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Contacts',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.account_box,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ContactPage()),
        );
      },
    );
  }

  ListTile _buildAccountItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Account Details',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.add_moderator,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AccountDetailsPage()),
        );
      },
    );
  }

  ListTile _buildShopItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Shop',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.add_business,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PortfolioPage()),
        );
      },
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.white,
    );
  }
}
