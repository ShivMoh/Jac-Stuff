node person: has name, profession;

walker get_names {
    std.out(here.name, here.profession);
    take -->;
}

walker say_stuff {
    std.out("Hello world");
}

walker build_example {
    node1 = spawn here --> node::person(name="Joe", profession="Doctor");
    node2 = spawn node1 --> node::person(name="Susan", profession="Engineer");
    spawn node2 --> node::person(name="Matt", profession="Cool guy");
}

walker init {
    root {
        spawn here walker::build_example;
        take -->;
    }

    person {
        spawn here walker::say_stuff;
        spawn here walker::get_names;
        disengage;
    }
}