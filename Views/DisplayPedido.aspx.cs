using DisplayTableOriginal.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DisplayTableOriginal.Views
{
    public partial class DisplayPedido : System.Web.UI.Page
    {
        private void BindData()
        {
            SqlConnection con = new SqlConnection();
            SqlDataReader reader;
            con.ConnectionString = @"Data Source=186.101.103.197; Initial Catalog= pedidos_rodal;User ID=rodal;Password=Mishell2017;";

            SqlCommand cmd = new SqlCommand("Pedidos_Ordenado_Sam", con);
            cmd.Parameters.Add(new SqlParameter("Fecha_Inicial", Convert.ToDateTime(string.IsNullOrEmpty(TextBox1.Text) ? DateTime.Now : Convert.ToDateTime(TextBox1.Text))));
            cmd.Parameters.Add(new SqlParameter("Fecha_Final", Convert.ToDateTime(string.IsNullOrEmpty(TextBox2.Text) ? DateTime.Now : Convert.ToDateTime(TextBox2.Text))));
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            reader = cmd.ExecuteReader();
            List<Pedido> listaPedidos = new List<Pedido>();
            double pedidoTotal_Sam_Total = 0;
            double minutos_Total = 0;
            double dias_Total = 0;

            while (reader.Read())
            {
                Pedido pedido = new Pedido();
                pedido.Id_Empresa = Convert.ToInt16(reader.GetValue(0));
                pedido.Num_Orden = Convert.ToInt16(reader.GetValue(1));
                pedido.Descripcion = reader.GetValue(2).ToString();
                pedido.F_Entrega = Convert.ToDateTime(reader.GetValue(3));
                pedido.Sam_Total = Convert.ToDouble(reader.GetValue(4));
                pedido.Numero_Prendas = Convert.ToInt16(reader.GetValue(5));
                pedido.Minutos = pedido.Sam_Total * pedido.Numero_Prendas;
                pedidoTotal_Sam_Total += pedido.Sam_Total;
                minutos_Total += pedido.Minutos;
                dias_Total = minutos_Total / 11730;
                listaPedidos.Add(pedido);
            }

            con.Close();
            GrdPedidos.DataSource = listaPedidos;
            GrdPedidos.DataBind();
            LblMinTotal.Visible = true;
            TxtMinTotal.Visible = true;
            TxtMinTotal.Text = minutos_Total.ToString();
            LblDiaTotal.Visible = true;
            TxtDiaTotal.Visible = true;
            TxtDiaTotal.Text = dias_Total.ToString();

        }

        protected void BtnPedidoFiltro_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void InitialDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = InitialDate.SelectedDate.ToShortDateString();
            InitialDate.Visible = true;
        }

        protected void EndDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBox2.Text = EndDate.SelectedDate.ToShortDateString();
            EndDate.Visible = true;
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisplayPedido.aspx", true);
        }

        protected void ShowCalendar_Click(object sender, EventArgs e)
        {
            InitialDate.Visible = true;
        }

        protected void ShowCalendar1_Click(object sender, EventArgs e)
        {
            EndDate.Visible = true;
        }
    }
}
