node person {
    has name, profession;
    can speak with entry {
        std.out("I'm here.");
    }
} 

edge one {has intent; }
edge two;

node word {
    has sentence = "";

    has utterance = std.input('>');
    can speak with entry {
        sentence = "";
        for i=0 to i<1 by i+=1 {
            sentence += rand.word() + " ";
        }
    }
}

walker build_example {
    has greeting = "hello";
    mainNode = spawn here -[one]-> node::word;
    node2 = spawn mainNode -[one]-> node::word;
    node3 = spawn mainNode -[one]-> node::word;
    node2 --> mainNode;
}

walker round{
    can use.enc_question, use.enc_answer;
    has utterance = std.input('>');
    choices = [];
    choices.l::append(here.sentence);
    std.out('Word: Walker round', here.sentence);
    q_enc = use.enc_question(utterance);
    a_enc = use.enc_answer(choices);
    cos = vector.cosine_sim(q_enc, a_enc[0]);
    std.out(cos);

    if(cos < 0.05) {
        take -->;
    } else {
        take -[one]->;
    }

}