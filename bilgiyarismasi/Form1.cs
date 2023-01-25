using System;
using System.Data;
using System.Data.SqlClient;

using System.Windows.Forms;

namespace bilgiyarismasi
{
    public partial class Form1 : Form
    {
     
        public Form1()
        {
            InitializeComponent();
            btnStartGame.Enabled = false;
            LoadTop5User();

        }

        
        private readonly SqlConnection _con = new SqlConnection("Data Source=DESKTOP-BTS4FS5\\SQLEXPRESS;Initial Catalog=RaceofQuestions;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        private void textGamerName_TextChanged(object sender, EventArgs e)
        {
            if (txtGamerName.Text.Length != 0)
            {
                btnStartGame.Enabled = true;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            
            this.Visible = false;
            Form2 form2 = new Form2(txtGamerName.Text);
            form2.StartGame();
            form2.Visible = true;
        }

        private void LoadTop5User()
        {
            //Stored Procedureden veriyi çektik.
            SqlCommand cmd = new SqlCommand("Game_Process", _con);
            cmd.Parameters.Add("@ProcessID", SqlDbType.Int).Value=0;
            cmd.CommandType = CommandType.StoredProcedure;
            
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
             sd.Fill(dt);
             dataGridView1.DataSource = dt;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
