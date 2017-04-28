<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agregar.aspx.cs" Inherits="Altran.UI.Bitacora.agregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: 12px;
            font-family: 'Roboto', sans-serif;
            width: 208px;
        }
        .auto-style2 {
            font-size: 12px;
            font-family: 'Roboto', sans-serif;
            width: 152px;
        }
        .auto-style3 {
            font-size: 12px;
            font-family: 'Roboto', sans-serif;
            width: 78px;
        }
        .auto-style4 {
            font-size: 12px;
            font-family: 'Roboto', sans-serif;
            height: 41px;
        }
        .auto-style5 {
            height: 41px;
        }
    </style>
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
                                         <br />
                                     </td>
                                    
                                     <td>
                                         <asp:Button ID="btnConsultarVehiculo" runat="server" CssClass="btn btn-block btn-sm btn-primary" Text="Consultar" OnClick="btnConsultarVehiculo_Click"  />
                                        
                                     </td>
                                   
                                     
                                 </tr>

                               
                                 <tr>
                                     <td class="fonts-text">Placas:</td>
                                     <td>
                                         <asp:TextBox ID="txtPlacas" runat="server" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Marca:</td>
                                     <td>
                                         <asp:TextBox ID="txtMarcas" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                     </td>
                                   
                                     <td class="fonts-text">Modelo:</td>
                                     <td>
                                         <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control"></asp:TextBox>
                                     </td>
                                 </tr>


                                 <tr>
                                     <td class="fonts-text">Año:</td>
                                     <td>
                                          <asp:TextBox ID="txtAño" runat="server"  CssClass="form-control"></asp:TextBox>
                                     </td>
                                    
                                 </tr>
                             </table>





                        </div>
                    </div>
                </div>
         
           </div>
       </div>



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
                                    <p class="fonts-text"><span class="glyphicon glyphicon-random"></span>&nbsp &nbsp </p>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-body">
                             <table class="table table-condensed" style="width: 100%;">
                                                                
                                 <tr>
                                     <td class="auto-style3">Fecha:</td>
                                     <td>
                                         <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                     </td>
                                     <td class="auto-style2">Clasificacion:</td>
                                     <td>
                                         <asp:TextBox ID="txtClasificacion" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                     </td>
                                   
                                     <td class="auto-style1">Kilometro al Momento:</td>
                                     <td>
                                         <asp:TextBox ID="txtKilometrosAlMomento" runat="server" CssClass="form-control"></asp:TextBox>
                                     </td>
                                 </tr>

                                  <tr>
                                     <td class="auto-style3">Mecanico:</td>
                                     <td>
                                         <asp:TextBox ID="txtMecanico" runat="server" CssClass="form-control"></asp:TextBox>
                                     </td>
                                     <td class="auto-style2">Costo:</td>
                                     <td>
                                         <asp:TextBox ID="txtCosto" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                     </td>
                                   
                                     <td class="auto-style1">Fecha del proximo mantenimiento:</td>
                                     <td>
                                         <asp:TextBox ID="txtFechaProximoMantenimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                     </td>
                                 </tr>

                                 
                                  <tr>
                                     <td class="fonts-text">Trabajo y/o servicio realizado:</td>
                                     <td colspan="5">
                                          <asp:TextBox ID="txtTrabajo" runat="server"  CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                     </td>
                                    
                                 </tr>

                                  <tr>
                                     <td class="auto-style4">Notas:</td>
                                     <td colspan="5" class="auto-style5">
                                          <asp:TextBox ID="txtNotas" runat="server"  CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                     &nbsp;</td>
                                    
                                 </tr>


                                 <tr>
                                     <td class="auto-style4"></td>
                                     <td class="auto-style5">
                                          <asp:Button ID="btnAgregarBitacoraMnatenimiento" runat="server" CssClass="btn btn-block btn-sm btn-success" Text="Agregar" OnClick="btnAgregarBitacoraMnatenimiento_Click"  />
                                     </td>
                                    
                                 </tr>



                             </table>


                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                                               <asp:UpdatePanel ID="UpdatePnlDatosBitacorasMantenimiento" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="dgvDatosBitacoraMantenimiento" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%">
                                                            <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                            <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                            <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                            <FooterStyle BackColor="#999999" />
                                                            <RowStyle BackColor="White" Font-Size="10" />
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Fecha" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Clasificacion" DataField="dteFecha" SortExpression="Fecha" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Kilometraje al momento" DataField="intNumeroCuenta" SortExpression="Kilometraje al momento" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Trabajo" DataField="intNumeroTarjeta" SortExpression="Trabajo" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Mecanico" DataField="intNumeroTarjeta" SortExpression="Mecanico" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Costo" DataField="intNumeroTarjeta" SortExpression="Costo" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Fecha proximo mantenimiento" DataField="intNumeroTarjeta" SortExpression="Fecha Proximo Mantenimiento" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Notas" DataField="intNumeroTarjeta" SortExpression="Notas" ItemStyle-Font-Size="10" />
                                                                <asp:TemplateField HeaderText="Editar">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandName="Editar" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnAgregarBitacoraMnatenimiento" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>

                           <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <asp:UpdatePanel ID="UpdatePnlDatosTarjetaBancaria" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="dgvDatosTarjetaBancaria" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%">
                                                            <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                            <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                            <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                            <FooterStyle BackColor="#999999" />
                                                            <RowStyle BackColor="White" Font-Size="10" />
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Identificador" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Fecha" DataField="dteFecha" SortExpression="Fecha" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Número de Cuenta" DataField="intNumeroCuenta" SortExpression="Número de Cuenta" ItemStyle-Font-Size="10" />
                                                                <asp:BoundField HeaderText="Número de Tarjeta" DataField="intNumeroTarjeta" SortExpression="Número de Tarjeta" ItemStyle-Font-Size="10" />
                                                                <asp:TemplateField HeaderText="Editar">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandName="Editar" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnAgregarTarjeta" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>--%>


                        </div>
                    </div>
                </div>
         
           </div>
       </div>







     </div>
     </div>
</asp:Content>