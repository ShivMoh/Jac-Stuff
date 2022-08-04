import {*} with "./graph.jac";
import {*} with "./miku.jac";
import {*} with "./miku2.jac";
import {*} with "./build_stuff.jac";

walker init {
    //has to spawn graph within here
    root {
        //spawn
        //spawn here --> graph::main_graph; //basically spawns the graph here. Thats why here is used.
        //spawn here --> graph::main_graph;
        //spawn here and it will create the graph and edge together
        //spawn --> walker::talker; //how to spawn a walker
        spawn here walker::build_example;
        std.out("I am on root node");
        spawn --> walker::round;
        
        //take -->;
        //spawn -->[0] walker::talker is equivalent to above
        //two arrows are different
        //spawns the walker talker on the node that I am pointing to
    }
   
}