import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  "Eiusmod cupidatat magna dolore officia minim do ipsum cupidatat cupidatat eu amet mollit deserunt eiusmod.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.trash_fill,
                  size: 28,
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Enim aliqua cillum sit elit commodo anim deserunt. Magna nisi do elit nisi culpa sint ex  Amet nostrud consequat incididunt nisi",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(.6),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "May 21, 2023",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
