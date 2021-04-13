ArrayList<Disk> disks;
int nbDisks;

void setup(){
    size(800, 600);
    frameRate(30);

    disks = new ArrayList<Disk>();
    nbDisks = 500;

    for(int i=0; i<nbDisks; i++)
        disks.add(new Disk(new Point(random(width), random(height))));
}

void draw(){
    background(0);

    for(Disk disk : disks){
        disk.grow();
        disk.display();
    }
}

void circle(Point p, int r){
    ellipse(p.posX, p.posY, 2*r, 2*r);
}
float distance(Point p1, Point p2){
    return pow(pow(p1.posX - p2.posX, 2) + pow(p1.posY - p2.posY, 2), 0.5);
}
color getColor(Point p){
    return color(255, 255, 255);
}