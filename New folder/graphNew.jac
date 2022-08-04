node state {
    has title;
    has message;
    has prompts;
}

edge transition {
    has intent;
}

graph main_graph {

    has anchor main_root;

    spawn {
        all_prompts = {
            'starter_prompts': ["website", "mobile app", "information system", "quit"],
            'website': ["one_pager", "5-page", "other", "back"],
            'mobile_app': ["game", "social", "other", "back"],
            'info_sys': ["back"]
        };

        //std.out(all_prompts['website_prompts'][0][1]["test"]);
        main_root = spawn node::state(
                                title="Greeting", 
                                message="Hi, welcome to V75. What would you like to build today?", 
                                prompts=all_prompts['starter_prompts']
                            );
       
        for i in all_prompts.d::keys {
            current_node = spawn main_root -[transition(intent=i)]-> node::state(
                                title=i,
                                message="What kind of website would you like to build?",
                                prompts=all_prompts[i]
                            );

            for x in all_prompts['website'] {
                website_nodes = spawn current_node -[transition(intent=i)]-> node::state (
                            title=x,
                            message="Tell us about the " + x + " you'd like to build",
                            prompts=["back"]
                        );
                website_nodes -[transition(intent="back")]-> website;
            }
            
            quit_node = spawn node::state(title="Quit", message="quitting...", prompts="");
        }

       

        /*website = spawn main_root -[transition(intent="website")]-> node::state(
                                title="Website",
                                message="What kind of website would you like to build?",
                                prompts=["one-pager", "5-page", "other", "back"]
                            );

        website -[transition(intent="back")]-> main_root;*/
     
      

        main_root -[transition(intent="quit")]-> quit_node;
        
        mobile_app = spawn main_root -[transition(intent="mobile app")]-> node::state(
                        title="Mobile App",
                        message="What kind of mobile app would you like to build?",
                        prompts=["game", "social", "other", "back"]
                    );
        
        std.out(mobile_app.prompts);

        mobile_app -[transition(intent = "back")] -> main_root;
        
        game = spawn main_root -[transition(intent="game")]-> node::state(
                        title="Game",
                        message="Games are cool, aren't they? What would you like your game to be about?",
                        prompts=["back"]
                    );

        social = spawn main_root -[transition(intent="social")]-> node::state(
                        title="Social",
                        message="A social app, huh? Well, pitch us this great idea of your?",
                        prompts=["back"]
                    );

        other = spawn main_root -[transition(intent="other")]-> node::state(
                        title="Other",
                        message="Tell us about this app of yours?",
                        prompts=["back"]
                    );

        game = spawn main_root -[transition(intent="mobile app")]-> node::state(
                        title="Game",
                        message="Games are cool, aren't they? What would you like your game to be about?",
                        prompts=["back"]
                    );

        info_sys = spawn main_root -[transition(intent="information system")]-> node::state(
                        title="Information System",
                        message="Tell us about the information system you'd like to build",
                        prompts=["back"]
                    );   

        info_sys -[transition(intent = "back")] -> main_root;

    }

}

/*one_pager = spawn website -[transition(intent="one-pager")]-> node::state(
                        title="One Pager",
                        message="Tell us about the one pager you'd like to build",
                        prompts=["back"]
                    );
        
        one_pager -[transition(intent="back")]-> website;

        five_pager = spawn website -[transition(intent="5-page")]-> node::state(
                        title="5 Pager",
                        message="Tell us about the 5 pager you'd like to build",
                        prompts=["back"]
                    );

        five_pager -[transition(intent="back")]-> website;
                
        other = spawn website -[transition(intent="other")]-> node::state(
                        title="Other",
                        message="Tell us about the custom website you'd like to build",
                        prompts=["back"]
                    );
        
        other -[transition(intent="back")]-> website;*/