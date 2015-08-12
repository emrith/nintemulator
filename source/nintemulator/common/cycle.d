module common.cycle;


abstract class Cycle
{
    public abstract void fallingEdge();

    public abstract void risingEdge();

    public static Cycle combine(Cycle a, Cycle b)
    {
        auto a_is_null = a is null || (typeid(a) == typeid(NullCycle));
        auto b_is_null = b is null || (typeid(b) == typeid(NullCycle));

        if (a_is_null && b_is_null)
        {
            return new NullCycle();
        }
        else
        {
            if (a_is_null) { return b; }
            if (b_is_null) { return a; }

            return new DualCycle(a, b);
        }
    }

    public Cycle opBinary(string op)(Cycle other) if (op == "+")
    {
        return combine(this, other);
    }

    public Cycle opOpAssign(string op)(Cycle other) if (op == "+")
    {
        return combine(this, other);
    }
}

class DualCycle : Cycle
{
    private Cycle x;
    private Cycle y;

    this(Cycle x, Cycle y)
    {
        this.x = x;
        this.y = y;
    }

    public override void fallingEdge()
    {
        x.fallingEdge();
        y.fallingEdge();
    }

    public override void risingEdge()
    {
        x.risingEdge();
        y.risingEdge();
    }
}

class NullCycle : Cycle
{
    public override void fallingEdge() { }

    public override void risingEdge() { }
}
