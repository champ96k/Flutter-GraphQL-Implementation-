# Graphql Implementation

   GraphQL is a query language in which we send the query to the GraphQL Server. 
   The server executes the query at runtime for fulfilling those queries with your existing data.
   
   ##### API [Countries Trevorblades](https://countries.trevorblades.com/)
   ##### Package [Flutter GraphQL Package](https://pub.dev/packages/graphql_flutter#aws-appsync-support)
  
   First, we create a GraphQL Client and that client will talk to the GraphQL server we just to notify the client about the GraphQL Query.
   
   To use the client it first needs to be initialized with a link and cache. For this example, we will be using an HttpLink as our link and Optimisticache as our cache.
   
   ValueNotifier notified to their listener whenever there is any value change
   
   ## We are using Query() widget :
   which is defined by the plugin. It is not a native widget. The Query has two fields here
   1. options: 
     Options ask for the query. What query we want to send to the server and if you want to some variable along with query then we have to pass that from the options.
   
   2. builder: 
     builder is the same as other builders in a flutter. Builder changes its state based on the data. (You can compare this builder as FutureBuilder.
     
  
  
  ## Refernce
   
   [GraphQL with Flutter](https://medium.com/flutter-community/graphql-with-flutter-d974abcd2ccc)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
