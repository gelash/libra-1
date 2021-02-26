address 0x2 {
module Summary {
    resource struct S1 { s2: S2 }
    resource struct S2 { f: u64 }

    public fun write_callee(s2: &mut S2) {
        s2.f = 7;
    }

    public fun write_caller1(a: address) acquires S2 {
        write_callee(borrow_global_mut<S2>(a))
    }

    public fun write_caller2(a: address) acquires S1 {
        write_callee(&mut borrow_global_mut<S1>(a).s2)
    }

    public fun write_addr() acquires S1 {
        write_caller2(0x777);
    }

}
}
