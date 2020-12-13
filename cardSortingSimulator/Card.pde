//Card Object

class Card{
  
//Fields
  
////////////////////////////////////////////////////
                                                  //          
  //corresponding card image                      //  
                                                  //   
  PImage img;                                     // 
                                                  //   
  //value to use during sorting                   // 
                                                  //                                                    
  int value;                                      // 
                                                  //   
  //the x and y coordinates of the card           // 
                                                  //                                                    
  int x;                                          // 
                                                  //                                                    
  float y;                                        // 
                                                  //                                                   
////////////////////////////////////////////////////

//Constructor

////////////////////////////////////////////////////
                                                  //   
  Card(int x, float y,int v, PImage i){           //
                                                  //     
    this.y = y;                                   // 
                                                  //     
    this.x = x;                                   // 
                                                  //     
    this.value = v;                               // 
                                                  //     
    this.img = i;                                 // 
                                                  //     
  }                                               // 
                                                  //   
////////////////////////////////////////////////////
  
//Draw Method to draw the cards onto the screen

/////////////////////////////////////////////////////////
                                                       //   
  void drawCard(){                                     //
                                                       //    
    //cards are 100 pixels in width and 150 in height  //
                                                       //     
    image(this.img,this.x,this.y,100,150);             //
                                                       //     
  }                                                    // 
                                                       // 
}                                                      // 
                                                       // 
/////////////////////////////////////////////////////////
