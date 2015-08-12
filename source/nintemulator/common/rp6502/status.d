module common.rp6502.status;

enum
{
    FLAG_N_SHIFT = 7,
    FLAG_V_SHIFT = 6,
    FLAG_R_SHIFT = 5,
    FLAG_B_SHIFT = 4,
    FLAG_D_SHIFT = 3,
    FLAG_I_SHIFT = 2,
    FLAG_Z_SHIFT = 1,
    FLAG_C_SHIFT = 0
}

class Status
{
    public bool n;
    public bool v;
    public bool d;
    public bool i;
    public bool z;
    public bool c;

    ubyte pack(bool b = false)
    {
        return
            (n << FLAG_N_SHIFT) |
            (v << FLAG_V_SHIFT) |
            (1 << FLAG_R_SHIFT) | // Always on
            (b << FLAG_B_SHIFT) | // Non-persisted
            (d << FLAG_D_SHIFT) |
            (i << FLAG_I_SHIFT) |
            (z << FLAG_Z_SHIFT) |
            (c << FLAG_C_SHIFT);
    }

    void unpack(ubyte value)
    {
        n = (value >> FLAG_N_SHIFT) & 1;
        v = (value >> FLAG_V_SHIFT) & 1;
        d = (value >> FLAG_D_SHIFT) & 1;
        i = (value >> FLAG_I_SHIFT) & 1;
        z = (value >> FLAG_Z_SHIFT) & 1;
        c = (value >> FLAG_C_SHIFT) & 1;
    }
}
