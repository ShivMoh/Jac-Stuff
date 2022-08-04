walker init {
    /*num = 1;
    num += 1;
    std.out(num);

    for i=0 to i<3 by i+=1:
        std.out(i);*/

    all_prompts = {
        'starter_prompts': ["website", "mobile app", "information system", "quit"],
        'website': ["one_pager", "5-page", "other", "back"],
        'mobile_app': ["game", "social", "other", "back"],
        'info_sys': ["back"]
    };

    std.out(all_prompts.d::keys);
    la = all_prompts.d::keys;
    for x in all_prompts.d::keys {
        std.out(x);
    }
        
 
}

