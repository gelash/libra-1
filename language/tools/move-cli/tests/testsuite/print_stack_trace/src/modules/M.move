address 0x2 {
module M {
    use 0x1::Debug;

    public fun sum(n: u64): u64 {
        if (n < 2) {
            Debug::print_stack_trace();
            n
        } else {
            n + sum(n - 1)
        }
    }
}
}
