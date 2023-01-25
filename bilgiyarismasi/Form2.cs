using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Linq;

namespace bilgiyarismasi
{
    public partial class Form2 : Form
    {
        private readonly string _name;

        public List<int> AskedQuestions = new List<int>();

        public Form2(string name)
        {
            InitializeComponent();
            _name = name;
            btnNew.Visible = false;

        }
        private readonly SqlConnection _connect = new SqlConnection("Data Source=DESKTOP-BTS4FS5\\SQLEXPRESS;Initial Catalog=RaceofQuestions;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        int _sayac = 0;
        int _puan = 0;

        private bool _isInGame = false;
        public void StartGame()
        {
            getQuestions();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            getQuestions();

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        public void getQuestions()
        {
            lblGamerName.Text = _name;
            btnStart.Enabled = false;
            button1.Enabled = true;
            button2.Enabled = true;
            button3.Enabled = true;
            button4.Enabled = true;
            btnSpace.Enabled = true;
            button1.BackColor = Color.Gray;
            button2.BackColor = Color.Gray;
            button3.BackColor = Color.Gray;
            button4.BackColor = Color.Gray;
            btnSpace.BackColor = Color.Gray;
            btnStart.Text = "Next";

            if (_isInGame == false)
                
                _isInGame = true;

            if (_isInGame)
            {
                _sayac++;
                lblQuestion.Text = _sayac.ToString();
                _connect.Open();

                //var idQuery = string.Join(",", AskedQuestions);
                //SqlCommand command1 = new SqlCommand($"SELECT TOP 1 * FROM Questions " +
                //$"{(AskedQuestions.Any() ? $"where Id not in ({idQuery})" : "")} ORDER BY NEWID()", _connect);
                //SqlDataReader reader1 = command1.ExecuteReader();

                SqlCommand cmd1 = new SqlCommand("Game_Process", _connect);

                cmd1.Parameters.Add("@Lang", SqlDbType.NVarChar).Value = "tr";

                if (AskedQuestions.Any())
                {
                    cmd1.Parameters.Add("@ProcessID", SqlDbType.Int).Value = 2;

                    DataTable idTable = new DataTable();
                    idTable.Columns.Add(new DataColumn("Id", typeof(int)));
                    foreach (var questionId in AskedQuestions)
                    {
                        idTable.Rows.Add(questionId);
                    }

                    var idListParam = cmd1.Parameters.AddWithValue("@IdQuery", idTable);
                    idListParam.SqlDbType = SqlDbType.Structured;
                    idListParam.TypeName = "dbo.IdList";
                }
                else
                {
                    cmd1.Parameters.Add("@ProcessID", SqlDbType.Int).Value = 3;
                }
                cmd1.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader1 = cmd1.ExecuteReader();

                while (reader1.Read())
                {
                    readerCreate(reader1);
                    var questionId = reader1["Id"];
                    AskedQuestions.Add((int)questionId);
                }
                _connect.Close();
            }
            if (_sayac == 11)
            {
                _isInGame = false;

                string userName = _name;
                string userScore = _puan.ToString();
                DateTime date = DateTime.Now;

                SqlCommand cmd = new SqlCommand("Game_Process", _connect);
                cmd.Parameters.Add("@ProcessID", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = userName;
                cmd.Parameters.Add("@Score", SqlDbType.NVarChar).Value = userScore;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime).Value = date;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sd = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sd.Fill(dt);
                _connect.Close();



                lblQuestion.Visible = false;
                btnStart.Text = "Game Over";
                button1.Enabled = false;
                button2.Enabled = false;
                button3.Enabled = false;
                button4.Enabled = false;
                btnNew.Visible = true;


            }
        }
        private void label1_Click(object sender, EventArgs e)
        {

        }
        public void readerCreate(SqlDataReader reader)
        {
            button1.Text = (reader["A"].ToString());
            button2.Text = (reader["B"].ToString());
            button3.Text = (reader["C"].ToString());
            button4.Text = (reader["D"].ToString());
            lblCorrect.Text = (reader["Correct"].ToString());
            lblCorrect.Visible = false;
            textBox1.Text = (reader["Question"].ToString());
        }
        public void enableButton(string lblCorrect)
        {
            btnStart.Enabled = true;
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            btnSpace.Enabled = false;

            if (button1.Text == lblCorrect)
            {
                button1.BackColor = Color.Green;
            }
            if (button2.Text == lblCorrect)
            {
                button2.BackColor = Color.Green;
            }
            if (button3.Text == lblCorrect)
            {
                button3.BackColor = Color.Green;
            }
            if (button4.Text == lblCorrect)
            {
                button4.BackColor = Color.Green;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            buttonCodes(sender);

        }
        private void button2_Click(object sender, EventArgs e)
        {
            buttonCodes(sender);
        }
        private void button3_Click(object sender, EventArgs e)
        {
            buttonCodes(sender);
        }
        private void button4_Click(object sender, EventArgs e)
        {
            buttonCodes(sender);
        }



        private void btnNew_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void buttonCodes(object sender)
        {
            Button btn = (Button)sender;

            if (btn.Text == lblCorrect.Text)
            {
                _puan += 10;

                btn.BackColor = Color.Green;
            }
            else
            {
                btn.BackColor = Color.Red;
               if(_puan>=5)
                   _puan -= 5;
            }
            lblPuan.Text = _puan.ToString();
            enableButton(lblCorrect.Text);
        }

        private void Form2_FormClosed(object sender, FormClosedEventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Visible = true;
        }

        private void btnSpace_Click(object sender, EventArgs e)
        {
            btnSpace.BackColor = Color.DarkBlue;
            _puan += 0;
            enableButton(lblCorrect.Text);
            //getQuestions();

        }
    }
}
