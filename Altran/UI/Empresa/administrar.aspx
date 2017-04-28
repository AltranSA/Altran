<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="administrar.aspx.cs" Inherits="Altran.UI.Empresa.administrar" %>
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
                               <div class="col-sm-offset-0 col-xs-10 col-sm-10 col-md-10 col-lg-11">
                                    <asp:GridView ID="dgvDatosEmpresa" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" OnRowCommand="dgvDatosEmpresa_RowCommand" DataSourceID="ldsCatEmpresa" 
                                            PageSize="10">
                                                <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                <FooterStyle BackColor="#999999" />
                                                <RowStyle BackColor="White" Font-Size="10" />
                                               <Columns>
                                                   <asp:BoundField DataField="id" HeaderText="identificador" ReadOnly="True" SortExpression="id" />
                                                   <asp:BoundField DataField="strNombre" HeaderText="Empresa" ReadOnly="True" SortExpression="strNombre" />
                                                   <asp:BoundField DataField="strRfc" HeaderText="Razón Social" ReadOnly="True" SortExpression="strRfc" />
                                                   <asp:BoundField DataField="strDireccionFiscal" HeaderText="Dirección" ReadOnly="True" SortExpression="strDireccionFiscal" />
                                                   <asp:TemplateField HeaderText="Editar">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'  CommandName="Editar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Eliminar">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImgEliminar" runat="server" ImageUrl="~/Imagenes/delrecord_16x16.png" CommandArgument='<%#((GridViewRow)Container).RowIndex %>'  CommandName="Eliminar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                               </Columns>
                                            </asp:GridView>
                                </div>
                                 
                            </div>



                        </div>
                    </div>
                </div>
          </div>
        </div>
    </div>
     <!--Configuramos el modal -->
    <div class="modal fade" id="myModalEmpresaAdministra" tabindex="-1" role="dialog" aria-labelledby="myModalL" data-backdrop="static" data-keyboard="false">
                <br />
                <br />
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#C0392B!important; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalL">
                                <asp:Label ID="etTitulo" runat="server" CssClass="fonts-text" Text="Editar Datos de la Empresa"></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <asp:UpdatePanel ID="UpdatePnlDDLEmpresa" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <!--empezamos el diseño del modal -->
                                    <div class="form-inline">
                                        <div class="form-group">
                                            <span class="fonts-text">Nombre Empresa:</span>
                                            <asp:TextBox ID="txtNombreEmpresa" runat="server" CssClass="form-control" placeholder="Nombre de la Empresa" ValidationGroup="btnEditarEmpresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <span class="fonts-text">Razón Social (RFC):</span>
                                            <asp:TextBox ID="txtRazonSocial" runat="server" Text="" placeholder="RFC" CssClass="form-control" ValidationGroup="btnEditarEmpresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <span class="fonts-text">Dirección Fiscal:</span>
                                            <asp:TextBox ID="txtDireccionFiscal" runat="server" Text="" placeholder="Dirección Fiscal" CssClass="form-control" ValidationGroup="btnEditarEmpresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                             <span class="fonts-text">Teléfono:</span>
                                              <asp:TextBox ID="txtTelefono" runat="server" Text="" placeholder="Numero de Telefono" CssClass="form-control" ValidationGroup="btnEditarEmpresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                             <span class="fonts-text">e-mail:</span>
                                            <asp:TextBox ID="txtMail" runat="server" Text="" placeholder="email@ejemplo.com" CssClass="form-control" ValidationGroup="btnEditarEmpresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                             <span class="fonts-text">Numero de Fax:</span>
                                            <asp:TextBox ID="txtNumeroFax" runat="server" Text="" placeholder="Fax" CssClass="form-control" ValidationGroup="btnEditarEmpresa"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <span class="fonts-text">Acción:</span>
                                            <asp:Button ID="BtnEditarEmpresa" runat="server" Text="Editar Empresa" CssClass="btn btn-block btn-sm btn-success" ValidationGroup="btnEditarEmpresa" OnClick="BtnEditarEmpresa_Click" />
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="etId" runat="server" Text="" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            
                                        </div>
                                    </div>
                                    <div class="form-inline">
                                        <div class="form-group">
                                            
                                        </div>
                                    </div>
                                  
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dgvDatosEmpresa" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                            
                    </div>
                         <div class="modal-footer">
                        </div>
                </div>
            </div>
    <!--Termina el Modal-->
    <asp:LinqDataSource ID="ldsCatEmpresa" runat="server" ContextTypeName="Altran.Data.DCAltranDataContext" EntityTypeName="" OrderBy="strNombre" Select="new (id, strNombre, strRfc, strDireccionFiscal)" TableName="CatEmpresas"></asp:LinqDataSource>
    </div>
</asp:Content>
