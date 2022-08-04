node person: has name, age, height;
edge upper_classman;
edge lower_classman;

walker init {

    root {
        test_root = here;
        s1 = spawn here -[upper_classman]->node::person(name="Diachi", age=18, height=176);
        s2 = spawn here -[upper_classman]->node::person(name="Suga", age=18, height=174);
        s3 = spawn here -[upper_classman]->node::person(name="Aisha", age=18, height=186);
    }
    
    test_state:
        spawn here walker::connections;
        
    take -->;
    with exit {
        report spawn test_root walker::test_counter;
    }
}

walker connections {
    spawn s1 -[lower_classman]-> node person(name="Noya", age="17", height=160.5);
}

walker test_counter {
    //has anchor num=0; take -->; hop_state { num+=1; }
    num=0; take -->;  { num+=1; }
}