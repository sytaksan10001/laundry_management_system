import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_management_system/data/source/source_laundry.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Search Laundry'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                        child: DInput(
                      controller: search,
                      hint: 'Input ID Laundry',
                    )),
                    DView.spaceWidth(),
                    SizedBox(
                      height: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            // var laundry = await SourceLaundry.searchById(search.text);
                            // cSearch.data = laundry ?? Laundry();
                          },
                          child: const Text('Search')),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}