<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayPedido.aspx.cs" Inherits="DisplayTableOriginal.Views.DisplayPedido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Intranet</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="../Imagenes/trlogo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="../css/styleDisplay.css" type="text/css">

</head>
<body>
    <form id="form1" runat="server">
        <%--<table style="width: 50%; text-align: center; background-color: slategray;">  --%>
        <%-- <tr>  --%>
        <%--<td style="align-content:center">  --%>
        <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                &nbsp;<img alt="Logo" class="auto-style1" src="../Imagenes/Image-Logo.png" /></div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="../TextiRodal.html">Inicio</a></li>
                    <li><a href="Register.aspx">Cerrar Sesión</a></li>
                </ul>
            </div>
        </div>
    </nav>
        <br />
        <br />
        <br />
        <div style="text-align:center">
            <asp:Label ID="LblInitial" runat="server" Text="Fecha Inicial"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="ShowCalendar" runat="server" Text="Mostrar Calendario" OnClick="ShowCalendar_Click"></asp:Button>
            <br />
            <br />
            <div style="width:15%; margin: 0 auto">
                <asp:Calendar ID="InitialDate" runat="server" OnSelectionChanged="InitialDate_SelectionChanged" Visible="false" Height="200px" Width="220px" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" ShowGridLines="True">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </div>
            <br />
            <asp:Label ID="LblFinal" runat="server" Text="Fecha Final"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="ShowCalendar1" runat="server" Text="Mostrar Calendario" OnClick="ShowCalendar1_Click" />
            <br />
            <br />
            <div style="width:15%; margin: 0 auto">
                <asp:Calendar ID="EndDate" runat="server" OnSelectionChanged="EndDate_SelectionChanged" Visible="false" Height="200px" Width="220px" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" ShowGridLines="True">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </div>
            <br />
            <asp:Button ID="BtnPedidoFiltro" runat="server" Text="Ver Pedidos" OnClick="BtnPedidoFiltro_Click" />
            <asp:Button ID="BtnReset" runat="server" Text="Nuevas Fechas" OnClick="BtnReset_Click" />
        </div>
        <br />
        <br />
        <asp:GridView ID="GrdPedidos" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"></asp:GridView>
        <br />
        <br />
        <asp:Label ID="LblMinTotal" runat="server" Text="Total Minutos" Visible="false"></asp:Label>
        <asp:TextBox ID="TxtMinTotal" runat="server" Enabled="False" Visible="false"></asp:TextBox>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        <asp:Label ID="LblDiaTotal" runat="server" Text="Total Dias" Visible="false"></asp:Label>
        <asp:TextBox ID="TxtDiaTotal" runat="server" Enabled="False" Visible="false"></asp:TextBox>
        <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>
        <br />
        <br />

        <%--</td> --%>
        <%-- </tr>  --%>
        <%--  </table>  --%>
    </form>
</body>
</html>
