import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  static List<Widget> _pages = <Widget>[
    Center(child: Text('Home')),
    HistoryPage(),
    Center(child: Text('Scheduled')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Scheduled',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulating data loading delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'History'),
                      Tab(text: 'Transaction Summary'),
                    ],
                  ),
                  
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          padding: EdgeInsets.all(8.0),
                          children: [
                            SearchBar(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Text('May 24, 2022', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            TransactionCard(
                              time: '14:45PM',
                              recipient: 'Emmanuel Rockson Kwabena Uncle Ebo',
                              phone: '024 123 4567',
                              amount: 'GHS 500',
                              status: 'Successful',
                              note: 'Cool your heart wai',
                              isSuccessful: true,
                            ),
                            TransactionCard(
                              time: '14:45PM',
                              recipient: 'Absa Bank',
                              phone: '024 123 4567',
                              amount: 'GHS 500',
                              status: 'Failed',
                              note: 'Cool your heart wai',
                              isSuccessful: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Text('May 23, 2022', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            TransactionCard(
                              time: '14:45PM',
                              recipient: 'Emmanuel Rockson',
                              phone: '024 123 4567',
                              amount: 'GHS 500',
                              status: 'Successful',
                              note: 'Cool your heart wai',
                              isSuccessful: true,
                            ),
                            TransactionCard(
                              time: '14:45PM',
                              recipient: 'Emmanuel Rockson',
                              phone: '024 123 4567',
                              amount: 'GHS 500',
                              status: 'Successful',
                              note: 'Cool your heart wai',
                              isSuccessful: true,
                            ),
                          ],
                        ),
                        Center(child: Text('Transaction Summary')),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}


class TransactionCard extends StatelessWidget {
  final String time;
  final String recipient;
  final String phone;
  final String amount;
  final String status;
  final String note;
  final bool isSuccessful;

  TransactionCard({
    required this.time,
    required this.recipient,
    required this.phone,
    required this.amount,
    required this.status,
    required this.note,
    required this.isSuccessful,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isSuccessful ? Colors.green : Colors.red,
          child: Icon(
            isSuccessful ? Icons.check_circle : Icons.error,
            color: Colors.white,
          ),
        ),
        title: Text(recipient),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(phone),
            Text(time),
            Divider(),
            Text(note),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              style: TextStyle(
                color: isSuccessful ? Colors.green : Colors.red,
              ),
            ),
            Text(amount),
          ],
        ),
      ),
    );
  }
}
