module common.cycle;


abstract class Cycle
{
    public abstract void execute();

    public Cycle opOpAssign(string op)(Cycle other)
    {
        return mixin( "this " ~ op ~ " other" );
    }

    public Cycle opBinary(string op)(Cycle other)
    {
        static if (op == "+")
        {
            if (is(typeof(other) == NullCycle))
            {
                return this;
            }
            
            return new DualCycle(this, other);
        }
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

    public override void execute()
    {
        x.execute();
        y.execute();
    }
}

class NullCycle : Cycle
{
    public override void execute() { }
}
