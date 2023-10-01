import 'package:adhkar/core/network/network_info.dart';
import 'package:adhkar/features/adhkar/data/adhkar_repository_impl.dart';
import 'package:adhkar/features/adhkar/data/datasources/adhkar_local_data_source.dart';
import 'package:adhkar/features/adhkar/data/datasources/adhkar_remote_data_source.dart';
import 'package:adhkar/features/adhkar/domain/usecases/get_adhkar.dart';
import 'package:adhkar/features/adhkar/domain/usecases/get_categories.dart';
import 'package:adhkar/features/adhkar/domain/usecases/get_collection_adhkar.dart';
import 'package:adhkar/features/adhkar/ui/bloc/adhkar_bloc.dart';

final repository = AdhkarRepositoryImpl(RemoteAdhkarDataSourceImpl(), LocalAdhkarDataSourceImpl(), NetworkInfoImpl());
final ab = AdhkarBloc(GetAdhkar(repository), GetCategories(repository), GetAdhkarbyCollection(repository));
