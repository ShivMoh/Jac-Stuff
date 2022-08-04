node prompts {
    has all_prompts;

    all_prompts = {
            'starter_prompts': ["appointment", "chat", "website", "quit"],
            'appointment': ['make_appointment', 'check_appointment_time', 'cancel_appointment.'],
            'website': [ref, "Want me to build you a website, huh? Tell me more?", ["one_pager", "5-page", "other", "back"]],
            'conversation': ["I'm not feeling very good today', 'Cheer me up."],
            //'mobile_app': ['game', 'social', 'other', 'back'],
            'website': ["one_pager", "5-page", "other", "back"]
            //'info_sys': ["back"]
        };
  }
  ref = {
            "fasf": 2
        };
        
      