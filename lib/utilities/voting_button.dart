import 'package:flutter/material.dart';
import 'constants.dart';

class VotingButton extends StatelessWidget {
  const VotingButton({
    Key? key,
    required this.name,
    required this.party,
    required this.onP,
  }) : super(key: key);
  final String name, party;
  final Function onP;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 150,
          width: 150,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: appColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: textStyle1,
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Text(
                      party,
                      style: textStyle1.copyWith(
                        color: appColor,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                  ),
                ),
              ],
            ),
          )),
      onTap: () {
        onP();
      },
    );
  }
}
