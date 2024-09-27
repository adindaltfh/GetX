import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menginisialisasi controller menggunakan Get.put()
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Demo Home Page with GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Gunakan Obx untuk memperbarui teks setiap kali count berubah
            Obx(() => Text(
              '${c.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
            SizedBox(height: 20),
            // Tombol untuk navigasi ke halaman lain (Other page)
            ElevatedButton(
              onPressed: () {
                Get.to(Other()); // Navigasi ke halaman 'Other'
              },
              child: Text('Go to Other Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        // Akses variabel count yang diperbarui
        child: Obx(() => Text(
          'Count on Other Page: ${c.count}',
          style: Theme.of(context).textTheme.headlineMedium,
        )),
      ),
    );
  }
}
