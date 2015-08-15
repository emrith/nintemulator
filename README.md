# Nintemulator

This project is an emulator written in the D programming language. It has a
focus on modeling accuracy, and attempting to gain compatibility by accurately
simulating the real hardware.

## Philosophy

The point of this project is to accurately model reality, we believe that the
only way to 100% compatibility, maintainability, and readable code is to hold
`SOLID` principles in high regard, and to implement the IoC pattern to create
small modules that can be tied together (much like real hardware) to compose a
system.

The most basic building block in the project is the `Cycle` abstract class.
State machines are implemented by defining an implementation of this `Cycle`
class for each and every unique operation that the machine is capable of. Once
those are defined, a `CycleMapper` and `CycleMapFactory` are used to compose
the finite states that the machine can exist in:

```d
cycleMap[ 0x65 ][ 2 ] += cycles.fetchInstruction + cycles.adc;
```

Once processors are composed, they can be synchronized as necessary. This model
so far has forced us to implement a cycle accurate `RP2C02` and half-cycle
accurate `RP6502`. This approach leaves little room for error, which is a
double-edged sword, on one hand you are required to do it right, on the other
you can only simulate processors that you have a very deep understanding of.

## Building

Since I personally use MonoDevelop to work on this project, the build system is
entirely restricted to `.sln` and `.dproj` files. If there is ever a demand for
something more in-depth, it can be added at that point.
