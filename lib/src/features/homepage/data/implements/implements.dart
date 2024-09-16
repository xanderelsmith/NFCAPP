
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class HomepageRepositoryImp implements HomepageRepository{

        final HomepageRemoteDataSource remoteDataSource;
        HomepageRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    