class Block{
	private int myNum, myX, myY;
	public Block(int x, int y){
		myX = x;
		myY = y;
		myNum = 0;
	}
	public void addToMe(int num){
		myNum+=num;
	}
	public void addToOther(Block b){
		b.addToMe(myNum);
		myNum = 0;
	}
	public void show(){
		fill(210,180,140);
		stroke(0);
		rect(myX,myY,300,300);
		fill(0);
		textSize(80);
		text(myNum,myX+150,myY+150);
	}
	public int getNum(){
		return myNum;
	}
	public void setNum(int s){
		myNum = s;
	}
}