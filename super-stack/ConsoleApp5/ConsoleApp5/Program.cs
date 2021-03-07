using System;
using System.Collections.Generic;
using System.Linq;



namespace ConsoleApp5
{
	internal class Stack 
	{
		int index = 0;
		int[] stack; 
		public Stack()
        {
			stack = new int[50];
        }
		internal string Inc(int indexOfLastElems, int incerment)
        {
            stack.Take(indexOfLastElems).Select(e => e + incerment)
                .Zip(Enumerable.Range(0, indexOfLastElems))
                .ToList().ForEach(elm => stack[elm.Second] = elm.First);

            return index==0? "EMPTY": stack[index-1].ToString();
        }

		internal string Push(int data) 
		{ 
			if(index==stack.Length)
            {
				var newStack = new int[stack.Length * 2];
				Array.Copy(stack, newStack, index);
				stack = newStack;
            }
			stack[index] = data;
			index++;
			return data.ToString();
		} 

		internal string Pop() => 
            index == 0?  "EMPTY": stack[--index].ToString();

	} 

    class Program
    {

        static void Main(string[] args)
        {
            Enumerable.Range(0, int.Parse(Console.ReadLine()))
                .Select(_ => parseCmd(Console.ReadLine()))
                .Aggregate(new Stack(), (list, f) =>
                 {
                     var (output, newList) = f(list);
                     Console.WriteLine(output);
                     return newList;
                 });
        }

        static Func<Stack, (string, Stack)> parseCmd(string strCmd) =>
        stack =>
        {
            var cmdWords = strCmd.Split(" ");
            return (
            cmdWords[0] switch
            {
                "push" => stack.Push(int.Parse(cmdWords[1])) ,
                "pop" => stack.Pop() ,
                "inc" => stack.Inc(int.Parse(cmdWords[1]), int.Parse(cmdWords[2]))
            }, stack);
        };

    }
}
