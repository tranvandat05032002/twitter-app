import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meteor_app/views/Home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  final Color backgroundColor;

  FixedHeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
    this.backgroundColor = Colors.white,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: child, color: backgroundColor);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _MyWidgetState extends State<Dashboard> {
  PageController _pageController = PageController();

  int activeIndex = 0; // Initial active index
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    child: Center(
                  child: HeaderElement(),
                )),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: FixedHeaderDelegate(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(icons.length, (i) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                activeIndex = i;
                              });
                              _pageController.jumpToPage(i);
                            },
                            icon: FaIcon(
                              icons[i].icon,
                              color: activeIndex == i
                                  ? Colors.blue.shade300
                                  : null,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  minHeight: 40.0,
                  maxHeight: 40.0,
                  backgroundColor: Colors.white),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: double.maxFinite,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      children: [
                        HomePage(),
                        FriendsPage(),
                        ShopPage(),
                        NotificationsPage(),
                        SettingsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget HeaderElement() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${dotenv.env['APP_NAME']}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade300),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => null,
                    icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  ),
                  IconButton(
                    onPressed: () => null,
                    icon: FaIcon(FontAwesomeIcons.facebookMessenger),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  final List<IconRoute> icons = [
    IconRoute(icon: FontAwesomeIcons.house, route: HomePage()),
    IconRoute(icon: FontAwesomeIcons.userGroup, route: FriendsPage()),
    IconRoute(icon: FontAwesomeIcons.shop, route: ShopPage()),
    IconRoute(icon: FontAwesomeIcons.solidBell, route: NotificationsPage()),
    IconRoute(icon: FontAwesomeIcons.bars, route: SettingsPage()),
  ];
}

class IconRoute {
  final IconData icon;
  final StatefulWidget route;
  IconRoute({required this.icon, required this.route});
}

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page'));
  }
}

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Friends Page'));
  }
}

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Shop Page'));
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Notifications Page'));
  }
}
