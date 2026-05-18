import 'package:flutter/material.dart';

class PageFlexList extends StatelessWidget {
  const PageFlexList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Flexible List'),
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(title: Text('Item1')),
              ListTile(title: Text('Item2')),
              ListTile(title: Text('Item3')),
              ListTile(title: Text('Item4')),
              ListTile(title: Text('Item5')),
              ListTile(title: Text('Item6')),
              ListTile(title: Text('Item7')),
              ListTile(title: Text('Item8')),
              ListTile(title: Text('Item9')),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Text(
                      'Text Panjang yang Bisa wrap',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Press This Button'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PagelistVertical extends StatelessWidget {
  const PagelistVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ListView Vertical'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(title: Text('Item1')),
          ListTile(title: Text('Item2')),
          ListTile(title: Text('Item3')),
          ListTile(title: Text('Item4')),
          ListTile(title: Text('Item5')),
          ListTile(title: Text('Item6')),
          ListTile(title: Text('Item7')),
          ListTile(title: Text('Item8')),
          ListTile(title: Text('Item9')),
        ],
      ),
    );
  }
}

class GridViewCount extends StatelessWidget {
  const GridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('GridView')),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
        padding: EdgeInsets.all(16),
        children: [
          Container(height: 200, width: 200, color: Colors.red),
          Container(height: 200, width: 200, color: Colors.green),
          Container(height: 200, width: 200, color: Colors.blue),
          Container(height: 200, width: 200, color: Colors.yellow),
        ],
      ),
    );
  }
}

class PageSliverWidgetState extends StatefulWidget {
  const PageSliverWidgetState({super.key});

  @override
  State<PageSliverWidgetState> createState() => _PageSliverWidgetStateState();
}

class _PageSliverWidgetStateState extends State<PageSliverWidgetState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Page Silver Widgets'),
                background: Image.network(
                  'http://png.pngtree.com/thumb_back/fh260/background/20211110/pngtree-latar-foto-estetik-polos-image_915537.png',
                  fit: BoxFit.cover,
                )
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(color: Colors.orange, child: Text('Widget 1')),
                  Container(height: 200, width: 200, color: Colors.green),
                  Container(height: 200, width: 200, color: Colors.red),
                  Container(height: 200, width: 200, color: Colors.blue),
                  Container(height: 200, width: 200, color: Colors.orange),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}



