import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Spacer(
            flex: 1,
          ),
          Text(
            'home',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.03,
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text('Welcome To DashBoardScrean',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two images per row
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 15,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.width / 25,
                    ),
                  );
                },
              ),
            ),
          ),
          const Text(
            'comments of the Customers',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                // return ListTile(
                //   leading: Container(
                //     color: Colors.amber,
                //   ),
                //   title: Text('main title'),
                //   subtitle: Text('main subtitle'),
                //   isThreeLine: false,
                //   trailing: Text('rating'),
                // );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Title(
                      color: Colors.green,
                      child: Container(
                        color: Colors.green,
                        height: 30,
                        width: double.infinity,
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
