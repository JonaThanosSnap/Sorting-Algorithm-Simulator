///////////////////////////////////////////////////////////////////////////////
//                                                                           //
// Name: Jonathan Ge                                                         //
//                                                                           //
// Date: November 10, 2020                                                   //
//                                                                           //
// Course: ICS4UI                                                            //
//                                                                           //
// Teacher: Mr. Schattman                                                    //
//                                                                           //
// Assignment: Final Coding Assignment: Sorting Simulator                    //
//                                                                           //
// Description: This code visually models the behaviours of different        //
// sorting algorithms, specifically, bubble sort, insertion sort,            //
// selection sort and shell sort. In addition, the GUI allows                //
// for the user to change specific setting such as the type of sorting       //
// algorithm, background image, speed of the animation, and the number of    //
// cards. Finally, the GUI also allows the user to pause the animation at    //
// any given point as well as a reset button to draw a new set of cards.     //
//                                                                           //
// User Tips:                                                                //
// 1. The animation will run smoothest with the "No Background" option       //
//                                                                           //
// 2. After changing any setting, the resume button will turn green and      //
//    display "Start". Click this to run the animation with the new settings.//
///////////////////////////////////////////////////////////////////////////////

//Global Variables and Libraries

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                                                                         //
//g4p library imported                                                                                                                                   //
                                                                                                                                                         //
import g4p_controls.*;                                                                                                                                   //
                                                                                                                                                         //
//boolean for the pause button                                                                                                                           //
                                                                                                                                                         //
boolean paused = false;                                                                                                                                  //
                                                                                                                                                         //
//number of cards                                                                                                                                        //
                                                                                                                                                         //
int n;                                                                                                                                                   //
                                                                                                                                                         //
//x and y locations of the card objects                                                                                                                  //
                                                                                                                                                         //
int xLocation;                                                                                                                                           //
                                                                                                                                                         //
int yLocation;                                                                                                                                           //
                                                                                                                                                         //
//index counter to count which card should move at a given time                                                                                          //                                          
                                                                                                                                                         //
int t;                                                                                                                                                   //
                                                                                                                                                         //
//arrays for the card objects and another one for their respective values                                                                                //
                                                                                                                                                         //
Card[] deckList = new Card[n];                                                                                                                           //
                                                                                                                                                         //
int[] cardValues = new int[n];                                                                                                                           //
                                                                                                                                                         //
//speed is the value taken from the GUI and speedFrames uses speed to determine the actual speed of the cards                                            //
                                                                                                                                                         //
int speed;                                                                                                                                               //
                                                                                                                                                         //
int speedFrames;                                                                                                                                         //
                                                                                                                                                         //                                                                                                                                                                                                                                                                                                          //
//The hopper used for insertion sort                                                                                                                     //
                                                                                                                                                         //
int[] hopperMoves = new int[n];                                                                                                                          //
                                                                                                                                                         //
//swapFrame counts the current frame during the animation                                                                                                //
                                                                                                                                                         //
int swapFrame = 0;                                                                                                                                       //
                                                                                                                                                         //
//can be "Puppies", "Sunset", "Poker", "Julia Set" or "No Background"                                                                                    //
                                                                                                                                                         //
String backgroundSelection = "Poker";                                                                                                                    //
                                                                                                                                                         //
//can be "Bubble Sort", "Insertion Sort", "Selection Sort", or "Shell Sort" (Note: capitalization is important)                                          //
                                                                                                                                                         //
String sortType = "Bubble Sort";                                                                                                                         //
                                                                                                                                                         //
PImage background;                                                                                                                                       //
                                                                                                                                                         //
//IndicesToBeSwapped stores which indices in deckList should be swapped                                                                                  //
                                                                                                                                                         //
ArrayList<Integer> indicesToBeSwapped = new ArrayList<Integer>();                                                                                        //
                                                                                                                                                         //
