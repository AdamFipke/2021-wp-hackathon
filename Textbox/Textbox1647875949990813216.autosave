import java.util.*; 
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
String userWord = ""; 
String wordToType = "";
String [][] words = new String [3][20];
String [] TypedWords = new String[60];
int numOfTypedWords = 0;
int currentKeyIndex = 0;
TEXTBOX message;
int count = 0;
double start, end;

void setup() {
  Layout();
  background(180);
  //text file readers for words
  BufferedReader wordListEasy = createReader("../Word-Bank-Easy.txt");
  try {
    for (int a = 0; a < words[0].length; a++) {
      words[0][a] = wordListEasy.readLine();
    }
  } 
  catch (IOException a) {
    println("skjdfhksdj");
  } 
  BufferedReader wordListMedium = createReader("../Word-Bank-Medium.txt");
  try {
    for (int a = 0; a < words[0].length; a++) {
      words[1][a] = wordListMedium.readLine();
    }
  } 
  catch (IOException b) {
    println("skjdfhksdj");
  }
  BufferedReader wordListHard = createReader("../Word-Bank-Hard.txt");
  try {
    for (int a = 0; a < words[0].length; a++) {
      words[2][a] = wordListHard.readLine();
    }
  } 
  catch (IOException c) {
    println("skjdfhksdj");
  }

  wordToType = getNewWord();
  start = second() + (60 * (minute() + 60 * (hour() + 24 * (day()))));
}

public void settings() {
  size(1000, 1000);
}

void draw() {
  background(180);

  for (TEXTBOX text : textboxes) {
    text.DRAW();
  }

  text(wordToType, 400, 250);
}

void Layout() {
  message = new TEXTBOX((width - 200) / 2, 150, 200, 30);
  textboxes.add(message);
}

void mousePressed() {
  for (TEXTBOX text : textboxes) {
    text.PRESSED(mouseX, mouseY);
  }
}

void keyPressed() {

  if (key == wordToType.toLowerCase().charAt(currentKeyIndex)) { //if the letter is correct
    currentKeyIndex++;
    for (TEXTBOX text : textboxes) {
      text.KEYPRESSED(key, keyCode);
    }
    userWord = userWord + key;
    if (currentKeyIndex == wordToType.length()) {
      currentKeyIndex--;
    }
    //WPM goes up?
  } else if ((key == ENTER || key == RETURN) && (userWord.toLowerCase().equals(wordToType.toLowerCase()))) { //see if the key press is enter and if the word is correct
    //stores the typed word
    TypedWords[numOfTypedWords] = wordToType;
    numOfTypedWords++;
    //new word
    wordToType = getNewWord(); 
    currentKeyIndex = 0;
    message.Text = "";
    message.TextLength= 0;
    userWord = "";

    //score go up?
  } else { //key press is wrong or word is wrong
    message.screenShakeAmountX = 50;

    // add some text effects to show it's wrong    
    //make text red?
  }
}

String getNewWord() {
  textSize(30);
  fill(0);
  if (count < 50)
  {
    String word = words[0][(int)random(20)];
    Boolean newWord = false;
    while (!newWord) {
      word = words[0][(int)random(20)];
      newWord = true;
      for (int i = 0; i < numOfTypedWords; i++) { //makes sure to not give the person a word that's already been typed
        if  (word.toLowerCase().equals(TypedWords[i].toLowerCase())) {
          newWord = false;
        }
      }
    }
    return word;
  } else if ( count > 50 & count < 100) {
    String word = words[1][(int)random(20)];
    return word;
  } else if ( count > 100 & count < 150) {
    String word = words[2][(int)random(20)];
    return word;
  } else if (count > 150) {
    System.out.println("You win!!!");
    end = second() + (60 * (minute() + 60 * (hour() + 24 * (day()))));
    double time = end - start;
  }
  return "";
}
