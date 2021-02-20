import java.util.*;


String [][] words = new String [3][21];


int count = 0;

BufferedReader wordList = createReader("../Word-Bank.txt");

try {
    for (int i = 0; i < words.length; i++) {
      for (int a = 0; a < words[0].length; a++) {
        words[i][a] = wordList.readLine();
      }
    }
}

catch (IOException e)
{ 
  println("fucku");
}

for (int i = 0; i <21; i++)
{
  println(words[0][i]);
}

println();

for (int i = 0; i <21; i++)
{
  println(words[1][i]);
}

println();

for (int i = 0; i <21; i++)
{
  println(words[2][i]);
}

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
}