//swapIndex stores which index in deckList indicesToBeSwapped should swap with. indicesToBeSwapped.get(i) will always swap with swapIndex.get(i)         //  
                                                                                                                                                         //
//swapIndex and moveFrame are only used for Selection Sort and Shell Sort                                                                                //
                                                                                                                                                         //                     
ArrayList<Integer> swapIndex = new ArrayList<Integer>();                                                                                                 //
                                                                                                                                                         //
//counts the distance from indicesToBeSwapped.get(i) to swapindex.get(i)                                                                                 //                                                                                                                                                         
                                                                                                                                                         //                                                                                                                                                         
ArrayList<Integer> moveFrame = new ArrayList<Integer>();                                                                                                 //
                                                                                                                                                         //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Setup Function

///////////////////////////////////////////////////////////////////////////////////////
                                                                                     //
void setup() {                                                                       //
                                                                                     //
  yLocation = (height/2)-75;                                                         //
                                                                                     //
  createGUI();                                                                       //
                                                                                     //
  t = 0;                                                                             //
                                                                                     //
  frameRate(30);                                                                     //
                                                                                     //  
  //Note: The speed and smoothness of the animation depends on the window size       //
                                                                                     //  
  //smaller size = smoother animation and vice versa                                 //
                                                                                     //
  size(1600, 800);                                                                   //
                                                                                     //
  reset();                                                                           //
                                                                                     //
}                                                                                    //
                                                                                     //
///////////////////////////////////////////////////////////////////////////////////////

//Draw Function

//////////////////////////////////////////////////////////////////////////////////////////
                                                                                        //
void draw() {                                                                           //
                                                                                        //  
  //if paused is true, it pauses the animation                                          //
                                                                                        //
  if (!paused) {                                                                        //
                                                                                        //    
    //The animation runs smoother and faster without having to load a background image  //
                                                                                        //    
    //The user may decide if they want an image background or not in the GUI            //
                                                                                        //    
    if (backgroundSelection.equals("No Background")){                                   //
                                                                                        //    
      background(0);                                                                    //
                                                                                        //    
    }                                                                                   //
                                                                                        //    
    else{                                                                               //
                                                                                        //    
      image(background, 0, 0, width, height);                                           //
                                                                                        //    
    }                                                                                   //
                                                                                        //
    for (int i =0; i<n; i++) {                                                          //
                                                                                        //
      deckList[i].drawCard(); //draws the list of unsorted cards onto the screen        //
                                                                                        //      
    }                                                                                   //
                                                                                        //  
                                                                                        //                                                                                          
    //This determines how the cards will swap accoridng to the sorting algorithm        //
                                                                                        //                                                                                          
    swapTheCards();                                                                     //
                                                                                        //    
  }                                                                                     //
                                                                                        //  
}                                                                                       //
                                                                                        //
//////////////////////////////////////////////////////////////////////////////////////////

//This code swaps cards which are right next eachother or "neighbours" (The difference in their x values is exactly 100)

//Used for bubble and insertion sort

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                                       //
void neighbourSwap(){                                                                                                  //
                                                                                                                       //  
 swapFrame++;                                                                                                          //
                                                                                                                       //
  if (indicesToBeSwapped.size() >= 1) {                                                                                //
                                                                                                                       //    
    if (t+1 <= indicesToBeSwapped.size()) {                                                                            //
                                                                                                                       //      
      if (swapFrame <= 100/speedFrames) {                                                                              //
                                                                                                                       //        
        swapPositions(deckList, indicesToBeSwapped.get(t), indicesToBeSwapped.get(t)+1);                               //
                                                                                                                       //        
        if (swapFrame == 100/speedFrames) {                                                                            //
                                                                                                                       //          
          Card temp = deckList[indicesToBeSwapped.get(t)]; //temporary card object to store the info                   //
                                                                                                                       //          
          deckList[indicesToBeSwapped.get(t)] = deckList[indicesToBeSwapped.get(t)+1]; //swaps values in deckList      //
                                                                                                                       //          
          deckList[indicesToBeSwapped.get(t)+1] = temp;                                                                //
                                                                                                                       //          
        }                                                                                                              //
                                                                                                                       //        
      }                                                                                                                //
                                                                                                                       //      
      else {                                                                                                           //
                                                                                                                       //        
        swapFrame = 0;                                                                                                 //
                                                                                                                       //        
        t++;                                                                                                           //
                                                                                                                       //
      }                                                                                                                //
                                                                                                                       //
    }                                                                                                                  //
                                                                                                                       //
  }                                                                                                                    //
                                                                                                                       //
}                                                                                                                      //
                                                                                                                       //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//This swaps cards that are not "neighbours" (the difference in their x values is greater than 100)

