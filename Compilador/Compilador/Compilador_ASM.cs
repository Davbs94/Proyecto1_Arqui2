//I Proyecto CE-4301
//Autor: David Badilla S.
//12/10/2017
//Descripción: Esta clase se encarga de realizar la compilación de un archivo de codigo
//con un formato definido. La salida del programa será un archivo .mif que ira a la 
//memoria ROM de un procesador diseñado en verilog
//
//
//
//
//
//




using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Compilador
{
    public class Compilador_ASM
    {
        private string _path;           //path del archivo a leer
        private int _default_pc = 0;   //Variable para llevar conteo del PC
        private string _error = "File Compiled!";
        private string _bin_file = "";
        private string _hex_file = "";


        //Todas estas listas se utilizan para hacer los analisis sintactico y lexico del archivo

        private List<List<string>> _tokens = new List<List<string>>();

        private List<String> _instructions_type1 = new List<string>(new string[] 
                            {});
        private List<String> _instructions_type2 = new List<string>(new string[]
                            {});

        private List<String> _codes_type1 = new List<string>(new string[]
                            {});
        private List<String> _codes_type2 = new List<string>(new string[]
                            {});
        private List<string> _registers = new List<string>(new string[] 
                            {});
        private List<string> _codes_registers = new List<string>(new string[]
                            {});

        private List<string> _labels = new List<string>();
        private List<int> _labels_mem = new List<int>();


        //Constructor, se leen y tranforman los archivos de configuracion de las instrucciones y registros
        public Compilador_ASM()
        {
            
            string path1 = System.IO.Path.Combine("/home/david/Documents/Proyecto1_Arqui2/Compilador/Compilador/bin/Debug/Instructions1.txt");
            string path2 = System.IO.Path.Combine("/home/david/Documents/Proyecto1_Arqui2/Compilador/Compilador/bin/Debug/Instructions2.txt");
            string path4 = System.IO.Path.Combine("/home/david/Documents/Proyecto1_Arqui2/Compilador/Compilador/bin/Debug/Registers.txt");
            Console.WriteLine(path1);
            string[] lines1 = System.IO.File.ReadAllLines(path1);
            string[] lines2 = System.IO.File.ReadAllLines(path2);
            string[] lines4 = System.IO.File.ReadAllLines(path4);
            for (int i = 0; i < lines1.Length; i++)
            {
                _instructions_type1.Add(lines1[i].Split('@')[0]);
                _codes_type1.Add(lines1[i].Split('@')[1]);
            }
            for (int i = 0; i < lines2.Length; i++)
            {
                _instructions_type2.Add(lines2[i].Split('@')[0]);
                _codes_type2.Add(lines2[i].Split('@')[1]);
            }
            for (int i = 0; i < lines4.Length; i++)
            {
                _registers.Add(lines4[i].Split('@')[0]);
                _codes_registers.Add(lines4[i].Split('@')[1]);
            }

        }

        //metodo que hace set del path del archivo a compilar
        public void set_path(string path)
        {
            _path = path;
            Console.WriteLine(path);
        }


        //meotod que realiza el analisis lexico del archivo, elimina comentarios y divide en tokens
        public void lexico()
        {
            _error = "File Compiled!";
            _tokens.Clear();
            string[] lines = System.IO.File.ReadAllLines(@_path);
            for (int i = 0; i < lines.Length; i++)
            {
                string[] tmp = lines[i].Split(new[] { ' ', ',','\t'}, StringSplitOptions.RemoveEmptyEntries);
                
               
                    List<string> tmp2= new List<string>();
                    for (int j =0; j<tmp.Length;j++)
                    {
                        if (tmp[j].StartsWith("#"))
                        {                        
                            break;
                        }
                        else
                        {
                            tmp2.Add(tmp[j]);
                        }
                    }
                    if (tmp2.Count == 0)
                    {

                    }
                    else
                    {
                        _tokens.Add(tmp2);
                    }      
            }

            
            string path = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + @"\Program.tok");
            System.IO.StreamWriter file = new System.IO.StreamWriter(path);
            
            for (int x = 0; x < _tokens.Count; x++)
            {
                string tmp = "|";
                for (int y = 0; y < _tokens[x].Count; y++)
                {
                    tmp = tmp + _tokens[x][y] + "|";
                }

                file.WriteLine(tmp);
            }
            file.Close();
        }


        //Realiza el analisis sintactico, revisa sintaxis y hace un manejo de dependencias, agrega NOPS
        public void sintaxis()
        {
            for (int i = 0; i < _tokens.Count; i++)
            {
                if (_tokens[i][0].EndsWith(":"))
                {
                    _labels.Add(_tokens[i][0].Remove(_tokens[i][0].Length - 1));
                    _labels_mem.Add(_default_pc + i);
                    _default_pc = _default_pc - 1;

                }
                else if (_instructions_type1.Contains(_tokens[i][0])||_instructions_type2.Contains(_tokens[i][0]))
                {
                    if (_tokens[i][0].ToLower() == "cmp")
                    {
                        List<string> b = new List<string>();
                        b.Add("nop");
                        _tokens.Insert(i + 1, b);
                        _tokens.Insert(i + 2, b);
                    }
                    else if (_instructions_type1.Contains(_tokens[i][0]))
                    {
                        int a = check_nops(i);
                        Console.WriteLine(a);
                        if (a == 3)
                        {
                            List<string> b = new List<string>();
                            b.Add("nop");
                            _tokens.Insert(i + 1, b);
                            _tokens.Insert(i + 2, b);
                            _tokens.Insert(i + 3, b);
                        }
                        else if (a == 2)
                        {
                            List<string> b = new List<string>();
                            b.Add("nop");
                            _tokens.Insert(i + 1, b);
                            _tokens.Insert(i + 2, b);

                        }
                        else if (a == 1)
                        {
                            List<string> b = new List<string>();
                            b.Add("nop");
                            _tokens.Insert(i + 1, b);
                            
                        }
                       // sintax_instruction_type1(_tokens[i]);
                    }
                    else if (_instructions_type2.Contains(_tokens[i][0]))
                    {
                        if (_tokens[i][0].ToLower() == "cmpi")
                        {
                            List<string> b = new List<string>();
                            b.Add("nop");
                            _tokens.Insert(i + 1, b);
                            _tokens.Insert(i + 2, b);
                        }
                        // sintax_instruction_type2(_tokens[i]);
                        else if (_tokens[i][0].ToLower() == "j")
                        {
                            
                            
                            List<string> b = new List<string>();
                            b.Add("nop");
                            _tokens.Insert(i+1, b);
                            _tokens.Insert(i+2, b);
                            _tokens.Insert(i + 2, b);

                        }
                        else if (_tokens[i][0].ToLower() == "bne" || _tokens[i][0].ToLower() == "beq")
                        {
                            
                            List<string> b = new List<string>();
                            b.Add("nop");
                            _tokens.Insert(i + 1, b);
                            _tokens.Insert(i + 2, b);
                            _tokens.Insert(i + 2, b);

                        }
                        else
                        {
                            int a = check_nops(i);
                            if (a == 3)
                            {
                                List<string> b = new List<string>();
                                b.Add("nop");
                                _tokens.Insert(i + 1, b);
                                _tokens.Insert(i + 2, b);
                                _tokens.Insert(i + 3, b);
                            }
                            else if (a == 2)
                            {
                                List<string> b = new List<string>();
                                b.Add("nop");
                                _tokens.Insert(i + 1, b);
                                _tokens.Insert(i + 2, b);

                            }
                            else if (a == 1)
                            {
                                List<string> b = new List<string>();
                                b.Add("nop");
                                _tokens.Insert(i + 1, b);

                            }
                        }
                    }
                    
                }
                else
                {
                    _error = "Sintax Error: Instruction Not Found!";
                    break;
                }
            }

            string path = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + @"\Program.lb");
            System.IO.StreamWriter file = new System.IO.StreamWriter(path);

            for (int x = 0; x < _labels.Count; x++)
            {

                file.WriteLine(_labels[x] + "|" + _labels_mem[x]);
            }
            file.Close();

            string path2 = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + @"\Program.tok");
            System.IO.StreamWriter file2 = new System.IO.StreamWriter(path2);

            for (int x = 0; x < _tokens.Count; x++)
            {
                string tmp = "|";
                for (int y = 0; y < _tokens[x].Count; y++)
                {
                    tmp = tmp + _tokens[x][y] + "|";
                }

                file2.WriteLine(tmp);
            }
            file2.Close();
        }

        //Sintaxis de instrucciones tipo registro
        public bool sintax_instruction_type1(List<string> _instruction)
        {
            if (_instruction.Count != 4)
            {
                _error = "Sintax Error: Wrong Parameters!";
                return false;
            }
            else
            {
                if (_registers.Contains(_instruction[1].ToLower())&& _registers.Contains(_instruction[2].ToLower())
                    && _registers.Contains(_instruction[3].ToLower()))
                {
                    return true;
                }
                else
                {
                    _error = "Sintax Error: Wrong Registers";
                    return false;
                }
            }
        }


        //Sintaxis de instrucciones tipo inmediato
        public bool sintax_instruction_type2(List<string> _instruction)
        {
            
            if (_instruction.Count != 3)
            {
                _error = "Sintax Error: Wrong Parameters!";
                return false;
            }
            else
            {
                if (_registers.Contains(_instruction[1].ToLower()))
                {
                    int x;
                    if (_instruction[2].StartsWith("#")|| _instruction[2].StartsWith("0x")|| int.TryParse(_instruction[2], out x))
                    {
                        return true;
                    }
                    else
                    {
                        _error = "Sintax Error: Wrong Inmediate value!";
                        return false;
                    }
                }
                else
                {
                    _error = "Sintax Error: Wrong Registers";
                    return false;
                }
            }
        }

        public string get_msg()
        {
            return _error;
        }



        //Metodo encargado de generar el archivo binario de compilacion
        public void  generate_binary()
        {
            string tmp = "";
            for (int i = 0; i < _tokens.Count; i++)
            {

                    string opcode = convert(_tokens[i][0]);

                    if (opcode == "00000"|| opcode == "00010" || opcode == "00100" || opcode == "00110" || opcode == "00111" ||
                        opcode == "10110" || opcode == "01001" || opcode == "10000" || opcode  == "10001")
                    {
                    Console.WriteLine(opcode);
                        tmp = tmp + convert(_tokens[i][0]) + convert(_tokens[i][1]) + convert(_tokens[i][2]) + convert(_tokens[i][3]) + "000000000000" + "\n";
                    }
                    else if (opcode == "01010" || opcode == "01100" || opcode == "01110"  )
                    {
                        tmp = tmp + convert(_tokens[i][0]) + convert(_tokens[i][1]) + convert(_tokens[i][2]) + "00000" + "000000000000" + "\n";
                    }
                    else if (opcode == "01000")
                    {
                        tmp = tmp +  convert(_tokens[i][0]) + convert(_tokens[i][1]) + "00000" + "00000" + "000000000000" + "\n" ;
                    }
                    else if (opcode == "00001" || opcode == "00011" || opcode == "00101" || opcode == "10100" || opcode == "10101")
                    {
                        tmp = tmp + convert(_tokens[i][0]) + convert(_tokens[i][1]) + convert(_tokens[i][2]) + convert(_tokens[i][3]) + "\n";
                    }
                    else if (opcode == "10011")
                    {
                        tmp = tmp + convert(_tokens[i][0]) + "00000" + "00000" + convert(_tokens[i][1]) + "\n";
                    }
                    else if (opcode == "01011" || opcode == "01101" || opcode == "01111")
                    {
                        tmp = tmp + convert(_tokens[i][0]) + convert(_tokens[i][1]) + "00000" + convert(_tokens[i][2]) + "\n";
                    }
                    else if (opcode == "10111")
                    {
                        tmp = tmp + convert(_tokens[i][0]) + "000000000000000000000000000" + "\n";
                    }
                    else
                    {
                        
                        
                    }

              
               
            }
            
            string path = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + @"\Program.bin");
            System.IO.StreamWriter file = new System.IO.StreamWriter(path);
            file.WriteLine(tmp);
            file.Close();
        }


        //Tranforma el archivo a formato . mif, que ira a la ROM del procesador
        public void generate_mif()
        {
            int a = 0;
            string path = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + @"\Program.bin");
            string[] lines = System.IO.File.ReadAllLines(path);
            string tmp = "WIDTH=32;\nDEPTH = 65536;\n\nADDRESS_RADIX = UNS;\nDATA_RADIX = BIN;\n\nCONTENT BEGIN\n";
            for (int i = 0; i < lines.Length; i++)
            {
                if (lines[i].Length < 31)
                {
                    a++;
                }
                else
                {
                    tmp = tmp + "       " + i.ToString() + " : " + lines[i] + ";\n";
                }             
            };
            tmp = tmp + "       " + "[" + (lines.Length-a).ToString() + ".." + "65535" + "]" + " : " + "10111000000000000000000000000000;\n";
            tmp = tmp + "END;";
            string path2 = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + @"\ROM.mif");
            System.IO.StreamWriter file = new System.IO.StreamWriter(path2);
            file.WriteLine(tmp);
            file.Close();
        }



        //metodo secundario, convierte el token de instruccion y registros a su valor en binario
        public string convert(string token)
        {
            string tmp = "";
            if (_instructions_type1.Contains(token.ToLower()))
            {
                int index = _instructions_type1.IndexOf(token.ToLower());
                tmp = _codes_type1[index];
            }
            else if (_instructions_type2.Contains(token.ToLower()))
            {
                int index = _instructions_type2.IndexOf(token.ToLower());
                tmp = _codes_type2[index];
            }
            else if (_registers.Contains(token.ToLower()))
            {
                int index = _registers.IndexOf(token.ToLower());
                tmp =  _codes_registers[index];
            }
            else if (_labels.Contains(token))
            {
                int index = _labels.IndexOf(token);
                string lb = Convert.ToString(_labels_mem[index], 2);
                string binValue = lb.PadLeft(17, '0');
                tmp =  binValue;
            }
            else if (token.Contains(")"))
            {
                string binValue = Convert.ToString(Int32.Parse(token.Trim('(', ')')), 2);
                binValue = binValue.PadLeft(17, '0');
                tmp =  binValue;
            }
            else
            {
                tmp = "XXXXX";
            }
            return tmp;
        }



        //Funcion secundaria que realiza el manejo de depnedncias y devuelve el numero de NOPS que deben ser agregados en caso de que sea necesario. Este
        //meotod lo utiliza el analisis sintactico
        public int check_nops(int i)
        {
            int a = 0;
            int b = 0;
            if(_tokens[i].Count == 1)
            {
                a = 0;
            }
            else
            {
                
                if(_tokens[i][0].ToLower() == "add" || _tokens[i][0].ToLower() == "sub" || _tokens[i][0].ToLower() == "cmp" || _tokens[i][0].ToLower() == "and" ||
                     _tokens[i][0].ToLower() == "or" || _tokens[i][0].ToLower() == "mult" || _tokens[i][0].ToLower() == "not" || _tokens[i][0].ToLower() == "xor" ||
                     _tokens[i][0].ToLower() == "lb" || _tokens[i][0].ToLower() == "mov" || _tokens[i][0].ToLower() == "sll" || _tokens[i][0].ToLower() == "srl" 
                     || _tokens[i][0].ToLower() == "addi" || _tokens[i][0].ToLower() == "subi" || _tokens[i][0].ToLower() == "cmpi" || _tokens[i][0].ToLower() == "lbi"||
                     _tokens[i][0].ToLower() == "movi")
                {
                    if (i + 1 < _tokens.Count)
                    {
                        if (_tokens[i+1][0].ToLower() == "add" || _tokens[i+1][0].ToLower() == "sub" || _tokens[i+1][0].ToLower() == "cmp" || _tokens[i+1][0].ToLower() == "and" ||
                            _tokens[i+1][0].ToLower() == "or" || _tokens[i+1][0].ToLower() == "mult"  || _tokens[i+1][0].ToLower() == "xor" 
                            || _tokens[i+1][0].ToLower() == "sll" || _tokens[i+1][0].ToLower() == "srl")
                        {
                            if (_tokens[i][1] == _tokens[i+1][2] || _tokens[i][1] == _tokens[i + 1][3])
                            {
                                a = 3 + b;
                            }

                        }
                        else if (_tokens[i + 1][0].ToLower() == "lb" || _tokens[i + 1][0].ToLower() == "mov" || _tokens[i + 1][0].ToLower() == "addi"
                            || _tokens[i + 1][0].ToLower() == "subi" || _tokens[i + 1][0].ToLower() == "cmpi")
                        {
                            if (_tokens[i][1] == _tokens[i + 1][2] )
                            {
                                a = 3 + b;
                            }
                        }
                        else if (_tokens[i + 1][0].ToLower() == "not")
                        {
                            if (_tokens[i][1] == _tokens[i + 1][1])
                            {
                                a = 3 + b;
                            }
                        }
                        else if (_tokens[i + 1][0].ToLower() == "beq" || _tokens[i + 1][0].ToLower() == "bne")
                        {
                            if (_tokens[i][1] == _tokens[i + 1][1] || _tokens[i][1] == _tokens[i + 1][2])
                            {
                                a = 3 + b;
                            }
                        }
                        else if ((_tokens[i + 1][0].EndsWith(":")))
                        {
                            b = b + 1;
                        }
                    }
                   
                    if (i + 2 < _tokens.Count && a ==0)
                    {
                        if (_tokens[i + 2][0].ToLower() == "add" || _tokens[i + 2][0].ToLower() == "sub" || _tokens[i + 2][0].ToLower() == "cmp" || _tokens[i + 2][0].ToLower() == "and" ||
                            _tokens[i + 2][0].ToLower() == "or" || _tokens[i + 2][0].ToLower() == "mult" || _tokens[i + 2][0].ToLower() == "xor"
                            || _tokens[i + 2][0].ToLower() == "sll" || _tokens[i + 2][0].ToLower() == "srl")
                        {
                            if (_tokens[i][1] == _tokens[i + 2][2] || _tokens[i][1] == _tokens[i + 2][3])
                            {
                                a = 2 + b;
                            }

                        }
                        else if (_tokens[i + 2][0].ToLower() == "lb" || _tokens[i + 2][0].ToLower() == "mov" || _tokens[i + 2][0].ToLower() == "addi"
                            || _tokens[i + 2][0].ToLower() == "subi" || _tokens[i + 2][0].ToLower() == "cmpi")
                        {
                            if (_tokens[i][1] == _tokens[i + 2][2])
                            {
                                a = 2 + b;
                            }
                        }
                        else if (_tokens[i + 2][0].ToLower() == "not")
                        {
                            if (_tokens[i][1] == _tokens[i + 2][1])
                            {
                                a = 2 + b ;
                            }
                        }
                        else if (_tokens[i + 2][0].ToLower() == "beq" || _tokens[i + 2][0].ToLower() == "bne")
                        {
                            if (_tokens[i][1] == _tokens[i + 2][1] || _tokens[i][1] == _tokens[i + 2][2])
                            {
                                a = 2 + b;
                            }
                        }
                        else if (_tokens[i + 2][0].EndsWith(":"))
                        {
                            b = b + 1;
                        }
                    }
                    
                    if (i + 3 < _tokens.Count && a == 0)
                    {
                        if (_tokens[i + 3][0].ToLower() == "add" || _tokens[i + 3][0].ToLower() == "sub" || _tokens[i + 3][0].ToLower() == "cmp" || _tokens[i + 3][0].ToLower() == "and" ||
                            _tokens[i + 3][0].ToLower() == "or" || _tokens[i + 3][0].ToLower() == "mult" || _tokens[i + 3][0].ToLower() == "xor"
                            || _tokens[i + 3][0].ToLower() == "sll" || _tokens[i + 3][0].ToLower() == "srl")
                        {
                            if (_tokens[i][1] == _tokens[i + 3][2] || _tokens[i][1] == _tokens[i + 3][3])
                            {
                                a = 1 + b ;
                            }

                        }
                        else if (_tokens[i + 3][0].ToLower() == "lb" || _tokens[i + 3][0].ToLower() == "mov" || _tokens[i + 3][0].ToLower() == "addi"
                            || _tokens[i + 3][0].ToLower() == "subi" || _tokens[i + 3][0].ToLower() == "cmpi")
                        {
                            if (_tokens[i][1] == _tokens[i + 3][2])
                            {
                                a = 1 + b;
                            }
                        }
                        else if (_tokens[i + 3][0].ToLower() == "not")
                        {
                            if (_tokens[i][1] == _tokens[i + 3][1])
                            {
                                a = 1 + b;
                            }
                        }
                        else if (_tokens[i + 3][0].ToLower() == "beq" || _tokens[i + 3][0].ToLower() == "bne")
                        {
                            if (_tokens[i][1] == _tokens[i + 3][1] || _tokens[i][1] == _tokens[i + 3][2])
                            {
                                a = 1 +b;
                            }
                        }
                        else if ((_tokens[i + 3][0].EndsWith(":")))
                        {
                            b = b + 1;
                            if (i + 4 < _tokens.Count && a == 0)
                            {
                                if (_tokens[i + 4][0].ToLower() == "add" || _tokens[i + 4][0].ToLower() == "sub" || _tokens[i + 4][0].ToLower() == "cmp" || _tokens[i + 4][0].ToLower() == "and" ||
                                    _tokens[i + 4][0].ToLower() == "or" || _tokens[i + 4][0].ToLower() == "mult" || _tokens[i + 4][0].ToLower() == "xor"
                                    || _tokens[i + 4][0].ToLower() == "sll" || _tokens[i + 4][0].ToLower() == "srl")
                                {
                                    if (_tokens[i][1] == _tokens[i + 4][2] || _tokens[i][1] == _tokens[i + 4][3])
                                    {
                                        a = 1 + b;
                                    }

                                }
                                else if (_tokens[i + 4][0].ToLower() == "lb" || _tokens[i + 4][0].ToLower() == "mov" || _tokens[i + 4][0].ToLower() == "addi"
                                    || _tokens[i + 4][0].ToLower() == "subi" || _tokens[i + 4][0].ToLower() == "cmpi")
                                {
                                    if (_tokens[i][1] == _tokens[i + 4][2])
                                    {
                                        a = 1 + b;
                                    }
                                }
                                else if (_tokens[i + 4][0].ToLower() == "not")
                                {
                                    if (_tokens[i][1] == _tokens[i + 4][1])
                                    {
                                        a = 1 + b;
                                    }
                                }
                                else if (_tokens[i + 4][0].ToLower() == "beq" || _tokens[i + 4][0].ToLower() == "bne")
                                {
                                    if (_tokens[i][1] == _tokens[i + 4][1] || _tokens[i][1] == _tokens[i + 4][2])
                                    {
                                        a = 1 + b;
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            return a ;
        }

    }

    
}
