//pip3 install jaseci-serv

//first terminal
//jsserv makemigrations base 
//research jango
//jsserv migrate
//jsserv run server 0.0.0.0:8000
// /docs

//second terminal
//jsserv createsuperuser
//jsctl
//login http://localhost::8000
//actions load module jaseci_kit.use_qa
//research sentinals
//sentinel register -name main -mode ir main.jir
//alias list

//Third terminal - retrofitting - compiling
//take out standard ouptut, std.out, and replace with report
//remove spawn walker
//jsctl jac build main.jac

//user token is used to call
// /user/token
// json format
// postmon
// sentinal id
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
    //'mobile_app-game', 'mobile_app-social', 'mobile_app-other', "website-one_pager", "website-5-page", "website-other"
    spawn {
        all_prompts = {
            //'starter_prompts': ["info_sys", "mobile_app", "website", "quit"],
            'mobile_app': ['mobile_app_game', 'mobile_app_social'],
            'website': ["website_one_page", "website_5_page"],
            'info_sys': ["Something"]
            //'info_sys': ]
        };

        main_root = spawn node::state(
                                title="Greeting", 
                                message="Hello. What can I do for you today?", 
                                prompts=["info_sys", "mobile_app", "website", "quit"]
        );

        for i in all_prompts.d::keys {
            current_node = spawn main_root -[transition(intent=i)]-> node::state(
                                title=i,
                                message="What kind of " + i + " would you like to build?",
                                prompts=all_prompts[i]
                            );

            current_node -[transition(intent="back")]-> main_root;
            old_node = current_node;
            for x in all_prompts[i] {
                previous_intent = x;
                new_node = spawn current_node -[transition(intent=x)]-> node::state (
                            title=x,
                            message="Tell us about the " + x + " you'd like to build",
                            prompts=["back", "direct"]
                        );
                new_node -[transition(intent=x)]-> old_node;
                old_node -[transition(intent=previous_intent)]-> new_node;
                old_node = new_node;
                new_node -[transition(intent="back")]-> current_node;
                new_node <-[transition(intent=x)]- main_root;
                //new_node <-[transition(intent=x)]- new_node;
                std.out(i+"-"+x);
            }
            
        
            quit_node = spawn node::state(title="Quit", message="quitting...", prompts="");
        }

    }

}