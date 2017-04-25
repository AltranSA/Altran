<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tarjetavehicular.aspx.cs" Inherits="Altran.UI.Vehiculo.tarjetavehicular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <%--<script>
        $(document).ready(function () {

            $('#mensajeCliente').attr("style.display='none'");
            $('#mensajeErrMarcaVahiculo').attr("style.display='none'");

            $("#<%=BtnAgregarTipoVehiculo.ClientID %>").click(function () {
                var tipoVehiculo = $("#<%= txtTipoVehiculo.Text %>");
                if (tipoVehiculo.length == 0) {
                    $('#mensajeCliente').show("slow");
                }
                else {
                    $("#mensajeCliente").hide("slow");
                }
            });

            $("#<%=BtnAgregarMarca.ClientID %>").click(function () {
                var marcaVehiculo = $("#<%= txtMarca.Text%>");
                if (marcaVehiculo.length == 0) {
                    $('#mensajeErrMarcaVahiculo').show("slow");
                }
                else
                {
                    $('#mensajeErrMarcaVahiculo').hide("slow");
                }
            });


        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <br />
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                 <br />
             <div class="panel-group" id="accordion" >
                <div class="panel panel-default">
                   <div class="panel-heading" role="tab" id="headingOne" style="background-color:#C0392B!important; color:white;">
                            <h4 class="panel-title">
                                <a href="#">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-home"></span>&nbsp Tarjeta Vehicular</p>
                                </a>
                            </h4>
                        </div>
                   <div class="panel-body">
                       <div class="row">
                           <!-- Nav tabs -->
                           <ul class="nav nav-tabs" role="tablist">
                               <li role="presentation" class="active"><a href="#vehiculo" aria-controls="vehiculo" role="tab" data-toggle="tab" class="fonts-text">
                                   <span class="glyphicon glyphicon-home"></span>&nbsp Tipo de Vehiculo</a></li>
                               <li role="presentation"><a href="#marca" aria-controls="marca" role="tab" data-toggle="tab" class="fonts-text">
                                  <span class="glyphicon glyphicon-pencil"></span>&nbsp Marca</a></li>
                               <li role="presentation"><a href="#modelo" aria-controls="modelo" role="tab" data-toggle="tab" class="fonts-text">
                               <span class="glyphicon glyphicon-pushpin"></span>&nbsp Modelo</a></li>
                               
                           </ul>

                           <!-- Tab panes -->
                           <div class="tab-content">
                               <div role="tabpanel" class="tab-pane active" id="vehiculo">
                                   <div class="container-fluid">
                                       <div class="col-md-offset-0 col-md-8">
                                           <br />
                                           <div class="form-inline">
                                               <div class="form-group">
                                                  <asp:TextBox ID="txtTipoVehiculo" runat="server" CssClass="form-control" placeholder="Tipo de Vehiculo"  ValidationGroup="VgbtnAgregarTipoVehiculo"></asp:TextBox>
                                                </div>
                                               <div class="form-group">
                                                   <asp:Button ID="BtnAgregarTipoVehiculo" runat="server" Text="Agregar Vehiculo" CssClass="btn btn-block btn-sm btn-primary" ValidationGroup="VgbtnAgregarTipoVehiculo" OnClick="BtnAgregarTipoVehiculo_Click"  />
                                               </div>
                                               <div class="form-group">
                                                   <asp:RequiredFieldValidator ID="rfvTipoVehiculo" runat="server" ErrorMessage="Valor Requerido" ForeColor="Red" ControlToValidate="txtTipoVehiculo" ValidationGroup="VgbtnAgregarTipoVehiculo"></asp:RequiredFieldValidator>
                                               </div>
                                               <div class="form-group">
                                                    <span id="mensajeCliente" style="border:solid 1px Red; display:none;" class="alert alert-danger fonts-text">Deberás Llenar el Campo de Forma Adecuada</span>
                                               </div>
                                           </div>
                                       </div>
                                                                            
                                       <div class="row">
                                           <div class="col-md-offset-1 col-sm-9 col-md-9 col-lg-9">
                                               <asp:UpdatePanel ID="UpdatePnlAgregarTipoVehiculo" runat="server" UpdateMode="Conditional">
                                                   <ContentTemplate>
                                                       <br />
                                                       <asp:GridView ID="dgvDatosVehiculares" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%">
                                                           <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                           <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                           <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                           <FooterStyle BackColor="#999999" />
                                                           <RowStyle BackColor="White" Font-Size="10" />
                                                           <Columns>
                                                               <asp:BoundField HeaderText="Identificador" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                               <asp:BoundField HeaderText="Tipo de Vehiculo" DataField="strValor" SortExpression="strValor" ItemStyle-Font-Size="10" />
                                                               <asp:TemplateField HeaderText="Editar">
                                                                   <ItemTemplate>
                                                                       <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandName="Editar"  ImageAlign="Middle"/>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>

                                                           </Columns>
                                                       </asp:GridView>
                                                   </ContentTemplate>
                                                   <Triggers>
                                                       <asp:AsyncPostBackTrigger ControlID="BtnAgregarTipoVehiculo" EventName="Click" />
                                                   </Triggers>
                                               </asp:UpdatePanel>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                               <div role="tabpanel" class="tab-pane" id="marca">
                                   <div class="col-md-offset-0 col-md-8">
                                   <br />
                                   <div class="form-inline">
                                               <div class="form-group">
                                                  <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" placeholder="Marca del Vehiculo"  ValidationGroup="VgbtnAgregarMarca"></asp:TextBox>
                                               </div>
                                               <div class="form-group">
                                                   <asp:Button ID="BtnAgregarMarca" runat="server" Text="Agregar Marca" CssClass="btn btn-block btn-sm btn-primary" ValidationGroup="VgbtnAgregarMarca" OnClick="BtnAgregarMarca_Click" />
                                               </div>
                                               <div class="form-group">
                                                   <asp:Button ID="BtnVincularMarcaModelo" runat="server" Text="Asignar Modelo"  CssClass="btn btn-block btn-sm btn-success" OnClick="BtnVincularMarcaModelo_Click" />
                                               </div>
                                               <div class="form-group">
                                                   <asp:RequiredFieldValidator ID="rfvTxtMarca" runat="server" ErrorMessage="Valor Requerido" ForeColor="Red" ControlToValidate="txtMarca" ValidationGroup="VgbtnAgregarMarca"></asp:RequiredFieldValidator>
                                               </div>
                                               <div class="form-group">
                                                    <span id="mensajeErrMarcaVahiculo" style="border:solid 1px Red; display:none;" class="alert alert-danger fonts-text">Deberás Llenar el Campo de Forma Adecuada</span>
                                               </div>
                                           </div>
                                   </div>
                                   <div class="row">
                                           <div class="col-md-offset-1 col-sm-9 col-md-9 col-lg-9">
                                               <asp:UpdatePanel ID="UpdatePnlMarcaVehiculo" runat="server" UpdateMode="Conditional">
                                                   <ContentTemplate>
                                                       <br />
                                                       <asp:GridView ID="dgvDatosMarcaVehiculo" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%" OnRowCommand="dgvDatosMarcaVehiculo_RowCommand">
                                                           <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                           <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                           <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                           <FooterStyle BackColor="#999999" />
                                                           <RowStyle BackColor="White" Font-Size="10" />
                                                           <Columns>
                                                               <asp:BoundField HeaderText="Identificador" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                               <asp:BoundField HeaderText="Marca de Vehiculo" DataField="strValor" SortExpression="strValor" ItemStyle-Font-Size="10" />
                                                               <asp:TemplateField HeaderText="Editar">
                                                                   <ItemTemplate>
                                                                       <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandName="Editar" CommandArgument='<%#((GridViewRow)Container).RowIndex %>' ImageAlign="Middle"/>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="Eliminar">
                                                                   <ItemTemplate>
                                                                       <asp:ImageButton ID="ImgEliminar" runat="server" ImageUrl="~/Imagenes/delrecord_16x16.png" CommandName="Eliminar" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'  ImageAlign="Middle" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                           </Columns>
                                                       </asp:GridView>
                                                   </ContentTemplate>
                                                   <Triggers>
                                                       <asp:AsyncPostBackTrigger ControlID="BtnAgregarMarca" EventName="Click" />
                                                   </Triggers>
                                               </asp:UpdatePanel>
                                           </div>
                                       </div>

                               </div>
                               <div role="tabpanel" class="tab-pane" id="modelo">
                                   <div class="col-md-offset-0 col-md-8">
                                     <br />
                                       <div class="form-inline">
                                              <div class="form-group">
                                                  <asp:DropDownList ID="ddlMarcaVehiculo" runat="server" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList> 
                                              </div>
                                               <div class="form-group">
                                                  <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" placeholder="Modelo del Vehiculo"  ValidationGroup="VgbtnAgregarModelo"></asp:TextBox>
                                               </div>
                                               <div class="form-group">
                                                   <asp:Button ID="BtnAgregarModelo" runat="server" Text="Agregar Modelo" CssClass="btn btn-block btn-sm btn-primary" ValidationGroup="VgbtnAgregarModelo"   />
                                               </div>
                                               <div class="form-group">
                                                   <asp:RequiredFieldValidator ID="rfvModelo" runat="server" ErrorMessage="Valor Requerido" ForeColor="Red" ControlToValidate="txtModelo" ValidationGroup="VgbtnAgregarModelo"></asp:RequiredFieldValidator>
                                               </div>
                                           </div>
                                   </div>
                               </div>
                               
                           </div>
                       </div>

                        
                   </div>
                </div>
               </div>
             </div>
        </div>
    </div>

    <!--Configuramos el modal -->
    <div class="modal fade" id="myModalVehiculo" tabindex="-1" role="dialog" aria-labelledby="myModalL" data-backdrop="static"
                data-keyboard="false">
                <br />
                <br />
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#C0392B!important; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalL">
                                <asp:Label ID="etTitulo" runat="server" CssClass="fonts-text" Text="Asignación de Vehículos: Marca y Modelo"></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <!--empezamos el diseño del modal -->
                            <div class="form-inline">
                                <div class="form-group">
                                    <span class="fonts-text">Marca:</span>
                                    <asp:DropDownList ID="ddlMarcaVehiculoAsignar" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <span class="fonts-text">Modelo:</span>
                                    <asp:TextBox ID="txtModeloAsignar" runat="server" Text="" placeholder="Modelo del Vehículo" CssClass="form-control" ValidationGroup="btnAsignarMarcaModelo"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <span class="fonts-text">Acción:</span>
                                    <asp:Button ID="BtnAsignarMarcaModelo" runat="server" Text="Guardar" CssClass="btn btn-block btn-sm btn-primary" ValidationGroup="btnAsignarMarcaModelo" />
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="rfvModeloAsignar" runat="server" ErrorMessage="Valor Requerido" ForeColor="Red" ControlToValidate="txtModeloAsignar" ValidationGroup="btnAsignarMarcaModelo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>
