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
        if(this.center.posX - this.radius < 0 || this.center.posX + this.radius > width || this.center.posY - this.radius < 0 || this.center.posY + this.radius > height){
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