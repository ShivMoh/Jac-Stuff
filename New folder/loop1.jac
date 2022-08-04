walker init{
    x = 34 - 30;
    y = "Hello";
    z = 3.45;

    if(z==3.45 or y=="Bye") {
        x=x-1;
        y=y+"World";
    }

    std.out(x);

    for i=0 to i<3 by i+=1:
        std.out(x-1, '-', y);
    report [x,y+'s'];
    
}