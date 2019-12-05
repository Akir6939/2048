Block[][] board;
boolean moved;
public void setup(){
	moved = false;
	board = new Block[3][3];
	size(900,900);
	int count = 1;
	for(int y = 0;y<3;y++){
		for(int x = 0;x<3;x++){
			board[x][y] = new Block(x*300,y*300,count);
			count++;
		}
	}
	addNewNum();
	textAlign(CENTER, CENTER);
	textSize(16);
}
public boolean loseCheck(){
	if(checkForMoves())
		return false;
	for(Block[] b1 : board){
		for(Block b2 : b1){
			if(b2.getNum()==0)
				return false;
		}
	}
	return true;
}
public boolean checkForMoves(){
	for(int j = 0;j<2;j++){
		for(int i = 0;i<2;i++){
			if(board[i+1][j].getNum()==board[i][j].getNum()||board[i][j+1].getNum()==board[i][j].getNum())
				return true;
		}
	}
	if(board[2][2].getNum()==board[2][1].getNum()||board[2][2].getNum()==board[1][2].getNum())
		return true;
	if(board[0][2].getNum()==board[0][1].getNum()||board[0][2].getNum()==board[1][2].getNum())
		return true;
	if(board[2][0].getNum()==board[2][1].getNum()||board[2][0].getNum()==board[1][0].getNum())
		return true;	
	return false;
}
public void draw(){
	for(Block[] b1 : board){
		for(Block b2 : b1){
			b2.show();
		}
	}
	if(loseCheck()){
		fill(255,255,0);
		text("You Lose!",400,400);
		noLoop();
		return;
	}
}
public void addNewNum(){
	int indexToAddX = (int)(Math.random()*3);
	int indexToAddY = (int)(Math.random()*3);
	if(board[indexToAddX][indexToAddY].getNum()==0)
		board[indexToAddX][indexToAddY].setNum(2);
	else{
		addNewNum();
	}
}

public void keyPressed(){
	if(loseCheck()) return;
	int[][] bOld = new int[3][3];
	for(int y = 0;y<3;y++){
		for(int x = 0;x<3;x++){
			bOld[x][y] = board[x][y].getNum();
		}
	}
	switch(keyCode){
		case 39://right arrow
		case 68:
			for(int y = 0;y<3;y++){
				for(int x = 0;x<2;x++){
					if(board[x+1][y].getNum()==board[x][y].getNum()||board[x+1][y].getNum()==0){
						board[x][y].addToOther(board[x+1][y]);
					if(x==1)
						board[x-1][y].addToOther(board[x][y]);
					break;
				}
			}
		}
		break;
		case 38://up arrow
		case 87:
			for(int y = 2;y>0;y--){
				for(int x = 0;x<3;x++){
					if(board[x][y-1].getNum()==board[x][y].getNum()||board[x][y-1].getNum()==0){
						board[x][y].addToOther(board[x][y-1]);
					if(y==1)
						board[x][y+1].addToOther(board[x][y]);
				}
			}
		}
		break;
		case 37://left arrow
		case 65:
			for(int y = 0;y<3;y++){
				for(int x = 2;x>0;x--){
					if(board[x-1][y].getNum()==board[x][y].getNum()||board[x-1][y].getNum()==0){
						board[x][y].addToOther(board[x-1][y]);
					if(x==1)
						board[x+1][y].addToOther(board[x][y]);
				}
			}
		}
		break;
		case 40://down arrow
		case 83:
			for(int y = 0;y<2;y++){
				for(int x = 0;x<3;x++){
					if(board[x][y+1].getNum()==board[x][y].getNum()||board[x][y+1].getNum()==0){
						board[x][y].addToOther(board[x][y+1]);
					if(y==1)
						board[x][y-1].addToOther(board[x][y]);
				}
			}
		}
		break;
	}
	for(int j = 0;j<3;j++){
		for(int i = 0;i<3;i++){
			if(bOld[i][j]!=board[i][j].getNum()){
				moved = true;
				break;
			}
		}
	}
}
public void keyReleased(){
	if(loseCheck()) return;
	if(moved){
		switch(keyCode){
			case 39:
			case 68:
			case 38:
			case 87:
			case 37:
			case 65:
			case 40:
			case 83:
			addNewNum();
			moved = false;
	}
}
}