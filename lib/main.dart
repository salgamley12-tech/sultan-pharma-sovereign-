import 'package:flutter/material.dart';

void main() {
  runApp(const SultanPharmaSovereignApp());
}

class SultanPharmaSovereignApp extends StatelessWidget {
  const SultanPharmaSovereignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سلطان فارما السيادي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F7F6),
        fontFamily: 'Cairo',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const InventoryView(),
    const SalesView(),
    const ReportsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سلطان فارما - النظام السيادي المركزي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.teal.shade800,
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.teal.shade800,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'المخزون'),
          BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'المبيعات'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'التقارير'),
        ],
      ),
    );
  }
}

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final ListmedicineList = [
      {'name': 'باراسيتامول 500 مغ', 'stock': '120 شريط', 'price': '1000 ريال'},
      {'name': 'أموكسيسيلين 250 مغ', 'stock': '45 علبة', 'price': '3500 ريال'},
      {'name': 'فولتارين حقن', 'stock': '80 أمبول', 'price': '1500 ريال'},
      {'name': 'أوميبرازول 20 مغ', 'stock': '60 كبسولة', 'price': '4000 ريال'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: medicineList.length,
      itemBuilder: (context, index) {
        final med = medicineList[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal.shade100,
              child: const Icon(Icons.medical_services, color: Colors.teal),
            ),
            title: Text(med['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('المتوفر: ${med['stock']}'),
            trailing: Text(med['price']!, style: TextStyle(color: Colors.teal.shade700, fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.point_of_sale, size: 80, color: Colors.teal),
          SizedBox(height: 16),
          Text('نقطة البيع السيادية جاهزة لتسجيل الفواتير', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 80, color: Colors.teal),
          SizedBox(height: 16),
          Text('تقارير الأرباح والمخزون اللحظية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
