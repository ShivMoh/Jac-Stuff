walker init {
    can use.enc_question, use.enc_answer;

    answers = [
        'I am 20 years old',
        'My dog is hungry',
        'My TV is broken',
        'I am broken'
    ];
    question = "What should I repair?";

    q_enc = use.enc_question(question);
    a_enc = use.enc_answer(answers);

    a_scores=[];
    //std.out(q_enc);
    //std.out(vector.cosine_sim(q_enc, 1));
    highest = 0;
    index = 0;
    //std.out(a_enc.length);

    /*for i=0 to i<4 by i+=1:
        //why does the loop not work when this line is there
        //std.out(a_scores);
        std.out("hello");
        a_scores.l::append(vector.cosine_sim(q_enc, a_enc[i]));*/

    for i in a_enc:
        //std.out(vector.cosine_sim(q_enc, i));
        a_scores.l::append(vector.cosine_sim(q_enc, i));
        //std.out(vector.sort_by_key(i));
        //a_scores.l::append(vector.dot_product(q_enc, i));


    //std.out(a_scores);
    a_scores.l::sort;

    for i=0 to i<a_enc.length by i+=1:
        if(a_scores[-1] == vector.cosine_sim(q_enc, a_enc[i])) {
            index = i;
        }
        //std.out(vector.sort_by_key(i));
    //vale = a_scores[0];

    /*for i=0 to i<a_scores.length by i+=1:
        std.out("hello");
        if(a_scores[i] > highest) {
            highest = vale;
            index = i;
        }*/
    report answers[index];
    

    //std.out(a_scores);
    //std.out(highest);
    //std.out(a_scores[index]);
    //a_scores.l::sort;
    //vector.cosine_sum(q_enc, i)
    //report answers[highest[0]];
}