//Used for selection and shell sort

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                                //
void longDistanceSwap(){                                                                                        //
                                                                                                                //  
  swapFrame++;                                                                                                  //
                                                                                                                //  
  if (indicesToBeSwapped.size()>=1) {                                                                           //
                                                                                                                //    
    //Note: this starts at t+1 bcause there's no point in comparing index 0 with itself                         //
                                                                                                                //    
    if (t+1 <= indicesToBeSwapped.size()) {                                                                     //
                                                                                                                //      
      if (swapFrame <= moveFrame.get(t)) {                                                                      //
                                                                                                                //        
        swapPositions(deckList, swapIndex.get(t), indicesToBeSwapped.get(t));                                   //
                                                                                                                //        
        if (swapFrame == moveFrame.get(t)) {                                                                    //
                                                                                                                //          
          Card temp = deckList[swapIndex.get(t)]; //temporary card object to store the info                     //
                                                                                                                //          
          deckList[swapIndex.get(t)] = deckList[indicesToBeSwapped.get(t)]; //swaps values in deckList          //
                                                                                                                //          
          deckList[indicesToBeSwapped.get(t)] = temp;                                                           //
                                                                                                                //          
        }                                                                                                       //
                                                                                                                //        
      }                                                                                                         //
                                                                                                                //      
      else {                                                                                                    //
                                                                                                                //        
        //updating t and the current frame                                                                      //
                                                                                                                //        
        swapFrame = 0;                                                                                          //
                                                                                                                //        
        t++;                                                                                                    //
                                                                                                                //        
      }                                                                                                         //
                                                                                                                //
    }                                                                                                           //
                                                                                                                //
  }                                                                                                             //
                                                                                                                //
}                                                                                                               //
                                                                                                                //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Animating the Swapping of 2 Cards

////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                              //
void swapTheCards(){                                                                          //
                                                                                              //
  //selection and shell sort use a different swapping method than insertion and bubble        //
                                                                                              //
  if (sortType.equals("Selection Sort") || sortType.equals("Shell Sort")) {                   //
                                                                                              //    
    longDistanceSwap();                                                                       //
                                                                                              //
  }                                                                                           //
                                                                                              //  
  //Bubble and insertion sort can both be swapped the same way                                //
                                                                                              //  
  else {                                                                                      //
                                                                                              //    
    neighbourSwap();                                                                          //
                                                                                              //    
  }                                                                                           //
                                                                                              //
}                                                                                             //
                                                                                              //
////////////////////////////////////////////////////////////////////////////////////////////////
    
//Bubble Sort

//In the best case scenario, it has a time complexity of O(n)

//In the worst case, O(n^2)

//////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                //
int[] bubbleSort(int[] x, ArrayList indicesToBeSwapped) {                                       //
                                                                                                //  
  int n = x.length;                                                                             //
                                                                                                //  
  for (int p = 1; p<=n-1; p++) {                                                                //
                                                                                                //
    for (int i = 0; i<=n-p-1; i++) {                                                            //
                                                                                                //
      if (x[i] > x[i+1]) {                                                                      //
                                                                                                //        
        //puts which indices should be moved into an arraylist to use during the animation      //
                                                                                                //
        indicesToBeSwapped.add(i);                                                              //
                                                                                                //
        int temp = x[i];                                                                        //
                                                                                                //
        x[i] = x[i+1];                                                                          //
                                                                                                //
        x[i+1] = temp;                                                                          //
                                                                                                //        
      }                                                                                         //
                                                                                                //      
    }                                                                                           //
                                                                                                //    
  }                                                                                             //
                                                                                                //
  return x;                                                                                     //
                                                                                                //
}                                                                                               //
                                                                                                //
