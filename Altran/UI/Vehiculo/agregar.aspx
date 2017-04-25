<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agregar.aspx.cs" Inherits="Altran.UI.Vehiculo.agregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script>

        $(document).ready(function () {
            $("#<%=this.ddlMarca.ClientID %>").change(function () {
                //alert("Handler for .change() called.");
                llamarDropDownList();
            });

            function llamarDropDownList() {
                $.ajax({
                    type: "POST",
                    url: "http://localhost:53025/UI/Vehiculo/agregar/GetDatosModelos",
                    data: '{name: "' + $("#<%=this.ddlMarca.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        //alert(response.d);
                        console.log();
                        alert('Algo Salio Mal');
                    }
                });
            }

            function OnSuccess(response) {
                alert('Algo Salio Mal');
                //alert(response.d);
            }
        });

       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
       <div class="row">
           <br />
           <br />
           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne" style="background-color:#C0392B!important; color:white;">
                            <h4 class="panel-title">
                                <a href="#">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-random"></span>&nbsp &nbsp Datos Vehiculares</p>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-body">
                             <table class="table table-condensed" style="width: 100%;">
                                 <tr>
                                     <td class="fonts-text">No. Económico:</td>
                                     <td>
                                         <asp:TextBox ID="txtNoEconomico" runat="server" placeHolder="No. Económico" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Fecha de Ingreso:</td>
                                     <td>
                                         <asp:TextBox ID="txtFechaIngreso" runat="server" placeHolder="No. Económico" CssClass="form-control"></asp:TextBox>
                                         <ajaxToolkit:CalendarExtender ID="dtefechaIngresoExt" runat="server" TargetControlID="txtFechaIngreso" />
                                     </td>
                                   
                                     <td class="fonts-text">No. de Serie:</td>
                                     <td>
                                         <asp:TextBox ID="txtNoSerie" runat="server" placeHolder="No. de Serie" CssClass="form-control"></asp:TextBox>
                                     </td>
                                 </tr>

                               
                                 <tr>
                                     <td class="fonts-text">Tipo:</td>
                                     <td>
                                         <asp:DropDownList ID="ddlTipoVehiculo" runat="server" CssClass="form-control"></asp:DropDownList>
                                     </td>
                                     <td class="fonts-text">Marca:</td>
                                     <td>
                                         <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged"></asp:DropDownList>
                                        
                                     </td>
                                   
                                     <td class="fonts-text">Modelo:</td>
                                     <td>
                                        <asp:DropDownList ID="ddlModelo" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlModelo_SelectedIndexChanged"></asp:DropDownList>
                                     </td>
                                 </tr>


                                 <tr>
                                     <td class="fonts-text">No. de Motor:</td>
                                     <td>
                                          <asp:TextBox ID="txtNoMotor" runat="server" placeHolder="No. de Motor" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Capacidad:</td>
                                     <td>
                                         <asp:TextBox ID="txtCapacidad" runat="server" placeHolder="Capacidad" CssClass="form-control"></asp:TextBox>
                                        
                                     </td>
                                   
                                     <td class="fonts-text">Color:</td>
                                     <td>
                                         <asp:TextBox ID="txtColor" runat="server" placeHolder="Color" CssClass="form-control"></asp:TextBox>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td class="fonts-text">Año:</td>
                                     <td>
                                          <asp:DropDownList ID="ddlAnio" runat="server" CssClass="form-control" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlAnio_SelectedIndexChanged">
                                              <asp:ListItem>Seleccionar</asp:ListItem>
                                              <asp:ListItem>2015</asp:ListItem>
                                              <asp:ListItem>2016</asp:ListItem>
                                              <asp:ListItem>2017</asp:ListItem>
                                              <asp:ListItem>2018</asp:ListItem>
                                              <asp:ListItem>2019</asp:ListItem>
                                              <asp:ListItem>2020</asp:ListItem>
                                              <asp:ListItem>2021</asp:ListItem>
                                              <asp:ListItem>2022</asp:ListItem>
                                              <asp:ListItem>2023</asp:ListItem>
                                              <asp:ListItem>2024</asp:ListItem>
                                              <asp:ListItem>2025</asp:ListItem>
                                              <asp:ListItem>2026</asp:ListItem>
                                              <asp:ListItem>2027</asp:ListItem>
                                              <asp:ListItem>2028</asp:ListItem>
                                              <asp:ListItem>2029</asp:ListItem>
                                              <asp:ListItem>2030</asp:ListItem>
                                              <asp:ListItem>2031</asp:ListItem>
                                              <asp:ListItem>2032</asp:ListItem>
                                              <asp:ListItem>2033</asp:ListItem>
                                              <asp:ListItem>2034</asp:ListItem>
                                              <asp:ListItem>2035</asp:ListItem>
                                              <asp:ListItem>2036</asp:ListItem>
                                              <asp:ListItem>2037</asp:ListItem>
                                              <asp:ListItem>2038</asp:ListItem>
                                              <asp:ListItem>2039</asp:ListItem>
                                              <asp:ListItem>2040</asp:ListItem>
                                          </asp:DropDownList>
                                     </td>
                                     <td class="fonts-text">Precio de Compra:</td>
                                     <td>
                                         <asp:TextBox ID="txtPrecioCompra" runat="server" placeHolder="Precio de Compra" CssClass="form-control"></asp:TextBox>
                                        
                                     </td>
                                   
                                     <td class="fonts-text">Propietario:</td>
                                     <td>
                                         <asp:TextBox ID="txtPropietario" runat="server" placeHolder="Propietario" CssClass="form-control"></asp:TextBox>
                                     </td>
                                 </tr>
                             </table>





                        </div>
                    </div>
                </div>
         
           </div>
       </div>


        <div class="row">
           <br />
           <br />
           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="panel-group" id="accordion2">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne2" style="background-color:#C0392B!important; color:white;">
                            <h4 class="panel-title">
                                <a href="#">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-wrench"></span>&nbsp &nbsp Datos Mecánicos</p>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-body">
                             <table class="table table-condensed" style="width: 100%;">
                                 <tr>
                                     <td class="fonts-text">No. Llantas:</td>
                                     <td>
                                         <asp:TextBox ID="txtNoLlantas" runat="server" placeHolder="No. Llantas" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Medida:</td>
                                     <td>
                                         <asp:TextBox ID="txtMedida" runat="server" placeHolder="Medida" CssClass="form-control"></asp:TextBox>
                                      
                                     </td>
                                   
                                     <td class="fonts-text">Capacidad:</td>
                                     <td>
                                         <asp:TextBox ID="txtCapacidadLlanta" runat="server" placeHolder="Capacidad" CssClass="form-control"></asp:TextBox>
                                     </td>
                                 </tr>

                               
                                
                             </table>

                        </div>
                    </div>
                </div>
         
           </div>
       </div>


           <div class="row">
           <br />
           <br />
           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="panel-group" id="accordion3">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne3" style="background-color:#C0392B!important; color:white;">
                            <h4 class="panel-title">
                                <a href="#">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-ok"></span>&nbsp &nbsp Datos de Combustible</p>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-body">
                             <table class="table table-condensed" style="width: 100%;">
                                 <tr>
                                     <td class="fonts-text">Combustible:</td>
                                     <td>
                                         <asp:TextBox ID="txtCombustible" runat="server" placeHolder="Combustible" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">No. de Kms. por Litro:</td>
                                     <td>
                                         <asp:TextBox ID="txtNoKmLitros" runat="server" placeHolder="No. de Kms. por Litro" CssClass="form-control"></asp:TextBox>
                                      
                                     </td>
                                   
                                 </tr>

                               
                                  <tr>
                                     <td class="fonts-text">Capacidad:</td>
                                     <td>
                                         <asp:TextBox ID="txtCapacidadCombustible" runat="server" placeHolder="Capacidad" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Rendimiento:</td>
                                     <td>
                                         <asp:TextBox ID="txtRendimiento" runat="server" placeHolder="Rendimiento" CssClass="form-control"></asp:TextBox>
                                      
                                     </td>
                                   
                                 </tr>

                                  <tr>
                                     <td>

                                     </td>
                                     <td>
                                        
                                     </td>
                                     <td>

                                     </td>
                                     <td>
                                         
                                      
                                     </td>
                                   
                                   
                                 
                                 </tr>
                                
                             </table>
                             <div class="col-sm-offset-10">
                                 <asp:Button ID="btnAgregarVehiculo" runat="server" Text="Agregar Vehiculo"  CssClass="btn btn-block btn-sm btn-primary" OnClick="btnAgregarVehiculo_Click"/>
                             </div>
                        </div>
                    </div>
                </div>
         
           </div>
       </div>

   </div>
</asp:Content>
