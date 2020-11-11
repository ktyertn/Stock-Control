using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace WindowsFormsApp2
{

    public partial class Form1 : Form
    {
        MySqlConnection databaseConnection = new MySqlConnection("datasource=127.0.0.1;port=3306;username=root;password=password;database=deneme");
        public Form1()
        {
            InitializeComponent();

        }
        private void button1_Click(object sender, EventArgs e)
        {
            string a = textBox5.Text;
            runQuery(a);
        }
        private void runQuery(string a)
        {
            //  string query = "SELECT K.sehir,Y.ulke_isim FROM sehir K,ulke Y ,mesafe M WHERE M.sehir_id=K.konumid AND M.ulke_id=Y.ulkeid";

            string query = "SELECT * FROM " + a;

            databaseConnection.Open();
            MySqlDataAdapter sda = new MySqlDataAdapter(query, databaseConnection);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dataGridView1.DataSource = dt;
            databaseConnection.Close();


        }

        private void button2_Click(object sender, EventArgs e)
        {

            databaseConnection.Open();
            MySqlCommand komut = new MySqlCommand("INSERT INTO musteri_kayit(id,ad,soyad,konum) VALUES (NULL,'" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "')", databaseConnection);

            komut.ExecuteNonQuery();
            databaseConnection.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                databaseConnection.Open();
                MySqlCommand komut = new MySqlCommand("INSERT INTO uretici_bilesik(id,bilesik,uretici_id,hammadde1,adet1,hammadde2,adet2,hammadde3,adet3) VALUES (NULL,'" + textBox6.Text + "',1,'" + textBox12.Text + "', '" + textBox13.Text + "','" + textBox14.Text + "','" + textBox15.Text + "', '" + textBox16.Text + "', '" + textBox17.Text + "')", databaseConnection);

                komut.ExecuteNonQuery();
                databaseConnection.Close();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Böyle bir kayıt zaten var");
                databaseConnection.Close();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            databaseConnection.Open();
            MySqlCommand komut = new MySqlCommand("INSERT INTO firma_isim(id,isim,konumid) VALUES (NULL,'" + textBox7.Text + "','" + textBox8.Text + "')", databaseConnection);

            komut.ExecuteNonQuery();
            databaseConnection.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            databaseConnection.Open();
            MySqlCommand komut = new MySqlCommand("INSERT INTO musteri(id,musteri_id,talep,miktar) VALUES (NULL,'" + textBox9.Text + "','" + textBox4.Text + "','" + textBox10.Text + "')", databaseConnection);

            komut.ExecuteNonQuery();
            databaseConnection.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string bilesik = textBox11.Text;

            string query = "SELECT * FROM uretici_bilesik WHERE bilesik='" + bilesik + "'";
            MySqlCommand cmd = new MySqlCommand(query, databaseConnection);
            databaseConnection.Open();
            MySqlDataReader r = cmd.ExecuteReader();
            int[] id = new int[25];
            int[] stok = new int[25];
            int i = 0;
            string[] hammadde = new string[3];
            int[] hammadde_adet = new int[3];
            while (r.Read())
            {
                hammadde[0] = r.GetString("hammadde1");
                hammadde_adet[0] = r.GetInt32("adet1");
                hammadde[1] = r.GetString("hammadde2");
                hammadde_adet[1] = r.GetInt32("adet2");
                hammadde[2] = r.GetString("hammadde3");
                hammadde_adet[2] = r.GetInt32("adet3");

            }

            r.Close();
            query = "SELECT * FROM musteri WHERE id=" + textBox18.Text;
            // query = "UPDATE hammadde SET stok=0 WHERE hammadde_id=" + id[0].ToString();
            MySqlCommand cmd2 = new MySqlCommand(query, databaseConnection);
            r = cmd2.ExecuteReader();
            int siparis = 0;
            int toplam_fiyat = 0;
            int[] fiyat = new int[25];
            int j = 0;
            while (r.Read())
            {
                siparis = r.GetInt32("miktar");
            }
            hammadde_adet[0] = siparis * hammadde_adet[0];
            hammadde_adet[1] = siparis * hammadde_adet[1];
            hammadde_adet[2] = siparis * hammadde_adet[2];
            r.Close();

            for (i = 0; i < 3; i++)
            {

                j = 0;


                query = "SELECT * FROM hammadde WHERE urun='" + hammadde[i] + "'ORDER BY fiyat";
                MySqlCommand cmd3 = new MySqlCommand(query, databaseConnection);
                MySqlDataReader re = cmd3.ExecuteReader();
                // r = cmd3.ExecuteReader();
                while (re.Read())
                {
                    stok[j] = re.GetInt32("stok");
                    id[j] = re.GetInt32("hammadde_id");
                    fiyat[j] = re.GetInt32("fiyat");
                    j++;
                }
                re.Close();
                int sayac = j;
                j = 0;
                int stok_tut = 0;
                int id_tut = 0;
                int fiyat_tut = 0;
                int toplam_uretim = 0;
                while (j < sayac || hammadde_adet[i] != 0)
                {
                    while (stok[j] != 0 || hammadde_adet[i] != 0)
                    {
                        stok_tut = stok[j];
                        id_tut = id[j];
                        fiyat_tut = fiyat[j];
                        if (hammadde_adet[i] == stok_tut)
                        {
                            hammadde_adet[i] = 0;
                            toplam_fiyat += stok_tut * fiyat_tut;
                            r.Close();
                            stok_tut = 0;
                            query = "UPDATE hammadde SET stok=0 WHERE hammadde_id=" + id[j].ToString();
                            MySqlCommand cmd4 = new MySqlCommand(query, databaseConnection);
                            cmd4.ExecuteNonQuery();
                            stok[j] = 0;
                            hammadde_adet[i] = 0;


                        }
                        else if (hammadde_adet[i] > stok_tut)
                        {
                            hammadde_adet[i] -= stok_tut;

                            r.Close();
                            query = "UPDATE hammadde SET stok=0 WHERE hammadde_id=" + id[j].ToString();
                            MySqlCommand cmd4 = new MySqlCommand(query, databaseConnection);
                            cmd4.ExecuteNonQuery();
                            toplam_fiyat += stok_tut * fiyat_tut;
                            stok_tut = 0;
                            j++;

                        }
                        else
                        {
                            stok_tut = stok_tut - hammadde_adet[i];
                            r.Close();
                            query = "UPDATE hammadde SET stok=" + stok_tut.ToString() + " WHERE hammadde_id=" + id[j].ToString();
                            MySqlCommand cmd4 = new MySqlCommand(query, databaseConnection);
                            cmd4.ExecuteNonQuery();
                            toplam_fiyat += hammadde_adet[i] * fiyat_tut;
                            hammadde_adet[i] = 0;
                            j++;
                        }
                    }
                    if (hammadde_adet[i] == 0)
                    {

                        break;
                    }
                    j++;


                }



            }


            r.Close();
            query = "UPDATE musteri SET miktar=0 ,fiyat=" + toplam_fiyat.ToString() + " WHERE id=" + textBox18.Text;
            MySqlCommand cmd5 = new MySqlCommand(query, databaseConnection);
            cmd5.ExecuteNonQuery();
            textBox19.Text = toplam_fiyat.ToString();
            toplam_fiyat = 0;
            databaseConnection.Close();
        }

    }
}