//////////////////////////////////////////////////////////////////////////////////////////////////

//insertion Sort

//In the best case scenario, it has a time complexity of O(n)

//In the worst case, O(n^2)

///////////////////////////////////////////////////////////////////////////////////////
                                                                                     //
int[] insertionSort(int[] cardVals, int[] hopperMoves) {                             //
                                                                                     //
  int n = cardVals.length;                                                           //
                                                                                     //
  for (int h = 1; h < n; h++) {                                                      //
                                                                                     //
    int c = h;                                                                       //
                                                                                     //    
    //puts how many times the hopper moves into an array                             //
                                                                                     //
    hopperMoves[h]=0;                                                                //
                                                                                     //
    while (c > 0 && cardVals[c-1] > cardVals[c]) {                                   //
                                                                                     //
      int temp = cardVals[c];                                                        //
                                                                                     //
      cardVals[c] = cardVals[c-1];                                                   //
                                                                                     //
      cardVals[c-1] = temp;                                                          //
                                                                                     //
      c--;                                                                           //
                                                                                     //
      //adds 1 to hopperMoves[h] each time hopperMoves "boings" a slot               //
                                                                                     //
      hopperMoves[h]++;                                                              //
    }                                                                                //
                                                                                     //
  }                                                                                  //
                                                                                     //
  return cardVals;                                                                   //
                                                                                     //
}                                                                                    //
                                                                                     //
///////////////////////////////////////////////////////////////////////////////////////

//Selection Sort (This one was really fun coding)

//Essentially, selection sort looks through the entire list, finds the lowest number and moves it to the front

//The time complexity will always be O(n^2)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                                    //                                                                                     
int[] selectionSort(int[] cardValues, ArrayList indicesToBeSwapped, ArrayList swapIndex, ArrayList moveFrame) {     //
                                                                                                                    // 
  int n = cardValues.length;                                                                                        //
                                                                                                                    //
  for (int i = 0; i < n-1; i++) {                                                                                   //
                                                                                                                    //
    int min = i;                                                                                                    //
                                                                                                                    //
    for (int j = i+1; j < n; j++) {                                                                                 //
                                                                                                                    //
      if (cardValues[j] < cardValues[min]) {                                                                        //
                                                                                                                    //
        min = j;                                                                                                    //
                                                                                                                    //        
      }                                                                                                             //
                                                                                                                    //      
    }                                                                                                               //
                                                                                                                    //    
    //These arraylists include which indices should be swapped                                                      //
                                                                                                                    //
    indicesToBeSwapped.add(min);                                                                                    //
                                                                                                                    //    
    //which indices the vaue in the above arraylist should be swapped with                                          //
                                                                                                                    //
    swapIndex.add(i);                                                                                               //
                                                                                                                    //    
    //the distance from both indices                                                                                //
                                                                                                                    //
    moveFrame.add((100/speedFrames)*(min-i));                                                                       //
                                                                                                                    //
    int temp = cardValues[min];                                                                                     //
                                                                                                                    //
    cardValues[min] = cardValues[i];                                                                                //
                                                                                                                    //
    cardValues[i] = temp;                                                                                           //
                                                                                                                    //    
  }                                                                                                                 //
                                                                                                                    //
  return cardValues;                                                                                                //
                                                                                                                    //  
}                                                                                                                   //
                                                                                                                    //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Shell Sort

//Shell sort compares elements at specific intervals. In this case, it uses n/2, n/4,..., 1

