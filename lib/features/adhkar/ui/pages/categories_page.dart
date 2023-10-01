import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adhkar/core/ui/widgets/loading_indicator.dart';
import 'package:adhkar/features/adhkar/domain/entities/category.dart';
import 'package:adhkar/features/adhkar/ui/bloc/adhkar_bloc.dart';
import 'package:adhkar/features/adhkar/ui/pages/adhkar_page.dart';
import 'package:adhkar/features/adhkar/ui/widgets/message_display.dart';

class CategoriesPage extends StatelessWidget {
  List<Category>? data;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AdhkarBloc>(context).getCategoriesEvent();
    return Scaffold(
      /*appBar: AppBar(
        title: Text(S.of(context).adhkar),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => _goToAdhkarPage(context, 0, 1))
        ],
      ),*/
      body: Container(
        child: view(context),
      ),
    );
  }

  Widget view(BuildContext context) {
    return BlocBuilder<AdhkarBloc, AdhkarState>(
      builder: (blocContext, state) {
        if (state is Empty) {
          return const MessageDisplay(
            message: 'Loadiiiiiiing Empty',
          );
        } else if (state is Loading) {
          return LoadingIndicator();
        } else if (state is LoadedCategories) {
          data = state.data;
          return listView();
        } else if (state is Error) {
          return MessageDisplay(
            message: state.message,
          );
        }
        return listView();
      },
    );
  }

  Widget listView() {
    if (data != null) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => _categoriesItem(_, data![index]),
        itemCount: data!.length,
      );
    } else {
      return const Material(
        child: MessageDisplay(message: 'No State type Again 3:)'),
      );
    }
  }

  Widget _categoriesItem(context, Category data) {
    return GestureDetector(
      onTap: () => _goToAdhkarPage(context, data.id, 0),
      child: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/adhkar/square.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(data.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(fontSize: 24, color: Color(0xFFDCB36E), fontFamily: 'LoransMuna', decoration: TextDecoration.none)),
            ),
          )
        ],
      ),
    );
  }

  void _goToAdhkarPage(context, int categoryId, int collectionId) {
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return AdhkarPage(categoryId, collectionId);
      },
    ));
  }
}

/*
Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: Padding(
                    child: ImageView(data.image),
                    padding: EdgeInsets.all(20),
                  )),
              Expanded(
                  flex: 3,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      data.name +
                          (data.count != null ? ' (${data.count})' : ''),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
            ],
          ),
        ),
      )
*/
