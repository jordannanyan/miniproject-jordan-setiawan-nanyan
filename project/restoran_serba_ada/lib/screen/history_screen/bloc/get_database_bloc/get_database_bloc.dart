import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/helper/database_helper.dart';
import 'package:restoran_serba_ada/model/history_model.dart';

part 'get_database_event.dart';
part 'get_database_state.dart';

class GetDatabaseHistoryBloc extends Bloc<GetDatabaseEvent, GetDatabaseState> {
  GetDatabaseHistoryBloc() : super(GetDatabaseInitial()) {
    on<GetAllHistoryEvent>((event, emit) async {
      await getAllHistory(event, emit);
    });
    on<GetHistoryByIdEvent>((event, emit) async {
      await getHistoryById(event, emit);
    });
    on<UpdateHistoryEvent>((event, emit) async {
      await updateHistory(event, emit);
    });
    on<DeleteHistoryByIdEvent>((event, emit) async {
      await deleteHistory(event, emit);
    });
    on<InsertHistoryEvent>((event, emit) async {
      await insertHistory(event, emit);
    });
  }
  Future<void> getAllHistory(
    GetAllHistoryEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    List<HistoryModel> HistoryData = await DatabaseHelper().getHistory();
    emit(ValueAllHistoryState(historyModel: HistoryData));
  }

  Future<void> getHistoryById(
    GetHistoryByIdEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    HistoryModel historyModel = await DatabaseHelper().getHistoryById(
      event.id,
    );
    emit(
      ValueGetHistoryByIdState(
        historyModel: historyModel,
      ),
    );
  }

  Future<void> updateHistory(
    UpdateHistoryEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    await DatabaseHelper().updateHistory(
      event.historyModel,
    );
    List<HistoryModel> dataList = await DatabaseHelper().getHistory();
    emit(
      ValueUpdateHistoryState(historyModel: dataList),
    );
  }

  Future<void> deleteHistory(
    DeleteHistoryByIdEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    await DatabaseHelper().deleteHistory(event.id);
    List<HistoryModel> dataList = await DatabaseHelper().getHistory();
    emit(
      ValueDeleteHistoryState(historyModel: dataList),
    );
  }

  Future<void> insertHistory(
    InsertHistoryEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    await DatabaseHelper().insertHistory(
      event.historyModel,
    );
    emit(
      const ValueInsertHistoryState(
        message: 'Data Berhasil di Masukan',
      ),
    );
  }
}