//e.g. if we have a list of size 8, the interval will start at 8/2 = 4 so the 0th element will be comapred to the 4th, then 1st to 5th, etc

//after that, the interval gets halved. So, after n/2, the interval becomes n/4, then n/8 until the interval becomes 1. 

//There are many different interval increments that can be used.

//Such as Knuth's Increments: 1, 4, 13,...,(3^k - 1)/2

//or Hibbard's Increments: 1, 3, 7,..., 2^k - 1

//In the best case scenario, it has a time complexity of O(nlogn)

//In the worst case, O(n(logn)^2)

////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                          //
void shellSort(int[] cardVal, int n, ArrayList indices, ArrayList swapIndices, ArrayList distance) {      //
                                                                                                          //  
  for (int interval = n / 2; interval > 0; interval /= 2) {                                               //
                                                                                                          //    
    for (int i = interval; i < n; i ++) {                                                                 //
                                                                                                          //      
      int temp = cardVal[i];                                                                              //
                                                                                                          //      
      int j;                                                                                              //
                                                                                                          //
      for (j = i; j >= interval && cardVal[j - interval] > temp; j -= interval) {                         //
                                                                                                          //        
        cardVal[j] = cardVal[j - interval];                                                               //
                                                                                                          //        
        indices.add(j);                                                                                   //
                                                                                                          //        
        swapIndices.add(j-interval);                                                                      //
                                                                                                          //       
        distance.add((100/speedFrames)*(interval));                                                       //
                                                                                                          //        
      }                                                                                                   //
                                                                                                          //      
      cardVal[j] = temp;                                                                                  //
                                                                                                          //      
    }                                                                                                     //
                                                                                                          //    
  }                                                                                                       //
                                                                                                          //  
}                                                                                                         //
                                                                                                          //
////////////////////////////////////////////////////////////////////////////////////////////////////////////

//code to swap the positions of 2 cards

//////////////////////////////////////////////////////////////////////////////
                                                                            //
void swapPositions(Card[] c, int i1, int i2) {                              //
                                                                            //
  int x = c[i2].x+(i2-i1)*100;                                              //
                                                                            //
  if (c[i1].x != x) {                                                       //
                                                                            //    
    //while one card moves to the right, the other to the left              //
                                                                            //
    c[i1].x += speedFrames;                                                 //
                                                                            //
    c[i2].x -= speedFrames;                                                 //
                                                                            //    
  }                                                                         //
                                                                            //  
}                                                                           //
                                                                            //
//////////////////////////////////////////////////////////////////////////////

//Allows the user to select a custom background

//////////////////////////////////////////////////////////////////////////////
                                                                            //
void backgroundSelection(){                                                 //
                                                                            //  
  //This background is a standard poker table                               //
                                                                            //
  if (backgroundSelection.equals("Poker")) {                                //
                                                                            //
    background = loadImage("pokerTable.png");                               //
                                                                            //    
  }                                                                         //
                                                                            //  
  //This background is a beautiful beach sunset (I don't know where)        //
                                                                            //  
  else if (backgroundSelection.equals("Sunset")) {                          //
                                                                            //
    background = loadImage("beachSunset.png");                              //
                                                                            //    
  }                                                                         //
                                                                            //  
  //This background has some adorable puppies                               //
                                                                            //  
  else if (backgroundSelection.equals("Puppies")) {                         //
                                                                            //
    background = loadImage("cutePuppies.png");                              //
                                                                            //    
  }                                                                         //
                                                                            //  
  //This background is a really cool Julia Set I found online               //
                                                                            //  
  else if (backgroundSelection.equals("Julia Set")) {                       //
                                                                            //
    background = loadImage("juliaSet.png");                                 //
                                                                            //    
  }                                                                         //
                                                                            //
}                                                                           //
                                                                            //
//////////////////////////////////////////////////////////////////////////////

//takes the values from the sliders in the GUI

////////////////////////////////////////////////////////////////////////////
                                                                          //
