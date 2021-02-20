import java.util.*;

String [][] words = new String [3][20];

int count = 0;

BufferedReader wordListEasy = createReader("../Word-Bank-Easy.txt");

try {
  for (int a = 0; a < words[0].length; a++) {
    words[0][a] = wordListEasy.readLine();
  }
} catch (IOException e){println("skjdfhksdj");} catch (ArrayIndexOutOfBoundsException a){};

BufferedReader wordListMedium = createReader("../Word-Bank-Medium.txt");

try {
  for (int a = 0; a < words[0].length; a++) {
    words[1][a] = wordListMedium.readLine();
  }
} catch (IOException e){println("skjdfhksdj");}

BufferedReader wordListHard = createReader("../Word-Bank-Hard.txt");

try {
  for (int a = 0; a < words[0].length; a++) {
    words[2][a] = wordListHard.readLine();
  }
} catch (IOException e){println("skjdfhksdj");} 


if (count < 50)
{
  String word = words[1][(int)random(20)];
  System.out.println(word);
} else if ( count > 50 & count < 100) {
  String word = words[2][(int)random(20)];
  System.out.println(word);
} else if ( count > 100 & count < 150) {
  String word = words[2][(int)random(20)];
  System.out.println(word);
} else if (count > 150) {
  System.out.println("You win!!!");
