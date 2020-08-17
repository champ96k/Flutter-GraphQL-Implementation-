import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_implementation/Utils/Data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: 'https://countries.trevorblades.com/');
    ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
        link: httpLink,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        )));
    return GraphQLProvider(
      client: client,
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GraphQl"),
      ),
      body: Query(
          options: QueryOptions(
              documentNode: gql(queryString),
              variables: <String, dynamic>{"code": "AS"}),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Center(child: Text(result.exception.toString()));
            }

            if (result.loading) {
              return Center(child: Text('Loading'));
            }
            return ListView.builder(
              itemCount: result.data['countries'].length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      print("Button Press");
                      var code = result.data['countries'][index]['code'];
                      print("Code: $code");
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 100.0,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          title: Text(
                            "${result.data['countries'][index]['name']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          subtitle: Text(
                            "${result.data['countries'][index]['capital']}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Text(
                            "${result.data['countries'][index]['phone']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          trailing: Text(
                            "${result.data['countries'][index]['currency']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        )),
                  ),
                );
              },
            );
          }),
    );
  }
}
