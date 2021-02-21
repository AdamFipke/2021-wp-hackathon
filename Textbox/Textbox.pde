import java.util.*; 
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
String userWord = ""; 
String wordToType = "";
String [][] words = new String [3][];
String [] TypedWords = new String[999];
int numOfTypedWords = 0;
int currentKeyIndex = 0;
TEXTBOX message;
int count = 0;
double start, end;
PImage life1;
PImage life2;
PImage life3;
PImage life4;
PImage life5;
//cats
PVector location; 
PVector velocity;  
PVector gravity;   
PImage[] cats = new PImage[6];
PImage cat1;
PImage cat2;
int p = 1;
int i = 0;
float score = 0;
Cat c1;
Cat c2;
Cat c3;
Cat c4;
Cat c5;
Cat c6;

int E2Y = 130;
Boolean [] show = {true, true, true, true, true};
int livesLost = -1;
int cccombo = 0;

void setup() {
  Layout();
  background(180);

  //text file readers for words
  words[0] = new String[998];
  BufferedReader wordListEasy = createReader("../Word-Bank-Easy.txt");
  try {
    for (int a = 0; a < words[0].length; a++) {
      words[0][a] = wordListEasy.readLine();
    }
  } 
  catch (IOException a) {
    println("skjdfhksdj");
  } 
  words[1] = new String[1470];
  BufferedReader wordListMedium = createReader("../Word-Bank-Medium.txt");
  try {
    for (int a = 0; a < words[1].length; a++) {
      words[1][a] = wordListMedium.readLine();
    }
  } 
  catch (IOException b) {
    println("skjdfhksdj");
  }
  words[2] = new String[335];
  BufferedReader wordListHard = createReader("../Word-Bank-Hard.txt");
  try {
    for (int a = 0; a < words[2].length; a++) {
      words[2][a] = wordListHard.readLine();
    }
  } 
  catch (IOException c) {
    println("skjdfhksdj");
  }

  wordToType = getNewWord();
  start = second() + (60 * (minute() + 60 * (hour() + 24 * (day()))));

//cats
  location = new PVector(100, 100);
  velocity = new PVector(3, 7);
  gravity = new PVector(0, 0.4);
  c1 = new Cat(loadImage("../../catpics/grey-cat.png"));
  c2 = new Cat(loadImage("../../catpics/blue-cat.png"));
  c3 = new Cat(loadImage("../../catpics/green-cat.png"));
  c4 = new Cat(loadImage("../../catpics/purple-cat.png"));
  c5 = new Cat(loadImage("../../catpics/yellow-cat.png"));
  c6 = new Cat(loadImage("../../catpics/pop-cat.png"));
}

public void settings() {
  size(1000, 1000);
}

void draw() {

  background(180);

  livesDisplay();

  for (TEXTBOX text : textboxes) {
    text.DRAW();
  } 


  //CCCC COMBO
  int tempCombo = 0;
  if (cccombo >= 10) {
    message.TEXTSIZE = 24 + cccombo;
    tempCombo = cccombo;
  } else {
    message.TEXTSIZE = 24 + tempCombo;
    if (tempCombo > 0) {
      tempCombo--;
    }
  }
  fill(count*cccombo/3, count*cccombo/6, count*cccombo/9);
  text(wordToType, 400, 250);
  text("Combo: "+cccombo, 100-message.screenShakeAmountX, 100+message.screenShakeAmountY);
  fill(255);
  //message.TEXTSIZE = 24;




  //CATS
   if (numOfTypedWords >= 10) {
    c1.display();
    c1.move();
    score = score + 0.1;
  }
  if (numOfTypedWords >= 20) {
    c2.display();
    c2.move();
  }
  if (numOfTypedWords >= 30) {
    c3.display();
    c3.move();
  }
  if (numOfTypedWords >= 40) {
    c4.display();
    c4.move();
  }
  if (numOfTypedWords >= 50) {
    c5.display();
    c5.move();
  }

  if (numOfTypedWords >= 60) {
    c6.display();
    c6.move();
  }

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
    count++;
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
    cccombo++;
    //new word
    wordToType = getNewWord(); 
    currentKeyIndex = 0;
    message.Text = "";
    message.TextLength= 0;
    userWord = "";
  } else { //key press is wrong or word is wrong
    message.screenShakeAmountX = 50;
    livesLost++;
    cccombo = 0;
    if (livesLost >= 5)
    {
    } else
      show[livesLost] = false;




    // add some text effects to show it's wrong    
    //make text red?
  }
}

String getNewWord() {
  textSize(30);
  fill(0);
  if (count < 100)
  {
    String word = words[0][(int)random(words[0].length)];
    Boolean newWord = false;
    while (!newWord) {
      word = words[0][(int)random(words[0].length)];
      newWord = true;
      for (int i = 0; i < numOfTypedWords; i++) { //makes sure to not give the person a word that's already been typed
        if  (word.toLowerCase().equals(TypedWords[i].toLowerCase())) {
          newWord = false;
        }
      }
    }
    return word;
  } else if ( count > 100 & count < 200) {
    String word = words[1][(int)random(words[1].length)];
    Boolean newWord = false;
    while (!newWord) {
      word = words[1][(int)random(words[1].length)];
      newWord = true;
      for (int i = 0; i < numOfTypedWords; i++) { //makes sure to not give the person a word that's already been typed
        if  (word.toLowerCase().equals(TypedWords[i].toLowerCase())) {
          newWord = false;
        }
      }
    }
    return word;
  } else if ( count > 200 & count < 300) {
    String word = words[2][(int)random(words[2].length)];
    Boolean newWord = false;
    while (!newWord) {
      word = words[2][(int)random(words[2].length)];
      newWord = true;
      for (int i = 0; i < numOfTypedWords; i++) { //makes sure to not give the person a word that's already been typed
        if  (word.toLowerCase().equals(TypedWords[i].toLowerCase())) {
          newWord = false;
        }
      }
    }
    return word;
  } else if (count > 150) {
    System.out.println("You win!!!");
    end = second() + (60 * (minute() + 60 * (hour() + 24 * (day()))));
    double time = end - start;
  }
  return "";
}

void livesDisplay() {
  life1 = loadImage("../../catpics/purple-cat.png");
  life1.resize(100, 100);
  if (show[0]) image(life1, 850, 30);

  life2 = loadImage("../../catpics/purple-cat.png");
  life2.resize(100, 100);
  if (show[1])image(life2, 750, 30);

  life3 = loadImage("../../catpics/purple-cat.png");
  life3.resize(100, 100);
  if (show[2])image(life3, 650, 30);

  life4 = loadImage("../../catpics/purple-cat.png");
  life4.resize(100, 100);
  if (show[3])image(life4, 550, 30);

  life5 = loadImage("../../catpics/purple-cat.png");
  life5.resize(100, 100);
  if (show[4])image(life5, 450, 30);
}
