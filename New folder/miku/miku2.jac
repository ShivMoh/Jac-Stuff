//import {*} with "./nodes.jac";

node word {
    has name = rand.word();

    can speak with entry {
        std.out("Something has arrived arrived");
    }
}

walker round {
    std.out(here.message);
}