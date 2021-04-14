ArrayList<Disk> disks;
int nbDisks;
PImage photo;

void settings(){
    photo = loadImage("ToCircle.jpg");
    photo.loadPixels();
    size(2*photo.width + 12, photo.height+10);
}

void setup(){
    frameRate(2);

    disks = new ArrayList<Disk>();
    nbDisks = 2000;

    for(int i=0; i<nbDisks; i++)
        disks.add(new Disk(new Point(random(width/2+2, width-4), random(5, height-5))));
}

void draw(){
    background(0);

    image(photo, 4, 5);

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
    int temp = int(p.posY)*photo.width + int(p.posX);
    if(temp > photo.width*photo.height-1)
        temp = photo.width*photo.height-1;
    return photo.pixels[temp];
}