using System;
using System.Windows.Forms;


namespace Compilador
{
    public partial class Form1 : Form
    {
        private string filepath;
        private Compilador_ASM comp = new Compilador_ASM();
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            comp.set_path(filepath);
            comp.lexico();
            comp.sintaxis();
            label2.Text = comp.get_msg();

        }

        

        private void button2_Click(object sender, EventArgs e)
        {
            label2.Text = "";
            OpenFileDialog choofdlog = new OpenFileDialog();
            choofdlog.Filter = "All Files (*.*)|*.*";
            choofdlog.FilterIndex = 1;
            choofdlog.Multiselect = true;

            if (choofdlog.ShowDialog() == DialogResult.OK)
            {
                filepath = choofdlog.FileName;
                string[] arrAllFiles = choofdlog.FileNames; //used when Multiselect = true  
                label1.Text = filepath;
               
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