void getValues() {                                                        //
                                                                          //  
  //gets how many cards the user wants from the GUI slider                //
                                                                          //
  n = numCards.getValueI();                                               //
                                                                          //  
  //similar to above but with the speed                                   //
                                                                          //
  speed = speedVal.getValueI();                                           //
                                                                          //
  if (speed == 0) {                                                       //
                                                                          //    
    //speed of 0 will make the cards move at 1 pixel per frame            //
                                                                          //    
    //it will take 100 frames to move 1 slot (100 pixels)                 //
                                                                          //
    speedFrames = 1;                                                      //
                                                                          //    
  }                                                                       //
                                                                          //  
  else if (speed == 1) {                                                  //
                                                                          //      
    //speed of 1 makes the cards move at 4 pixels per frame               //
                                                                          //    
    //will take 25 frames to move 1 slot (100 pixels)                     //
                                                                          //
    speedFrames = 5;                                                      //
                                                                          //    
  }                                                                       //
                                                                          //  
  else if (speed == 2) {                                                  //
                                                                          //    
    //speed of 2 makes the cards move at 10 pixels per frame              //
                                                                          //    
    //will take 10 frames to move 1 slot (100 pixels)                     //
                                                                          //
    speedFrames = 10;                                                     //
                                                                          //    
  }                                                                       //
                                                                          //  
  else if (speed == 3) {                                                  //
                                                                          //    
    //speed of 3 makes the cards move at 20 pixels per frame              //
                                                                          //    
    //will take 5 frames to move 1 slot (100 pixels)                      //
                                                                          //
    speedFrames = 20;                                                     //
                                                                          //    
  }                                                                       //
                                                                          //  
  else {                                                                  //
                                                                          //    
    //speed of 4 makes the cards move at 50 pixels per frame              //
                                                                          //    
    //will take 2 frames to move 1 slot (100 pixels)                      //
                                                                          //
    speedFrames = 50;                                                     //
                                                                          //  
  }                                                                       //
                                                                          //  
}                                                                         //
                                                                          //
////////////////////////////////////////////////////////////////////////////

