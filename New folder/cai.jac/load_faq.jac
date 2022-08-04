import {edge::{trans_ner, trans_intent, trans_qa}} with "./edges.jac";
import {node::{state, hop_state}} with "./nodes.jac";

graph faq_gph {
    has anchor faq_root;

    spawn {
        faq_root = spawn node::state(name="Faq Root");

        answers = file.load_str('./faq_answers.txt').str::split('&&&');//From observation, the &&& is just written the txt file as a seperator.
        testdafaf = file.dump_str('./faq_answers.txt', 'Hello');
        afnaf = file.append_str('hello.txt', '\nadnsdn');
        for i in answers:
            spawn faq_root -[trans_qa]-> node::state(response=i);
            //I don't really get whats happening here
    }
}