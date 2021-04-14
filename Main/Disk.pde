class Disk{
    Point center;
    color col;
    boolean free;
    int radius;

    Disk(Point _c){
        this.center = _c;

        this.col = getColor(this.center);
        free = true;
        this.radius = 0;
    }

    boolean collide(){
        this.radius++;
        if(this.center.posX - this.radius < width/2 + 2 || this.center.posX + this.radius > width-4 || this.center.posY - this.radius < 5 || this.center.posY + this.radius > height-5){
            this.radius--;
            return true;
        }
        for(Disk disk : disks){
            if(this != disk && distance(this.center, disk.center) < this.radius + disk.radius){
                this.radius--;
                return true;
            }
        }
        return false;
    }
    void display(){
        fill(this.col);
        circle(this.center, this.radius);
    }
    void grow(){
        if(this.free){
            if(!this.collide())
                this.radius++;
            else
                this.free = false;
        }
    }
}