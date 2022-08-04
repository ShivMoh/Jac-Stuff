walker init {
    d = {'four':4, 'five':5};
    b = d.dict::copy;
    b['four'] += b['five'];
    std.out(d.dict::keys, d.dict::values, d.d::items, b.d::items);

    b_vals = b.d::values;
    b_vals.list::append(3);
    std.out(b_vals);
    b_vals.l::sort; std.out(b_vals);
    b_vals.l::reverse; std.out(b_vals);
}