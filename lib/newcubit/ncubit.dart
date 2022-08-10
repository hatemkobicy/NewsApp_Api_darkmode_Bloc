
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/network/Local/cache_helper.dart';
import 'package:todo_list/newcubit/nstates.dart';

class Nappcubit extends Cubit<Nappstatus>{
  Nappcubit():super(Nappstatusinitalstate());
  static Nappcubit get(context)=>BlocProvider.of(context);

  bool isDark = false;
  void changethememode({bool? fromShared}) {
    if(fromShared!=null)
    {
      isDark =fromShared;
      emit(Changenapptheme());
    } else{ isDark =!isDark;
    CasheHelper.putData(key: 'isDark', value: isDark).then((value) {
    emit(Changenapptheme());
    });
    }
  }
}