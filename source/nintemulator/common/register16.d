module common.register16;


version (BigEndian)
{
    string makeRegister16(string name)()
    {
        return `
        union
        {
            public ushort ` ~ name ~ `;

            struct
            {
                public ubyte ` ~ name ~ `h;
                public ubyte ` ~ name ~ `l;
            }
        }
        `;
    }
}
else
{
    string makeRegister16(string name)()
    {
        return `
        union
        {
            public ushort ` ~ name ~ `;

            struct
            {
                public ubyte ` ~ name ~ `l;
                public ubyte ` ~ name ~ `h;
            }
        }
        `;
    }
}
