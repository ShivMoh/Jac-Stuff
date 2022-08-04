node state {
    has name = rand.word();
    has response = "I'm a silly bot uwu.";
    has user_utter;

    can speak with entry {
        std.out(response + "I'm currently on "+name+" node");
    }

    can listen with talker exit {
        user_utter = visitor.utterance;
        visitor.path.l::append(&here);#what does this &here do?
        //std.out(&here); - &here is a path for the thingy currently on the state, i guess. u kinda get it, right?
        std.out("I hear "+user_utter+".");
    }

    /*can test_path with get_states entry {
        visitor.path.l::append(&here);
    }*/
}

node hop_state {
    has name;
    can log with exit {
        std.log("A walker is walking right over me.");
    }
}