//we want miku to be able to make appointments
//we want miku to be able to browse the internet, maybe?
//we want miku to be able to take notes
//we want miku to be able to chat casually.
//we want miku to build you a website

   /*for i=0 to i < (here.prompts).length by i += 1 {
            
            cf = vector.cosine_sim(q_enc, a_enc[i]); #confidence factor; the cosine_similarity score

            a_scores[here.prompts[i]] = cf;

            if(cf >= cf_threshold && max_cf < cf) {            
                max_cf = cf;
                chosen_intent = here.prompts[i];
            }
        }

walker init {

    can use.enc_question, use.enc_answer;
    node state {
        question = std.input('> ');
        questionL = question.s::split(' ');
        //questionL.l::join(); - Is there a join method

        randomL = "";

        cf_threshold = 0.05;
        cf = 0;

        for i in questionL {
            random = rand.word();
            randomL+= random + " ";
        }

        

        q_enc = use.enc_question(question);
        a_enc = use.enc_answer("I am not me");
        
        cf = vector.cosine_sim(q_enc, a_enc);

        std.out(cf);
        std.out(question);
        std.out(randomL);
    }
}*/

walker talker {
    has utterance;
    can use.enc_question, use.enc_answer;

    state {
        std.out(here.message);

        utterance = std.input("> ");
        questionL = utterance.s::split(' ');

        if(utterance == "quit"): disengage;

        q_enc = use.enc_question(utterance);
        a_enc = use.enc_answer(here.prompts); # can take lists or single strings

        a_scores = {}; #stores a dictionary of prompts and their related scores based on utterance similarity
        cf_threshold = 0.1; #cutoff threshold value; scores below this will be ignored
        max_cf = 0; #max confidence factor score of the question among the encoded answers
        chosen_intent = ""; #holds the intent that scored the highest cf

        for i=0 to i < (here.prompts).length by i += 1 {
            
            cf = vector.cosine_sim(q_enc, a_enc[i]); #confidence factor; the cosine_similarity score

            a_scores[here.prompts[i]] = cf;

            if(cf >= cf_threshold && max_cf < cf) {            
                max_cf = cf;
                chosen_intent = here.prompts[i];
            }
        }

        m_cf = 0;
        random = "";
        randomL = "";
        tarr = [];
        ques = use.enc_question(utterance);
        
    //for x=0 to x < 10 by x += 1while (m_cf < cf_threshold)
        for x=0 to x < 10 by x += 1 {
            for i in questionL {
                random = rand.word();
                randomL+= random + " ";
            }

            tarr = [randomL];

  //m_cf = vector.cosine_sim(ques, rand);
        }

        rand = use.enc_answer(tarr);
       
        m_cf = vector.cosine_sim(ques, rand[0]);

        std.out(m_cf);
        std.out(utterance);
        std.out(randomL);
    


        report {"utterance" : utterance, "chosen_intent": chosen_intent, "scores": a_scores};

        take -[transition(intent == chosen_intent)]-> node::state else {
             #say I dont know..prompt again..
            std.out("Hmm.. not sure what you mean. Here are some options to help: ", here.prompts);
            take here;
        }
    }
}