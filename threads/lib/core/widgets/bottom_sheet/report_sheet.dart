import 'package:flutter/material.dart';
import 'package:threads/core/constants/dummy.dart';
import 'package:threads/core/widgets/bottom_sheet/threads_sheet.dart';

class ReportSheet extends StatelessWidget {
  const ReportSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThreadsSheet(
      isVerticalPadding: true,
      children: [
        Text(
          "Report",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        ListTile(
          title: Text(
            "Why are you reporting this thread?",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          color: Colors.grey,
          height: 1,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: dummyReportTitles.length,
            separatorBuilder: (context, index) => Container(
              color: Colors.grey,
              height: 1,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                style: ListTileStyle.drawer,
                title: Text(
                  dummyReportTitles[index],
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
