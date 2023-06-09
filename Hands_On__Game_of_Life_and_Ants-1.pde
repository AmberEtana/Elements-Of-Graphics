int size = 8;
int cols = 600/size;
int rows = 600/size;
int [][] board = new int[cols][rows]; //2d array, declared an array, the board, made up of rows and cols
{ for(int y=0; y<rows; y++) { // iterated through board
    for (int x=0; x<cols; x++){
      board[x][y]=int(random(2));
  }
 }
}
    
void setup () {
  size(600,600);
  frameRate(24);

}
void draw () {
    background(0); // initialize as black background 
    int[][] next = new int[cols][rows]; 
    for(int y = 1; y < rows-1; y++) { // iterated through board
      for (int x = 1; x < cols-1; x++){
        int neighbours = countNeighbours(x,y); 
        next[x][y] = ruleOfLife(board[x][y], neighbours);
      }
    }
  board = next;
  drawBoard();
}

void mousePressed() {
  int cellX = mouseX / size;
  int cellY = mouseY / size;
  board[cellX][cellY] = 1-board[cellX][cellY];
}
  
  
int countNeighbours(int x, int y) {
  int neighbours = 0;
  for (int i=-1; i <= 1; i++) {
    for (int j=-1; j <= 1; j++) {
      neighbours += board[x+j][y+i];
   }
 }

    neighbours -= board[x][y];
    return(neighbours);
}

// apply rule of life
int ruleOfLife(int status, int neighbours) {
  if (status == 1 && neighbours > 3) return(0); 
  else if (status == 1 && neighbours < 2) return (0); 
  else if (status == 0 && neighbours == 3) return(1);
  else return(status);
}

 
void drawBoard() {
 for(int y = 0;  y< rows; y++) { 
   for (int x =0; x < cols; x++){
     if (board[x][y]==1) {
       fill(192);
     } 
     else {
       fill(64);
     }
     rect(x*size,y*size,size,size);   
  }
 }
}

      
    
    
    
    
    
    
    
