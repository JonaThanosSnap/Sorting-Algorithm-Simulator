/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:560446:
  appc.background(230);
} //_CODE_:window1:560446:

public void pauseBClicked(GButton source, GEvent event) { //_CODE_:pauseB:888980:
                                                                                                   
  paused = !paused;                                              
                                                                   
  if (paused){                                                    
                                                                    
    pauseB.setText("Resume");                                     
                                                                    
    pauseB.setLocalColorScheme(GCScheme.GREEN_SCHEME);            
                                                                      
  }                                                               
                                                                  
  else {                                                         
                                                                   
    pauseB.setText("Pause");                                     
                                                                    
    pauseB.setLocalColorScheme(GCScheme.RED_SCHEME);             
                                                                     
  }                                                               
                                                                    
} //_CODE_:pauseB:888980:

public void resetButtonClicked(GButton source, GEvent event) { //_CODE_:resetButton:901209:
                                                                                                 
  reset();                                                          
                                                                     
} //_CODE_:resetButton:901209:

public void sortingTypeChanged(GDropList source, GEvent event) { //_CODE_:sortingType:627859:
                                     
                                                                    
  sortType = sortingType.getSelectedText();                         
                                                                    
  paused = true;                                                    
                                                                    
  pauseB.setText("Start");                                          
                                                                    
  pauseB.setLocalColorScheme(GCScheme.GREEN_SCHEME);                
                                                                    
  reset();                                                        
                                                                    
} //_CODE_:sortingType:627859:

public void backPicChanged(GDropList source, GEvent event) { //_CODE_:backPic:806497:
                                                                                    
  backgroundSelection = backPic.getSelectedText();                  
                                                                    
  paused = true;                                                    
                                                                    
  pauseB.setText("Start");                                          
                                                                    
  pauseB.setLocalColorScheme(GCScheme.GREEN_SCHEME);                
                                                                    
  reset();                                                          
                                                                     
} //_CODE_:backPic:806497:

public void numCardsChanged(GCustomSlider source, GEvent event) { //_CODE_:numCards:789768:
                                                                  
  n = numCards.getValueI();                                            
                                                                        
  paused = true;                                                      
                                                                       
  pauseB.setText("Start");                                            
                                                                       
  pauseB.setLocalColorScheme(GCScheme.GREEN_SCHEME);                   
                                                                        
  reset();                                                             
                                                                        
} //_CODE_:numCards:789768:

public void speedValChanged(GCustomSlider source, GEvent event) { //_CODE_:speedVal:928828:
                                                               
  speed = speedVal.getValueI();                                       
                                                                        
  paused = true;                                                      
                                                                        
  pauseB.setText("Start");                                             
                                                                         
  pauseB.setLocalColorScheme(GCScheme.GREEN_SCHEME);                   
                                                                        
  reset();                                                            
                                                                       
} //_CODE_:speedVal:928828:

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 450, 600, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  pauseB = new GButton(window1, 120, 50, 80, 30);
  pauseB.setText("Pause");
  pauseB.setLocalColorScheme(GCScheme.RED_SCHEME);
  pauseB.addEventHandler(this, "pauseBClicked");
  resetButton = new GButton(window1, 240, 50, 80, 30);
  resetButton.setText("Reset");
  resetButton.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  resetButton.addEventHandler(this, "resetButtonClicked");
  sortingType = new GDropList(window1, 240, 170, 110, 150, 4, 10);
  sortingType.setItems(loadStrings("list_627859"), 0);
  sortingType.addEventHandler(this, "sortingTypeChanged");
  backPic = new GDropList(window1, 80, 170, 110, 180, 5, 10);
  backPic.setItems(loadStrings("list_806497"), 0);
  backPic.addEventHandler(this, "backPicChanged");
  numCards = new GCustomSlider(window1, 80, 380, 280, 50, "blue18px");
  numCards.setShowValue(true);
  numCards.setShowLimits(true);
  numCards.setLimits(8, 0, 16);
  numCards.setNbrTicks(16);
  numCards.setShowTicks(true);
  numCards.setNumberFormat(G4P.INTEGER, 0);
  numCards.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  numCards.setOpaque(false);
  numCards.addEventHandler(this, "numCardsChanged");
  label1 = new GLabel(window1, 80, 150, 110, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Background:");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 240, 150, 110, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Sorting Algorithm:");
  label2.setOpaque(false);
  label3 = new GLabel(window1, 170, 360, 104, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Number of Cards:");
  label3.setOpaque(false);
  speedVal = new GCustomSlider(window1, 80, 480, 280, 50, "red_yellow18px");
  speedVal.setLimits(2, 0, 4);
  speedVal.setShowTicks(true);
  speedVal.setNumberFormat(G4P.INTEGER, 0);
  speedVal.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  speedVal.setOpaque(false);
  speedVal.addEventHandler(this, "speedValChanged");
  label4 = new GLabel(window1, 170, 460, 100, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Swap Speed");
  label4.setOpaque(false);
  label6 = new GLabel(window1, 40, 530, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("0.1x");
  label6.setOpaque(false);
  label7 = new GLabel(window1, 320, 530, 80, 20);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("5x");
  label7.setOpaque(false);
  label8 = new GLabel(window1, 180, 10, 80, 20);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("Settings:");
  label8.setOpaque(false);
  label9 = new GLabel(window1, 110, 530, 80, 20);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("0.5x");
  label9.setOpaque(false);
  label10 = new GLabel(window1, 250, 530, 80, 20);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("2x");
  label10.setOpaque(false);
  label5 = new GLabel(window1, 180, 530, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("1x");
  label5.setOpaque(false);
  label11 = new GLabel(window1, 80, 100, 270, 50);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("Note: The animation will run smoothest with the \"No Background\" Option");
  label11.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton pauseB; 
GButton resetButton; 
GDropList sortingType; 
GDropList backPic; 
GCustomSlider numCards; 
GLabel label1; 
GLabel label2; 
GLabel label3; 
GCustomSlider speedVal; 
GLabel label4; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
GLabel label9; 
GLabel label10; 
GLabel label5; 
GLabel label11; 
