private double fractionLength = .8; //more branches if increased
private int smallestBranch = 10; //the smaller the number, the more accumulation of little branches
private double branchAngle = .5;  //the lower the number, the more steep the branches are
private int thicc = 2;

public void setup()
{
	// size(640,480);
	size(650,500);
	noLoop();
}
public void draw()
{
	// light blue: #d3e8e2 (211, 232, 226)
	background(165, 204, 202);
	stroke(145, 114, 68);//color of line
	// line(320,480,320,380);  //first point = length of screen/2 , 2nd point= height of screen, 3rd = same as 1st, 4th = end point of trunk
	line(650/2, 500, 650/2, (650/2) + 60);

	// drawBranches(320,380,100,3*Math.PI/2);  //will add later

	//drawBranches(endpoint of trunk bb(x,y) as the starting point for the other branches,
	// length of trunk, angle of trunk --> vertical angle in radians);

	drawBranches(650/2, (650/2) + 60, 100, 3*Math.PI/2);
}
public void drawBranches(int x,int y, double branchLength, double angle)
{
	double angle1, angle2;
	double randAngle = ((Math.random()*4) - 2) * Math.PI/2;

	angle1 = angle + branchAngle ;
	angle2 = angle - branchAngle ;

	branchLength *= fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);

	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	// int endX3 = (int)(branchLength*Math.cos(angle1) + x + Math.random());
	// int endY3 = (int)(branchLength*Math.sin(angle2) + y + Math.random());
	strokeWeight(thicc);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	//apple color
	stroke(214, 79, 79);
	fill(214, 79, 79);
	if(Math.random()>.8)
		if(branchLength > 2)
			ellipse(x,y,10,10);

	if(branchLength > 8){
		stroke(87, 130, 93);
	}

	//recursion starts to continue making branches

	// if(branchLength >= 30){
	// 	// branchAngle = (Math.random()*.1)+.03;
	// 	line(x,y, endX3, endY3);
	// }

	if(branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
}


 public void keyPressed() {
 //  	//branchAngle
 int ang = 0;
 int len = 0;

 if(ang<= 3){
 	if(branchAngle>=0.2){
 			branchAngle += -.1;
			ang+=1;
			redraw();
		}
	}


	if(len<=3){
		// if(fractionLength <= 1){
		fractionLength += .01;
		if(fractionLength>= 0.83){
			shakeApples();
			fractionLength = 0.8;
			branchAngle = 0.5;
		}
		len +=1;
		redraw();
		// }
	}

	// smallestBranch += 1;

	
		}

public void shakeApples(){
	
	stroke(214, 79, 79);
	fill(214, 79, 79);
	ellipse((int)(Math.random()*650),(int)(Math.random()*20 )+480, 10,10);
}

 //  	//fractionLength

 //  	//smallestBranch

 //  	//strokeWeight() could change --> make lines thiccer

 //  	//could add randomness to branch angles

 //  	//draw more branches too
