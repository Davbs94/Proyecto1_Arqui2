using System;

    public class Compiler
    {
        private string _path;

        public Compiler(string path)
        {
            _path = path;
        }


        public void lexico()
        {
            string[] lines = System.IO.File.ReadAllLines(@_path);
            Console.WriteLine(lines[0]);
        }
    }

