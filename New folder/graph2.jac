node state {
    has response="I'm silly, uwu.";
}

node hop_state: has name;

edge hop;

walker init {
    has state_visits=0, save_root;

    root {
        save_root = here;
        hop1 = spawn here -[hop]-> node::hop_state(name = "Teya");
        hop2 = spawn here -[hop]-> node::hop_state(name = "Levita");
    }

    hop_state:
        spawn here walker::hop_buildout;

    state {
        state_visits += 1;
        std.out("Hello");
        std.out(here.response+state_visits.str);
    }

    take -->;
    with exit {
        report spawn save_root walker::hop_counter;
    }
}

walker hop_buildout {
    spawn here --> node::state;
    spawn here --> node::state;
    spawn here --> node::state;
}

walker hop_counter {
    //has anchor num=0; take -->; hop_state { num+=1; }
    num=0; take -->; hop_state { num+=1; }
}