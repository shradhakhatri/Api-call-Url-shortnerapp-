import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shortner_app/views/url_shortner_provider.dart';

class Urlshortnerscreen extends StatelessWidget {
  const Urlshortnerscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Urlshortnerprovider>(context, listen: true);

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'URL Shortner',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Shorten your long URL quickly',
              style: TextStyle(color: Colors.grey, fontSize: 8),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: state.urlController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Paste the link'),
            ),
            const SizedBox(
              height: 16,
            ),
            Builder(
              builder: (context) => GestureDetector(
                child: Text(state.shortUrlMessage),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: state.shortUrlMessage))
                      .whenComplete(() => Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("Link is copied"))));
                },
              ),
            ),
            const Spacer(),
            Container(
              child: FlatButton(
                onPressed: () {
                  state.handleGetLinkButton();
                },
                color: Colors.blue,
                child: const Text(
                  'GET LINK',
                  style: TextStyle(color: Colors.white),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
