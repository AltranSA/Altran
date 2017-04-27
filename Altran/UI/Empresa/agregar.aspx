<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agregar.aspx.cs" Inherits="Altran.UI.Empresa.agregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
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
                                    <p class="fonts-text"><span class="glyphicon glyphicon-random"></span>&nbsp &nbsp Datos Empresariales</p>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <table class="table table-condensed" style="width: 100%;">
                                 <tr>
                                     <td class="fonts-text">Nombre de la Empresa:</td>
                                     <td>
                                         <asp:TextBox ID="txtNombre" runat="server" placeHolder="Nombre de la Empresa" CssClass="form-control" ValidationGroup="agregarEmpresa"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Razón Soical (RFC):</td>
                                     <td>
                                         <asp:TextBox ID="txtRazonSocial" runat="server" placeHolder="Razón Social de la Empresa" CssClass="form-control" ValidationGroup="agregarEmpresa"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Dirección Fiscal:</td>
                                     <td>
                                         <asp:TextBox ID="txtDireccionFiscal" runat="server" placeHolder="Dirección Fiscal" CssClass="form-control" ValidationGroup="agregarEmpresa"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="fonts-text">Telefono:</td>
                                     <td>
                                         <asp:TextBox ID="txtTelefono" runat="server" placeholder="Telefono" CssClass="form-control" ValidationGroup="agregarEmpresa"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Fax:</td>
                                     <td>
                                         <asp:TextBox ID="txtFax" runat="server" placeholder="Fax" CssClass="form-control" ValidationGroup="agregarEmpresa"></asp:TextBox>
                                     </td>
                                     <td class="fonts-text">Email:</td>
                                     <td>
                                         <asp:TextBox ID="txtMail"  runat="server" placeholder="E-mail" CssClass="form-control" ValidationGroup="agregarEmpresa"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td>
                                       <asp:Button ID="BtnGuardarEmpresa" runat="server" CssClass="btn btn-lock btn-sm btn-primary" Text="Guardar Empresa" ValidationGroup="agregarEmpresa" OnClick="BtnGuardarEmpresa_Click" />
                                     </td>
                                 </tr>                            
                             </table>
                            </div>
                            <div class="row">
                                <asp:UpdatePanel ID="UpdatePnlDatosEmpresa" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="dgvDatosEmpresa" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%" OnRowCommand="dgvDatosEmpresa_RowCommand">
                                                <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                <FooterStyle BackColor="#999999" />
                                                <RowStyle BackColor="White" Font-Size="10" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Identificador" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Empresa" DataField="strNombre" SortExpression="Empresa" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Razón Social" DataField="strRfc" SortExpression="strRfc" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Dirección Fiscal" DataField="strDireccionFiscal" SortExpression="strDireccionFiscal" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Email" DataField="strEmail" SortExpression="Email" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Fax" DataField="strFax" SortExpression="Fax" ItemStyle-Font-Size="10" />
                                                    <asp:TemplateField HeaderText="Asignar Proyecto">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'  CommandName="Asignar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Eliminar">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImgEliminar" runat="server" ImageUrl="~/Imagenes/delrecord_16x16.png" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'  CommandName="Eliminar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardarEmpresa" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>



                        </div>
                    </div>
                </div>
          </div>
        </div>
    </div>
      <!--Configuramos el modal -->
    <div class="modal fade" id="myModalProyecto" tabindex="-1" role="dialog" aria-labelledby="myModalL" data-backdrop="static"
                data-keyboard="false">
                <br />
                <br />
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#C0392B!important; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalL">
                                <asp:Label ID="etTitulo" runat="server" CssClass="fonts-text" Text="Asignación de Proyectos y Orden de Trabajo"></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <!--empezamos el diseño del modal -->
                            <div class="form-inline">
                                <div class="form-group">
                                    <span class="fonts-text">Nombre Empresa:</span>
                                    <asp:UpdatePanel ID="UpdatePnlDDLEmpresa" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlNombreEmpresa" runat="server" CssClass="form-control" AppendDataBoundItems="True"></asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="dgvDatosEmpresa" EventName="RowCommand" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    

                                </div>
                                <div class="form-group">
                                    <span class="fonts-text">Nombre del Proyecto:</span>
                                    <asp:TextBox ID="txtNombreProyecto" runat="server" Text="" placeholder="Nombre del Proyecto" CssClass="form-control" ValidationGroup="btnAsignarMarcaModelo"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                <span class="fonts-text">Orden de Trabajo:</span>
                                <asp:TextBox ID="txtOrdenTrabajo" runat="server" Text="" placeholder="Orden de Trabajo" CssClass="form-control" ValidationGroup="btnAsignarMarcaModelo"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <span class="fonts-text">Acción:</span>
                                    <asp:Button ID="BtnAsignarProyectoEmpresa" runat="server" Text="Guardar" CssClass="btn btn-block btn-sm btn-primary" ValidationGroup="btnAsignarMarcaModelo" OnClick="BtnAsignarProyectoEmpresa_Click" />
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="rfvNombreProyecto" runat="server" ErrorMessage="El Nombre de la Empresa es Requerido" ForeColor="Red" ControlToValidate="txtNombreProyecto" ValidationGroup="btnAsignarMarcaModelo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="rfvOrdenTrabajo" runat="server" ErrorMessage="La Orden de Trabajo es Requerido" ForeColor="Red" ControlToValidate="txtOrdenTrabajo" ValidationGroup="btnAsignarMarcaModelo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
    <!--Termina el Modal-->
</asp:Content>
