namespace session1Task
{
    internal class Program
    {
        /*
         * 1) write a C#  program to calculate the sum and the average of three numbers.
         */
        public static void CalculateSumAndAvg(double num1,double num2,double num3) {
            var sum = num1 + num2 + num3;
            var avg = sum / 3;
            Console.WriteLine($"The sum of {num1} ,{num2} and {num3} = {sum}");
            Console.WriteLine($"The Avg of {num1} ,{num2} and {num3} = {avg}");

        }

        /*
         * 2) Write a C#  program that asks the user to enter the 
         * radius of a circle and then computes and displays the circle's  area and circumference. 
         */

        public static void calcAreaAndCircumference(double radius) {

            const double Pi= 3.14159;
            var area=Pi*radius*radius;
            var circumference=2*Pi*radius;
            Console.WriteLine($"the area of a circle with radius {radius} ={area} and circumference= {circumference} ");

        }

        /*
         * 3)	write a C# program that accepts an employee salary and
         *     a tax percentage then computes the Net Salary and Annual Salary. 
         */

        public static void CalcualteNetAndAnualSalary(double salary,double tax) { 
            var netSalry=(salary*tax)/100;
            var anuualSalary = netSalry * 12;
            Console.WriteLine($" Your Net Salary = {netSalry} and the anuual salary ={anuualSalary}");
        }
        static void Main(string[] args)
        {
            CalculateSumAndAvg(50.5, 45, 36.8);

            Console.WriteLine("*****************************");
            Console.WriteLine("Enter the Raduis :");
            calcAreaAndCircumference(double.Parse( Console.ReadLine()));

            Console.WriteLine("*****************************");
            Console.WriteLine("Enter the Salary :");
            var salray=double.Parse( Console.ReadLine());
            Console.WriteLine("Enter the tax in percentage :");
            var tax = double.Parse(Console.ReadLine());

            CalcualteNetAndAnualSalary(salray,tax);
        }
    }
}