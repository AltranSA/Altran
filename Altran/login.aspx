<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Altran.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login de Acceso</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/modernizr-2.6.2.js"></script>
    <link href="Content/fonts.css" rel="stylesheet" />
</head>
<body class="body">
    <form id="form1" runat="server">
     <div class="container">
    <div class="row">
        <br />
        <div class="col-xs-3 col-sm-3 colmd-3 col-lg-3"></div>
        <div class="col-xs-6 col-sm-6  col-md-6 col-lg-6 ">
            <div class="panel panel-default">
                <div class="panel-heading fonts-text" style="background-color:#C0392B!important; color:white;" >
                    Login de Acceso
                </div>
                <div class="panel-body">
                        
                            <div class="form-group">
                                <label class="control-label" for="username">Nombre de usuario:</label>
                                <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" title="Please enter you username" required="" placeholder="ejemplo@gmail.com" ></asp:TextBox>
                                <span class="help-block small">Tu Nombre es unico en nuestra App</span>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="password">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server"  CssClass="form-control"  placeholder="******" required="" TextMode="Password"></asp:TextBox>
                                <span class="help-block small">Tu Password</span>
                            </div>
                            <div class="checkbox">
                                   <div class="col-lg-offset-9 col-md-offset-9 col-sm-offset-9">
                                    <img alt="altAltansa" src="Imagenes/altra.jpg" width="100" height="80" />
                                </div>
                            </div>
                            <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="btn btn-default btn-block" />
                            
                        
                </div>
                <div class="panel-footer">
                    <asp:Panel ID="PnlMensajeError" runat="server" CssClass="alert alert-danger" style="border:solid 1px#ff0000;" Visible="false">
                        <asp:Label ID="etMensaje" runat="server" Text="" Font-Size="10" CssClass="text-muted"></asp:Label>
                    </asp:Panel>
                    
                </div>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
