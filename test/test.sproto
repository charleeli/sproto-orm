.class_g {
    a 1: integer
    b 1: integer
    c 1: boolean
    d 1: string
}

.class_a {
    a 1: integer(1)
    b 2: integer
    c 3: boolean
    d 4: string
}

.class_d {
    a 1: class_a
    b 2: class_a
    c 3: class_a
}

.class_e {
    .a {
        b 1: *integer(5)
    }
    b 1: *class_d

    c 5: *class_d(string)

    .d {
        a 1: integer
        b 1: string
        .c {
            a 1: integer
            b 1: *string
            c 1: *integer(string)
        }
    }
}
