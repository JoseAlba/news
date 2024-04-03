// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather/main.dart';
// import 'package:weather/views/news_page.dart';
//
// void main() {
//   testWidgets('NewsScreen should display articles correctly',
//       (WidgetTester tester) async {
//     // Define a mock response for the HTTP request
//     final mockResponse = {
//       "results": [
//         {
//           "title": "Test Title 1",
//           "abstract": "Test abstract 1",
//           "multimedia": [
//             {"url": "https://example.com/image1.jpg"}
//           ]
//         },
//         {
//           "title": "Test Title 2",
//           "abstract": "Test abstract 2",
//           "multimedia": [
//             {"url": "https://example.com/image2.jpg"}
//           ]
//         },
//       ]
//     };
//
//     // Mock the HTTP response
//     http.Response response = http.Response(jsonEncode(mockResponse), 200);
//
//     // Mock the HTTP client to return the mock response
//     http.Client client = MockClient((request) async {
//       return response;
//     });
//
//     // Replace the http.Client instance used by your app with the mock client
//     setUp(() {
//       HttpOverrides.global = TestHttpOverrides(client);
//     });
//
//     // Build the widget and trigger a frame
//     await tester.pumpWidget(NewsApp());
//
//     // Verify that NewsScreen is rendered
//     expect(find.byType(NewsPage), findsOneWidget);
//
//     // Wait for the API call to complete
//     await tester.pumpAndSettle();
//
//     // Verify that ListTiles are displayed for each article
//     expect(find.byType(ListTile), findsNWidgets(2));
//
//     // Verify that the articles are displayed correctly
//     expect(find.text('Test Title 1'), findsOneWidget);
//     expect(find.text('Test Title 2'), findsOneWidget);
//     expect(find.text('Test abstract 1'), findsOneWidget);
//     expect(find.text('Test abstract 2'), findsOneWidget);
//
//     // Verify that images are displayed correctly
//     expect(
//         find.byWidgetPredicate(
//             (widget) => widget is Image && widget.image is NetworkImage),
//         findsNWidgets(2));
//   });
// }
//
// // Mock HTTP client for testing
// class MockClient extends http.BaseClient {
//   final http.Client _inner;
//
//   MockClient(this._inner);
//
//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     return _inner.send(request);
//   }
// }
//
// // TestHttpOverrides class for overriding HTTP client behavior
// class TestHttpOverrides extends HttpOverrides {
//   final http.Client client;
//
//   TestHttpOverrides(this.client);
//
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return HttpClientWithMockClient(client);
//   }
// }
//
// class HttpClientWithMockClient implements HttpClient {
//   final http.Client _client;
//
//   HttpClientWithMockClient(this._client);
//
//   @override
//   Future<HttpClientRequest> getUrl(Uri url) async {
//     final clientRequest = await _client.getUrl(url);
//     return _HttpClientRequest(clientRequest);
//   }
//
//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }
//
// class _HttpClientRequest implements HttpClientRequest {
//   final http.Request _request;
//
//   _HttpClientRequest(this._request);
//
//   @override
//   Future<HttpClientResponse> close() async {
//     final streamedResponse = await _request.close();
//     return _HttpClientResponse(streamedResponse);
//   }
// }
//
// class _HttpClientResponse implements HttpClientResponse {
//   final http.StreamedResponse _streamedResponse;
//
//   _HttpClientResponse(this._streamedResponse);
//
//   @override
//   StreamSubscription<Uint8List> listen(void onData(Uint8List event)?,
//       {Function? onError, void onDone()?, bool? cancelOnError}) {
//     return _streamedResponse.stream.listen(onData,
//         onError: onError, onDone: onDone, cancelOnError: cancelOnError);
//   }
// }
