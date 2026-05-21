import 'package:flutter/material.dart';
import 'package:flutter_day1/counterapp_provider/counter_provider.dart';
import 'package:flutter_day1/page/landing_page.dart';
import 'package:flutter_day1/page/page_flex_list.dart';
import 'package:flutter_day1/page/page_go_navigator.dart';
import 'package:flutter_day1/page/page_material_design.dart';
import 'package:flutter_day1/page/page_profile.dart';
import 'package:flutter_day1/page/page_responsif.dart';
import 'package:flutter_day1/page/page_login.dart';
import 'package:flutter_day1/providers/todo_model.dart';
import 'package:flutter_day1/views/TodopageScreen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'counterapp_provider/counter_screen.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//         create: (context)=> TodoModel(),
//       // create: (context)=> CounterProvider(),
//         child: const MyApp(),
//     )
//       );
// }

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const PageGoNavigator();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//       ),
//
//       //ubah ke page login
//       debugShowCheckedModeBanner: false,
//       home: const PageMain(),
//       // home: const Todopagescreen(),
//     );
//   }
// }
//

class PageMain extends StatelessWidget {
  const PageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        title: Text('Trainning PNP Apps'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            Container(
              // width: 200,
              height: 100,
              padding: EdgeInsets.all(12),
              // margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 8,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(child: Text('Hello Selamat Datang')),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageFlexList()),
                    );
                  },
                  child: Chip(
                    label: Text('Flexible List'),
                    backgroundColor: Colors.orange.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PagelistVertical(),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text('List Vertical'),
                    backgroundColor: Colors.blue.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridViewCount()),
                    );
                  },
                  child: Chip(
                    label: Text('Grid View'),
                    backgroundColor: Colors.red.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageSliverWidgetState()),
                    );
                  },
                  child: Chip(
                    label: Text('Sliver Widget'),
                    backgroundColor: Colors.green.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageResponsif()),
                    );
                  },
                  child: Chip(
                    label: Text('Responsif Media Query'),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageResponsifLayoutBuilder()),
                    );
                  },
                  child: Chip(
                    label: Text('Responsif Layout Builder'),
                    backgroundColor: Colors.brown.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageMaterialDesign()),
                    );
                  },
                  child: Chip(
                    label: Text('Material Design'),
                    backgroundColor: Colors.deepPurple.withOpacity(0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Chip(
                    label: Text('Login') ,
                    backgroundColor: Colors.pinkAccent,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Chip(
                    label: Text('Profile') ,
                    backgroundColor: Colors.teal,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: Chip(
                    label: Text('Landing Page') ,
                    backgroundColor: Colors.red,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageCounterScreen()),
                    );
                  },
                  child: Chip(
                    label: Text('Counter Screen') ,
                    backgroundColor: Colors.amber,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageGoNavigator()),
                    );
                  },
                  child: Chip(
                    label: Text('Go Navigator', style: TextStyle(
                      color: Colors.white,
                    ),) ,
                    backgroundColor: Colors.blueGrey,
                  ),
                ),


              ],
            ),
            SizedBox(height: 10),
            Stack(
              fit: StackFit.loose,
              alignment: AlignmentGeometry.center,
              children: [
                Image.network(
                  'http://png.pngtree.com/thumb_back/fh260/background/20211110/pngtree-latar-foto-estetik-polos-image_915537.png',
                  // height: 250,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(color: Colors.black.withOpacity(0.4)),

                const Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Text(
                    'Caption Bawah',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),

                const Positioned(
                  top: 16,
                  right: 8,
                  child: Badge(
                    label: Text('Caption Atas'),
                    backgroundColor: Color(0xFF2196F3),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
