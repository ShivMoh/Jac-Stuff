walker init {
    fav_nums=[];

    for i=0 to i<10 by i+=1:
        fav_nums.list::append(i*2);
    report fav_nums;

    fancy_str = "";

    for i in fav_nums {
        fancy_str = fancy_str + "two * " + i.str + 
                    " = " + (i*2).str + " # ";
    }
    report fancy_str;

    count_down = fav_nums[-1];
    while (count_down > 0) {
        count_down -= 1;
        if (count_down == 14):
            continue;
        std.out("I'm at countdown "+count_down.str);
        if (count_down == 10):
            break;
    }
}

/*fav_nums=[];

    for i=0 to i<10 by i+=1:
        fav_nums.list::append(i*2);
    report fav_nums;

    fancy_str = "";

    for i in fav_nums {
        fancy_str = fancy_str + "two * " + i.str + 
                    " = " + (i*2).str + " # ";
    }
    report fancy_str;

    /*count_down = fav_nums[-1];
    while (count_down > 0) {
        count_down -= 1;
        if (count_down == 14):
            continue;
        std.out("I'm at countdown "+count_down.str);
        if (count_down == 10):
            break;
    }*/

 /*x = 25 - 20;
    y = "Hello";
    z = 3.45;

    if(z==3.45 or y=="Bye"){
        x=x-1;
        y=y+" World";
    }

    std.out(x);
    for i=0 to i<3 by i+=1:
        std.out(x-i, '-', y);
    report [x, y+'s'];

    a=5;
    b=5.0;
    c=true;
    d='5';
    e=[a,b,c,d,5];
    f={'num': 5};

    summary = {'int': a, 'float': b, 'bool':c,
     'string': d, 'list': e, 'dict':f };
    
    report summary;*/