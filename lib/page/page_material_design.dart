import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_day1/page/page_flex_list.dart';

class PageMaterialDesign extends StatelessWidget {
  const PageMaterialDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple.shade900,
        ),
        brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),

        appBarTheme: AppBarTheme(centerTitle: true, scrolledUnderElevation: 0),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: PageContentMaterial(),
    );
  }
}

class PageContentMaterial extends StatefulWidget {
  const PageContentMaterial({super.key});

  @override
  State<PageContentMaterial> createState() => _PageContentMaterialState();
}

class _PageContentMaterialState extends State<PageContentMaterial> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    PageSimpleForm(),
    HomeIOSScreen(),
    PageButtonMaterial(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
        destinations: [
          NavigationDestination(icon: Icon(Icons.list), label: 'Form'),
          NavigationDestination(icon: Icon(Icons.apple), label: 'IOS'),
          NavigationDestination(icon: Icon(Icons.smart_button_rounded), label: 'Button'),
        ],
      ),
    );
  }
}

class PageButtonMaterial extends StatelessWidget {
  const PageButtonMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Typography
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Typography',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              clipBehavior: Clip.antiAlias,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Dialog Title'),
                      content: Text('Dialog Content'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Elevated Button'),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                //modal botton shade
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (context) => Container(
                    padding: EdgeInsets.all(16),
                    height: 200,
                    color: Colors.grey,
                    child: Center(child: Text('Modal Bottom Sheet')),
                  ),
                );
              },
              child: Text('Outline Button'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item Berhasil Di simpan'),
                    duration: Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
              },
              child: Text('Text Button'),
            ),
            SizedBox(height: 10),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            SizedBox(height: 10),
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
            SizedBox(height: 10),
            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.camera),
              label: Text('Outlined Button Icon'),
            ),
            SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.browse_gallery),
              label: Text('Text Button Icon'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.escalator),
              label: Text('Elevated Button Icon'),
            ),
            SizedBox(height: 10),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.gamepad),
              label: Text('Filled Button Icon'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageCupertinoIOS extends StatelessWidget {
  const PageCupertinoIOS({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino IOS',
      theme: CupertinoThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.black,
        ),
        ),
      home: HomeIOSScreen(),
      //   navigationBar: CupertinoNavigationBar(
      //     middle: Text('Cupertino IOS'),
      //   ),
      //   child: Center(child: Text('Cupertino IOS')),
      // ),
    );
  }
}

class HomeIOSScreen extends StatelessWidget {
  const HomeIOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cupertino IOS'),
            SizedBox(height: 10),
            CupertinoButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                showCupertinoDialog(
                  context: context, builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text('Cupertino Dialog'),
                    content: Text('Cupertino Content'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      )
                    ],
                  );
                },
                );
              },
              child: Text('Cupertino Button'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageSimpleForm extends StatefulWidget {
  const PageSimpleForm({super.key});

  @override
  State<PageSimpleForm> createState() => _PageSimpleFormState();
}

class _PageSimpleFormState extends State<PageSimpleForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Simple Form'),
        backgroundColor: Colors.deepPurple,
      ),
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text ('Simple Form'),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukan Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.all(10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Masukan Nomor Telepon',
                border : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
              ),
            )),

          ],
        ),
      )
    );
  }
}

