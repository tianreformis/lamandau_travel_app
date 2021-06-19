import 'api_manager.dart';

Future<dynamic> newsCall() => ApiManager.instance.makeApiCall(
      callName: 'NEWS',
      apiDomain: 'newsapi.org',
      apiEndpoint: 's/indonesia-news-api',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );
