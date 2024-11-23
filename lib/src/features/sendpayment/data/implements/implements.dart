
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class SendpaymentRepositoryImp implements SendpaymentRepository{

        final SendpaymentRemoteDataSource remoteDataSource;
        SendpaymentRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    