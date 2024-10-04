import 'dart:async';
import 'dart:math';
import 'dart:io';

List<int> getScreenSize() {
  return [stdout.terminalColumns.toInt(), stdout.terminalLines.toInt()];
}

void hideCursor() {
  stdout.write('\x1B[?25l'); // Hide cursor
}

void showCursor() {
  stdout.write('\x1B[?25h'); // Show cursor
}

void animasiAno() {
  List<String> text = [
    'H   H  BBBB   DDDD  ',
    'H   H  B   B  D   D ',
    'HHHHH  BBBB   D   D ',
    'H   H  B   B  D   D ',
    'H   H  BBBB   DDDD  ',
    '',
    '  A   N   N   OOO  ',
    ' A A  NN  N  O   O ',
    'AAAAA N N N  O   O ',
    'A   A N  NN  O   O ',
    'A   A N   N   OOO  ',
  ];

  int terminalHeight = stdout.terminalLines;
  int terminalWidth = stdout.terminalColumns;

  int textHeight = text.length;
  int textWidth = text[0].length;

  int startRow = terminalHeight;

  Timer.periodic(Duration(milliseconds: 100), (timer) {
    if (startRow <= (terminalHeight - textHeight) ~/ 2) {
      timer.cancel();
    } else {
      stdout.write('\x1B[2J\x1B[0;0H'); // Clear screen
      for (int i = 0; i < textHeight; i++) {
        int row = startRow + i;
        if (row >= 0 && row < terminalHeight) {
          int col = (terminalWidth - textWidth) ~/ 2;
          stdout.write('\x1B[${row};${col}H${text[i]}');
        }
      }
      startRow--;
    }
  });
}

void changeBackgroundColor(String colorCode) {
  stdout.write('\x1B[48;5;${colorCode}m'); // Change background color
  clearScreen();
}

void resetBackgroundColor() {
  stdout.write('\x1B[40m'); // Reset to black background
  clearScreen();
}

void printCoords(String text, int x, int y) {
  stdout.write('\x1B[${y};${x}H $text'); // Move cursor to the specified position
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // Clear entire screen, move cursor to 0;0
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

int randomMax(int max) {
  return Random().nextInt(max);
}

// Function to display the explosion with the specified background color
Future<void> printExplosion(int centerX, int centerY, String fireworkColor) async {
  List<List<String>> explosionFrames = [
    [
      "                    ",
      "                      ",
      "                      .     ",
      "                      ",
      "                       ",
      "                       ",
      "            X          ",
      "                       ",
      "                      ",
      "                         ",
      "                       ",
      "                      ",
      "                       ",
    ],
    [
      "                    ",
      "                      ",
      "                            ",
      "            .          ",
      "                      ",
      "                       ",
      "         X  X  X       ",
      "                       ",
      "                       ",
      "            .            ",
      "                       ",
      "                      ",
      "                       ",
    ],
    [
      "                    ",
      "                      ",
      "                            ",
      "            .          ",
      "                      ",
      "       X         X     ",
      "       X    X    X     ",
      "       X         X     ",
      "                       ",
      "            .            ",
      "                       ",
      "                      ",
      "                       ",
    ],
    [
      "                    ",
      "                      ",
      "                            ",
      "            .          ",
      "         X     X      ",
      "       X         X     ",
      "                       ",
      "       X         X     ",
      "         X     X      ",
      "            .            ",
      "                       ",
      "                      ",
      "                       ",
    ],
    [
      "                    ",
      "                      ",
      "                            ",
      "            .          ",
      "         X     X      ",
      "        X       X      ",
      "       X X  X  X X     ",
      "        X       X      ",
      "         X     X      ",
      "            .            ",
      "                       ",
      "                      ",
      "                       ",
    ],
    [
      "                    ",
      "                      ",
      "                            ",
      "            .          ",
      "         X     X      ",
      "        X       X      ",
      "      X  X  X  X  X     ",
      "        X       X      ",
      "         X     X      ",
      "            .            ",
      "                       ",
      "                      ",
      "                       ",
    ],
    [
      "     .      OOOOO      *",
      "   '     OOOOO OOOOO      ",
      "      OO             OO    ",
      "*   OO* *              OO  ",
      "   OO                   OO ",
      "   O   ***    *        **O ",
      "   OO   **       **     OO ",    
      "*   OO*                OO  ",
      "       OOO         OOO    .    *",
      "   '     OOOOO OOOOO      ",
      "     .      OOOOO      *",
    ]
  ];

  // Display each explosion frame
  for (var frame in explosionFrames) {
    // Fill the entire screen with the explosion color
    changeBackgroundColor(fireworkColor);

    for (int i = 0; i < frame.length; i++) {
      int frameX = centerX - (frame[0].length ~/ 2);
      frameX = frameX.clamp(0, getScreenSize()[0] - 1);

      printCoords(frame[i], frameX, centerY - 5 + i);
    }
    await delay(50);
  }

  await delay(500); // Show explosion for 0.5 seconds
  resetBackgroundColor(); // Reset background color after the explosion
}

void main() async {
  hideCursor();
  clearScreen();
  stdout.write("Enter the number of fireworks: ");
  int? jumlahKembangApi = (int.parse(stdin.readLineSync()!));
  jumlahKembangApi = jumlahKembangApi < 1 ? 1 : jumlahKembangApi;

  clearScreen();

  for (int j = 0; j < jumlahKembangApi; j++) {
    int minHeight = getScreenSize()[1] ~/ 3;
    int randomX = randomMax(getScreenSize()[0]);
    int randomY = random(minHeight, getScreenSize()[1] - minHeight);
    
    String randomColor = (j % 7 + 1).toString(); // Example: cycling through color codes 1-7

    if (j == 0) {
      randomX = getScreenSize()[0] ~/ 2;
      randomY = getScreenSize()[1] ~/ 2;
    }

    // Animate the firework rising with a black background
// Animate the firework rising
for (int i = 0; i < randomY; i++) {
  resetBackgroundColor(); // Reset background to default for the firework
// Apply the color to the text while rising with both background and foreground color
stdout.write('\x1B[38;5;${randomColor}m\x1B[48;5;0m'); // Set foreground and black background
printCoords("I", randomX, getScreenSize()[1] - i); // Print the "I"
stdout.write('\x1B[0m');
await delay(100);
}


    // Show the explosion with the specified color
    await printExplosion(randomX, getScreenSize()[1] - randomY, randomColor);
    
    await delay(300); // Delay before the next firework
  }
  clearScreen();
  animasiAno();
  showCursor();
}
