import 'package:flutter/material.dart';

//initialize: CustomListView<String>(list, getItemWidget),
class CustomListView<T> extends StatefulWidget {
  final List<T>? list;
  final Widget Function(T, int) itemViewWidget;
  final Widget Function() emptyListWidget;
  final Axis? scrollDirection;
  final ScrollController? scrollController;

  const CustomListView(this.list, this.itemViewWidget, this.emptyListWidget,
      {this.scrollDirection, this.scrollController});

  @override
  _CustomListViewState<T> createState() => _CustomListViewState<T>();
}

class _CustomListViewState<T> extends State<CustomListView<T>> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return widget.list == null || widget.list?.length == 0
        ? widget.emptyListWidget()
        : Scrollbar(
            controller: widget.scrollController ?? _scrollController,
            trackVisibility: true,
            child: ListView.builder(
              scrollDirection: widget.scrollDirection ?? Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              controller: widget.scrollController ?? _scrollController,
              itemCount: widget.list?.length,
              itemBuilder: (context, index) {
                return widget.itemViewWidget(widget.list![index], index);
              },
            ),
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
