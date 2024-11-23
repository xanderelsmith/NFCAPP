
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class RecievepaymentRepositoryImp implements RecievepaymentRepository{

        final RecievepaymentRemoteDataSource remoteDataSource;
        RecievepaymentRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    