//The almighty reset function. Used to randomly create a new set of cards, select a new background, and sort the card values 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                                                                        //
void reset() {                                                                                                                          //
                                                                                                                                        //
  getValues();                                                                                                                          //
                                                                                                                                        //  
  //if we change the number of cards, we need to change the size of the arrays whihc store them                                         //
                                                                                                                                        //
  deckList = (Card[])expand(deckList, n);                                                                                               //
                                                                                                                                        //
  cardValues = expand(cardValues, n);                                                                                                   //
                                                                                                                                        //  
  indicesToBeSwapped.clear();                                                                                                           //
                                                                                                                                        //
  if (sortType.equals("Insertion Sort")) {                                                                                              //
                                                                                                                                        //
    hopperMoves = expand(hopperMoves, n);                                                                                               //
                                                                                                                                        //    
  }                                                                                                                                     //
                                                                                                                                        //
  //we should also clear the arraylists                                                                                                 //
                                                                                                                                        //
  else if (sortType.equals("Selection Sort") || sortType.equals("Shell Sort")) {                                                        //
                                                                                                                                        //    
    swapIndex.clear();                                                                                                                  //
                                                                                                                                        //
    moveFrame.clear();                                                                                                                  //
                                                                                                                                        //    
  }                                                                                                                                     //
                                                                                                                                        //  
  //resetting also resets the frames                                                                                                    //
                                                                                                                                        //
  t = 0;                                                                                                                                //
                                                                                                                                        //  
  //The x value needed for the deck of cards to appear in the center                                                                    //
                                                                                                                                        //
  xLocation = (width/16)*((16-n)/2);                                                                                                    //
                                                                                                                                        //  
  //loop to randomly choose cards based on how many cards you want                                                                      //
                                                                                                                                        //
  for (int i = 0; i < n; i++) {                                                                                                         //
                                                                                                                                        //    
    //randomly picks a suit with 1 being clubs, 2 being diamonds, 3 being hearts and 4 being spades                                     //
                                                                                                                                        //
    int suit = round(random(1, 4));                                                                                                     //
                                                                                                                                        //    
    //randomly picks a number ranging from 2 to 14 where jack = 11, queen = 12, king = 13 and ace = 14                                  //
                                                                                                                                        //
    int cardVal = int(random(2, 14));                                                                                                   //
                                                                                                                                        //    
    //equation to determine the overall value of the card                                                                               //
                                                                                                                                        //
    int totalVal = (4*(cardVal-2)+suit);                                                                                                //
                                                                                                                                        //    
    //loads the image from "data" based on the card's number and suit                                                                   //
                                                                                                                                        //
    PImage img = loadImage(str(cardVal)+"-"+str(suit)+".png");                                                                          //
                                                                                                                                        //    
    //creates the card objects and puts it into the array                                                                               //
                                                                                                                                        //
    deckList[i] = new Card( xLocation, yLocation, totalVal, img);                                                                       //
                                                                                                                                        //    
    //puts the values into another array                                                                                                //
                                                                                                                                        //
    cardValues[i] = deckList[i].value;                                                                                                  //
                                                                                                                                        //    
    //the next card will be 100 pixels to the right of the previous one                                                                 //
                                                                                                                                        //
    xLocation += 100;                                                                                                                   //
                                                                                                                                        //    
  }                                                                                                                                     //
                                                                                                                                        //
  //bubble sorts the cardValues which will be used in draw()                                                                            //
                                                                                                                                        //
  if (sortType.equals("Bubble Sort")) {                                                                                                 //
                                                                                                                                        //
    bubbleSort(cardValues, indicesToBeSwapped);                                                                                         //
                                                                                                                                        //    
  }                                                                                                                                     //
                                                                                                                                        //  
  //insertion sorts them and stores the hopper values                                                                                   //
                                                                                                                                        //  
  else if (sortType.equals("Insertion Sort")) {                                                                                         //
                                                                                                                                        //
    insertionSort(cardValues, hopperMoves);                                                                                             //
                                                                                                                                        //
    for (int i = 0; i<hopperMoves.length; i++) {                                                                                        //
                                                                                                                                        //
      if (hopperMoves[i] > 0) {                                                                                                         //
                                                                                                                                        //
        for (int j = 1; j<=hopperMoves[i]; j++) {                                                                                       //
                                                                                                                                        //
          indicesToBeSwapped.add(i-j);                                                                                                  //
                                                                                                                                        //        
        }                                                                                                                               //
                                                                                                                                        //      
      }                                                                                                                                 //
                                                                                                                                        //      
    }                                                                                                                                   //
                                                                                                                                        //    
  }                                                                                                                                     //
                                                                                                                                        //  
  else if(sortType.equals("Shell Sort")){                                                                                               //
                                                                                                                                        //    
    shellSort(cardValues, cardValues.length,indicesToBeSwapped, swapIndex, moveFrame);                                                  //
                                                                                                                                        //  
  }                                                                                                                                     //
                                                                                                                                        //  
  //selection sorts them                                                                                                                //
                                                                                                                                        //  
  else {                                                                                                                                //
                                                                                                                                        //
    selectionSort(cardValues, indicesToBeSwapped, swapIndex, moveFrame);                                                                //
                                                                                                                                        //    
  }                                                                                                                                     //
                                                                                                                                        //  
  //resets the frame                                                                                                                    //
                                                                                                                                        //
  swapFrame = 0;                                                                                                                        //
                                                                                                                                        //  
  if (backgroundSelection != "No Background"){                                                                                          //
                                                                                                                                        //
    backgroundSelection();                                                                                                              //
                                                                                                                                        //  
  }                                                                                                                                     //
                                                                                                                                        //  
}                                                                                                                                       //
                                                                                                                                        //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
