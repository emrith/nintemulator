module common.sequence;


static class Sequence
{
    public static int[] range(int start, int end, int delta = 1)
    {
		int[] numbers = [];

        for (int index = start; index < end; index += delta)
        {
			numbers ~= index;
        }

		return numbers;
    }
}
