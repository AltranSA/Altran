<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="agregar.aspx.cs" Inherits="Altran.UI.Empleado.agregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
  <script>
      $(document).ready(function () {

          $('#mensajeCliente').attr("style.display='none'");

          $("#<%=BtnGuardar.ClientID %>").click(function () {
              //event.preventDefault();
              var valor = $('#<%=ddlSexo.ClientID%>').val();
              var valor2= $('#<%= ddlNacionalidad.ClientID%>').val();
              if (valor == "Seleccionar" || valor2 == "Seleccionar") {
                  $('#mensajeCliente').show("slow");
                 
              }
              else
              {
                  $("#mensajeCliente").hide("slow");
              }
          });
              
          $("#<%=BtnAgregarTarjeta.ClientID %>").click(function () {

              var banco = $('#<%=ddlBancos.ClientID%>').val();
              var movimientos = $('#<%= ddlMovimientos.ClientID%>').val();
              if (banco == "Seleccionar" && movimientos == "Seleccionar")
              {
                  $('#msnTarjetaBancaria').show("slow");
              }
              if (banco == "Seleccionar" || movimientos == "Seleccionar")
              {
                  $('#msnTarjetaBancaria').show("slow");
              }
              else {
                  $("#msnTarjetaBancaria").hide("slow");
              }

          });

     
      });
  </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="container">
        <div class="row">
            <br />
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne" style="background-color:#C0392B!important; color:white;">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-home"></span>Generales</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="row">
                                    <table class="table table-condensed" style="width: 100%;">
                                        <tr>
                                            <td class="fonts-text">Nombre:</td>
                                            <td>
                                                <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox></td>
                                            <td class="fonts-text">A. Paterno:</td>
                                            <td>
                                                <asp:TextBox ID="txtApaterno" runat="server" placeholder="Apellido Paterno" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox>
                                            </td>
                                            <td class="fonts-text">A. Materno</td>
                                            <td>
                                                <asp:TextBox ID="txtAmaterno" runat="server" placeholder="Apellido Materno" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox>
                                            </td>
                                            <td class="fonts-text">Edad:</td>
                                            <td>
                                                <asp:TextBox ID="txtEdad" runat="server" placeholder="Edad" CssClass="form-control" Width="60" ValidationGroup="validarAccionGuardar"></asp:TextBox>
                                                
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="fonts-text">Fecha:</td>
                                            <td>
                                                <asp:TextBox ID="dteFechaNacimiento" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="extenderdteFechaNacimiento" runat="server" TargetControlID="dteFechaNacimiento" />
                                            </td>
                                            <td class="fonts-text">Sexo:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar">
                                                    <asp:ListItem>Seleccionar</asp:ListItem>
                                                    <asp:ListItem>Masculino</asp:ListItem>
                                                    <asp:ListItem>Femenino</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td class="fonts-text">Tipo de Sangre:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlSangre" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar">
                                                  </asp:DropDownList>

                                            </td>
                                            <td class="fonts-text">Estatura:</td>
                                            <td>
                                                <asp:TextBox ID="txtEstatura" runat="server" CssClass="form-control" Width="60" ValidationGroup="validarAccionGuardar"></asp:TextBox></td>

                                        </tr>
                                        <tr>
                                            <td class="fonts-text">Peso:</td>
                                            <td>
                                                <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" Width="60" ValidationGroup="validarAccionGuardar"></asp:TextBox></td>
                                            <td class="fonts-text">Alergias:</td>
                                            <td>
                                                <asp:TextBox ID="txtAlergias" runat="server" CssClass="form-control" placeholder="Alergias" ValidationGroup="validarAccionGuardar"></asp:TextBox></td>
                                            <td class="fonts-text">Rfc:</td>
                                            <td>
                                                <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox>
                                            </td>
                                            <td class="fonts-text">Curp:</td>
                                            <td>
                                                <asp:TextBox ID="txtCurp" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="fonts-text">NSS:</td>
                                            <td>
                                                <asp:TextBox ID="txtNss" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar"></asp:TextBox></td>
                                            <td class="fonts-text">Estado Civil:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlEstadoCivil" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar">
                                                    <asp:ListItem>Seleccionar</asp:ListItem>
                                                    <asp:ListItem>Soltero</asp:ListItem>
                                                    <asp:ListItem>Casado</asp:ListItem>
                                                    <asp:ListItem>Divorciado</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td class="fonts-text">Nacionalidad:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-control" ValidationGroup="validarAccionGuardar">
                                                    
                                                </asp:DropDownList></td>
                                            <td>
                                                <asp:Button ID="BtnGuardar" runat="server" CssClass="btn btn-lock btn-sm btn-primary" Text="Guardar" OnClick="BtnGuardar_Click" />
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePnlGenerales" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel ID="PnlMensaje" runat="server" Visible="false">
                                                            <img alt="" src="../../Imagenes/checked.png" width="30" height="30"/>
                                                        </asp:Panel>
                                                     </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="BtnGuardar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>  
                             
                                           </td>
                                        </tr>
                                        </table>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                        <span id="mensajeCliente" style="border:solid 1px Red; display:none;" class="alert alert-danger fonts-text">Deberás Seleccionar todos las Opciones</span>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-list-alt"></span>Dirección</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <table class="table table-condensed" style="width: 100%;">
                                    <tr>
                                        <td class="fonts-text">Calle:</td>
                                        <td>
                                            <asp:TextBox ID="txtCalle" runat="server" placeholder="Calle" CssClass="form-control"></asp:TextBox>

                                        </td>
                                        <td class="fonts-text">No. Interior:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNoInterior" runat="server" placeholder="Num. Int." CssClass="form-control" Width="100"></asp:TextBox>
                                        </td>
                                        <td class="fonts-text">Numero Exterior:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNumeroExterior" runat="server" placeholder="Num. Ext." Width="100" CssClass="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonts-text">País:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlPais" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlPais_SelectedIndexChanged"></asp:DropDownList>
                                                
                                       </td>
                                        <td class="fonts-text">Estado:</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePnlEstado" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" Enabled="false" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlPais" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            
                                        </td>
                                        <td class="fonts-text">Municipio:</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePnlMunicipio" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="True"  Enabled="false" OnSelectedIndexChanged="ddlMunicipio_SelectedIndexChanged"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlEstado" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonts-text">Colonia:</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePnlColonia" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlColonia" runat="server" CssClass="form-control" Enabled="false" AppendDataBoundItems="true"
                                                 AutoPostBack="true" OnSelectedIndexChanged="ddlColonia_SelectedIndexChanged"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlMunicipio" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            
                                                
                                        </td>
                                        <td class="fonts-text">Código Postal:</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePnlCodigoPostal" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlCodigoPostal" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCodigoPostal_SelectedIndexChanged" Enabled="false">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlColonia" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            
                                        </td>
                                        <td class="font fonts-text">Referencias:</td>
                                        <td>
                                            <asp:TextBox ID="txtReferencias" runat="server" placeholder="Referencias" CssClass="form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><asp:Button ID="BtnGuardarDireccion" runat="server" CssClass="btn btn-lock btn-sm btn-primary" Text="Guardar" /></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-earphone"></span>Contacto</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="fonts-text">Telefono de Casa:</td>
                                        <td>
                                            <asp:TextBox ID="txtTelefonoCasa" runat="server" CssClass="form-control" placeholder="Telefono "></asp:TextBox></td>
                                        <td class="fonts-text">Celular:</td>
                                        <td>
                                            <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control" placeholder="Celular"></asp:TextBox>

                                        </td>
                                        <td class="fonts-text">Correo Electronico:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" placeholder="email@correo.com"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fonts-text">Campamento:</td>
                                        <td>
                                           <%-- <asp:DropDownList ID="ddlCampamento" runat="server" CssClass="form-control" placeholder="Nombre Campamento" Enabled="false">
                                                <asp:ListItem>Seleccionar
                                                    </asp:ListItem>
                                                    <asp:ListItem>Soltero</asp:ListItem>
                                                    <asp:ListItem>Casado</asp:ListItem>
                                                    <asp:ListItem>Divorciado</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </td>
                                        <td class="fonts-text"><span class="glyphicon glyphicon-user"></span>En Caso de Accidente Avisar a:</td>
                                    </tr>
                                    <tr>
                                        <td class="fonts-text">Nombre:</td>
                                        <td>
                                            <asp:TextBox ID="txtNombreFamiliar" runat="server" CssClass="form-control" placeholder="Nombre del Familiar"></asp:TextBox>
                                        </td>
                                        <td class="fonts-text">Parentesco:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlParentesco" runat="server" CssClass="form-control" placeholder="Nombre Campamento">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="fonts-text">Telefono:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTelefonoFamiliar" runat="server" CssClass="form-control"></asp:TextBox>
                                                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><asp:Button ID="BtnGaurdarDatosContacto" runat="server" Text="Agregar" CssClass="btn btn-lock btn-sm btn-primary" /></td>
                                    </tr>
                                </table>
                                 
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingCuatro">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseCuatro" aria-expanded="false" aria-controls="collapseCuatro">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-wrench"></span>Laborales</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseCuatro" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCuatro">
                            <div class="panel-body">
                                 <table style="width: 100%;">
                                     <tr>
                                         <td><asp:Label ID="etPuesto" runat="server" Text="Puesto:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtPuesto" runat="server" CssClass="form-control" placeholder="Puesto del Empleado"></asp:TextBox></td>
                                         <td><asp:Label ID="etEmpresa" runat="server" Text="Empresa:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtEmpresa" runat="server" CssClass="form-control" placeholder="Nombre de la Empresa"></asp:TextBox></td>
                                         <td><asp:Label ID="etDepartamento" runat="server" Text="Departamento:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtDepartamento" runat="server" CssClass="form-control" placeholder="Nombre del Departamento"></asp:TextBox></td>
                                     </tr>
                                     <tr>
                                         <td><asp:Label ID="etFechaEntrada" runat="server" Text="Fecha Entrada:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtFechaEntrada" runat="server" CssClass="form-control" placeholder="01/01/01" Width="100"></asp:TextBox>
                                             <ajaxToolkit:CalendarExtender ID="dteFechaEntrada" TargetControlID="txtFechaEntrada" runat="server" />
                                         </td>
                                         <td><asp:Label ID="etSueldoInicial" runat="server" Text="Sueldo Inicial:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtSueldoInicial" runat="server" CssClass="form-control" placeholder="Sueldo Inicial"></asp:TextBox></td>
                                         <td><asp:Label ID="etDireccionLaboral" runat="server" Text="Dirección:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtDireccionLaboral" runat="server" CssClass="form-control" placeholder="Dirección Laboral"></asp:TextBox></td>
                                     </tr>
                                     <tr>
                                         <td><asp:Label ID="etTelefonoLaboral" runat="server" Text="Telefono:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtTelefonoLaboral" runat="server" CssClass="form-control" placeholder="Telefono Laboral"></asp:TextBox></td>

                                         <td><asp:Label ID="etJefeInmediato" runat="server" Text="Jefe Inmediato:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtJefeInmediato" runat="server" CssClass="form-control" placeholder="Jefe Inmediato"></asp:TextBox></td>

                                         <td><asp:Label ID="etSueldoFinal" runat="server" Text="Sueldo Final:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtSueldoFinal" runat="server" CssClass="form-control" placeholder="Sueldo Final"></asp:TextBox></td>

                                     </tr>

                                     <tr>
                                         <td><asp:Label ID="etFechaSalida" runat="server" Text="Fecha Salida:" CssClass="fonts-text" ></asp:Label></td>
                                         <td><asp:TextBox ID="txtFechaSalida" runat="server" CssClass="form-control" Width="100"></asp:TextBox>
                                             <ajaxToolkit:CalendarExtender ID="dteFechaSalida" TargetControlID="txtFechaSalida" runat="server" />
                                         </td>
                                         <td><asp:Label ID="etMotivoSalida" runat="server" Text="Motivo Salida:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:TextBox ID="txtMotivoSalida" runat="server" CssClass="form-control" placeholder="Motivos de su Salida"></asp:TextBox></td>
                                         <td>
                                             <asp:Label ID="etHerramientas" runat="server" Text="Herramientas:" CssClass="fonts-text"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="txtHerramientas" runat="server" CssClass="form-control"></asp:TextBox>
                                         </td>
                                     </tr>
                                     
                                </table>
                                <asp:UpdatePanel ID="UpdatePnlBotonAccionLaborales" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="col-lg-offset-9 col-lg-3">
                                            
                                            <asp:Panel ID="PnlBotonAgregarAccion" runat="server" Visible="false">
                                                <asp:Button ID="BtnAgregarDatosLaborales" runat="server" Text="Agregar" CssClass="btn btn-lock btn-sm btn-primary" OnClick="BtnAgregarDatosLaborales_Click" />
                                            </asp:Panel>
                                            <br />
                                        </div>
                                    </ContentTemplate>
                                     <triggers>
                                      <asp:AsyncPostBackTrigger ControlID="BtnGuardar" EventName="Click" />
                                </triggers>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpdatePnlGridDatosLaborales" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:UpdateProgress ID="UpdateProgresDatosLaborales" runat="server" AssociatedUpdatePanelID="UpdatePnlGridDatosLaborales">
                                            <ProgressTemplate>
                                                <asp:Image ID="ImgLoader" runat="server" ImageUrl="~/Imagenes/loader.gif" />
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <br />
                                            <asp:GridView ID="dgvDatosLaborales" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%">
                                                <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                <FooterStyle BackColor="#999999" />
                                                <RowStyle BackColor="White" Font-Size="10" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Identificador" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Puesto" DataField="strPuesto" SortExpression="Puesto" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Empresa" DataField="strEmpresa" SortExpression="Empresa" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Departamento" DataField="strDepartamento" SortExpression="Materno" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Fecha Entrada" DataField="dteFechaEntrada" SortExpression="Fecha" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Salario Inicial" DataField="dceSalarioInicial" SortExpression="salario" ItemStyle-Font-Size="10" />
                                                    <asp:TemplateField HeaderText="Editar">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandName="Editar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnAgregarDatosLaborales" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                               
                            </div>
                        </div>


                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingEscolares">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEscolares" aria-expanded="false" aria-controls="collapseEscolares">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-book"></span>Escolares</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseEscolares" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEscolares">
                            <div class="panel-body">
                                <table style="width: 100%;">
                                <tr>
                                    <td><asp:Label ID="etInstitucion" runat="server" Text="Institución:" CssClass="fonts-text"></asp:Label></td>
                                    <td><asp:TextBox ID="txtInstitucion" runat="server" CssClass="form-control" placeholder="Nombre de la Institución"></asp:TextBox></td>
                                    <td><asp:Label ID="etDireccionEscolar" runat="server" Text="Dirección:" CssClass="fonts-text"></asp:Label></td>
                                    <td><asp:TextBox ID="txtDireccionEscolar" runat="server" CssClass="form-control" placeholder="Dirección Escolar"></asp:TextBox></td>
                                    <td><asp:Label ID="etNivelEscolar" runat="server" Text="Nivel Escolar:" CssClass="fonts-text"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddlNivelEscolar" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="etProfesion" runat="server" Text="Profesión:" CssClass="fonts-text"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddlEscolarProfesion" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </td>
                                    <td><asp:Label ID="etEstatusEscolar" runat="server" Text="Estatus Escolar:" CssClass="fonts-text"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddlEscolarEstatus" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </td>
                                    <td><asp:Label ID="etDocumentoCertifica" runat="server" Text="Documento Certifica:" CssClass="fonts-text"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddlEscolaresDocumentoCertifica" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="etFolio" runat="server" Text="Folio:" CssClass="fonts-text"></asp:Label></td>
                                    <td><asp:TextBox ID="txtFolio" runat="server" CssClass="form-control" placeholder="Folio" Width="100"></asp:TextBox></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePnlBtnAgregarDatosEscolares" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnAgregarDatosEscolares" runat="server" CssClass="btn btn-block btn-sm btn-primary" Text="Agregar" Visible="false" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="BtnGuardar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        
                                    </td>
                                </tr>
                                </table>
                            </div>
                        </div>


                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingBancarios">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseBancarios" aria-expanded="false" aria-controls="collapseBancarios">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-bold"></span>Bancarios</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseBancarios" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBancarios">
                            <div class="panel-body">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Tarjetas Bancarias</a></li>
                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Beneficiarios</a></li>
                                  
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td class="fonts-text">Fecha:</td>
                                                        <td>
                                                            <asp:TextBox ID="dteFechaTarjetaBancaria" runat="server" CssClass="form-control" Width="100" ValidationGroup="btnAgregarTarjetaBancaria"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender ID="dteTarjetaBancariaExt" runat="server" TargetControlID="dteFechaTarjetaBancaria" />
                                                            
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="rfvFechaTarjetaBancaria" runat="server" ErrorMessage="*" CssClass="validation-error" ControlToValidate="dteFechaTarjetaBancaria" ValidationGroup="btnAgregarTarjetaBancaria" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="fonts-text">Banco:</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlBancos" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBancos_SelectedIndexChanged"></asp:DropDownList>
                                                        </td>
                                                        <td class="fonts-text">No. de Cuenta:</td>
                                                        <td>
                                                            <asp:TextBox ID="txtNumeroCuenta" runat="server" CssClass="form-control" placeholder="Numero de Cuenta" ValidationGroup="btnAgregarTarjetaBancaria"></asp:TextBox>

                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="rfvNumeroCuentaTarjetaBancaria" runat="server" ErrorMessage="*" CssClass="validation-error" ValidationGroup="btnAgregarTarjetaBancaria" ForeColor="Red" ControlToValidate="txtNumeroCuenta"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="fonts-text">Movimiento:</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlMovimientos" runat="server" CssClass="form-control" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlMovimientos_SelectedIndexChanged"></asp:DropDownList>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                       
                                                        <td class="fonts-text">No. de Tarjeta:</td>
                                                        <td>
                                                            <asp:TextBox ID="txtNumeroTarjeta" runat="server" CssClass="form-control" placeholder="Numero de Tarjeta" ValidationGroup="btnAgregarTarjetaBancaria"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="rfvNumeroTarjetaBancaria" runat="server" ErrorMessage="*" CssClass="validation-error" ControlToValidate="txtNumeroTarjeta" ValidationGroup="btnAgregarTarjetaBancaria" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <asp:Button ID="BtnAgregarTarjeta" runat="server" Text="Agregar" CssClass="btn btn-block btn-sm btn-primary" OnClick="BtnAgregarTarjeta_Click" ValidationGroup="btnAgregarTarjetaBancaria" />
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            
                                            <div class="col-xs-offset-2 col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                                <p class="fonts-title"><strong>Datos Bancarios:</strong><span id="msnTarjetaBancaria" style="border:solid 1px Red; display:none;" class="alert alert-danger fonts-text">Selecciona las opciones correctas</span></p>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="profile">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <br />
                                              <table style="width: 100%;">
                                                  <tr>
                                                      <td class="fonts-text">
                                                          Nombre:
                                                      </td>
                                                      <td>
                                                          <asp:TextBox ID="txtNombreBeneficiario" runat="server" placeholder="Nombre del Beneficiario" CssClass="form-control" ></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">A. Paterno:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtApaternoBeneficiario" runat="server" CssClass="form-control" placeholder="Apellido Paterno"></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">A. Materno:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtAMaternoBeneficiario" runat="server" CssClass="form-control" placeholder="Apellido Materno"></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">Parentesco:</td>
                                                      <td>
                                                          <asp:DropDownList ID="ddlParentescoBeneficiario" runat="server" CssClass="form-control"></asp:DropDownList>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td class="fonts-text">Fecha Nacimiento:</td>
                                                      <td>
                                                          <asp:TextBox ID="dteFechaNacimientoBeneficiario" runat="server" CssClass="form-control" Width="100"></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">Teléfono Celular:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtTelefonoCelularBeneficiario" runat="server" CssClass="form-control" placeholder="Número de Celular"></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">Teléfono Casa:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtTelefonoCasaBeneficiario" runat="server" CssClass="form-control" placeholder="Número de Casa"></asp:TextBox>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td class="fonts-text">País:</td>
                                                      <td>
                                                          <asp:DropDownList ID="ddlPaisBeneficiario" runat="server" CssClass="form-control"></asp:DropDownList> 
                                                      </td>
                                                      <td class="fonts-text">Estado:</td>
                                                      <td>
                                                          <asp:DropDownList ID="ddlEstadoBeneficiario" runat="server" CssClass="form-control"></asp:DropDownList>
                                                      </td>
                                                      <td class="fonts-text">Municipio:</td>
                                                      <td>
                                                          <asp:DropDownList ID="ddlMunicipioBeneficiario" runat="server" CssClass="form-control"></asp:DropDownList>
                                                      </td>
                                                      <td class="fonts-text">Colonia:</td>
                                                      <td>
                                                          <asp:DropDownList ID="ddlColoniaBeneficiario" runat="server" CssClass="form-control"></asp:DropDownList>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td class="fonts-text">Código Postal:</td>
                                                      <td>
                                                          <%--<asp:DropDownList ID="ddlCodigoPostalBeneficiario" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                                      </td>
                                                      <td class="fonts-text">Calle:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtCalleBeneficiario" runat="server" CssClass="form-control" placeholder="Calle"></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">No. Interior:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtNoInteriorBeneficiario" runat="server" CssClass="form-control" placeholder="Núm. Interior" ></asp:TextBox>
                                                      </td>
                                                      <td class="fonts-text">No. Exterior:</td>
                                                      <td>
                                                          <asp:TextBox ID="txtNoExteriorBeneficiario" runat="server" CssClass="form-control" placeholder="Núm. Exterior" ></asp:TextBox>
                                                      </td>
                                                  </tr>
                                              </table>
                                            </div>
                                             <div class="col-lg-offset-10 col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                                 <asp:Button ID="BtnAgregarBeneficiario" runat="server" CssClass="btn btn-block btn-sm btn-primary" Text="Agregar" />
                                             </div>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                  <br />
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFamiliares" >
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFamiliares" aria-expanded="false" aria-controls="collapseFamiliares">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-heart-empty"></span>Familiares</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFamiliares" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFamiliares">
                            <div class="panel-body">
                                <table style="width: 100%;">
                                    <tr>
                                       <td><asp:Label ID="etFamiliarNombre" runat="server" Text="Nombre:" CssClass="fonts-text"></asp:Label></td>
                                       <td><asp:TextBox ID="txtNombreFamiliares" runat="server" CssClass="form-control" placeholder="Nombre del Familiar"></asp:TextBox></td>
                                        <td><asp:Label ID="etDireccionFamiliares" runat="server" Text="Dirección:" CssClass="fonts-text"></asp:Label></td>
                                       <td><asp:TextBox ID="txtDireccionFamiliares" runat="server" CssClass="form-control" placeholder="Dirección del Familiar"></asp:TextBox></td>
                                        <td><asp:Label ID="etFamiliaresFechaNacimiento" runat="server" Text="Fecha Nacimiento:" CssClass="fonts-text"></asp:Label></td>
                                       <td><asp:TextBox ID="txtFechaNacimientoFamiliares" runat="server" CssClass="form-control" Width="100"></asp:TextBox>
                                           <ajaxToolkit:CalendarExtender ID="dteFechaFamiliaresNacimiento" TargetControlID="txtFechaNacimientoFamiliares" runat="server" />
                                       </td>
                                        <td><asp:Label ID="etTelefonoFamiliares" runat="server" Text="Teléfono:" CssClass="fonts-text"></asp:Label></td>
                                       <td><asp:TextBox ID="txtTelefonoFamiliares" runat="server" CssClass="form-control" placeholder="Telefono del Familiar"></asp:TextBox></td>
                                       
                                    </tr>
                                    <tr>
                                         <td><asp:Label ID="etParentesco" runat="server" Text="Parentesco:" CssClass="fonts-text"></asp:Label></td>
                                         <td><asp:DropDownList ID="ddlParentescoFamiliares" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlParentescoFamiliares_SelectedIndexChanged">
                                         </asp:DropDownList></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePnlBotonDatosFamiliares" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel ID="PnlBotonDatosFamiliares" runat="server" Visible="false">
                                                        <asp:Button ID="BtnAgregarDatosFamiliares" runat="server" CssClass="btn btn-block btn-sm btn-primary" Text="Agregar" OnClick="BtnAgregarDatosFamiliares_Click"  />
                                                    </asp:Panel>
                                                    
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnGuardar" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel> 
                                            

                                        </td>
                                    </tr>
                                </table>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <asp:UpdatePanel ID="UpdatePnlDatosFamiliares" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="dgvDatosFamiliares" runat="server" AllowPaging="true" AutoGenerateColumns="false" PageSize="5" Width="100%">
                                                <HeaderStyle BackColor="#C0392B" Font-Size="10" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#D5D8DC" Font-Size="10" ForeColor="#999999" />
                                                <EmptyDataRowStyle BackColor="#17202A" BorderColor="#D5D8DC" Font-Size="11" BorderWidth="1" />
                                                <FooterStyle BackColor="#999999" />
                                                <RowStyle BackColor="White" Font-Size="10" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Identificador" DataField="id" SortExpression="ID" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Nombre Completo" DataField="strNombreCompleto" SortExpression="strNombreCompleto" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Dirección" DataField="strDireccion" SortExpression="Dirección" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Fecha de Nacimiento" DataField="dteFechaNacimiento" SortExpression="Fecha nacimiento" ItemStyle-Font-Size="10" />
                                                    <asp:BoundField HeaderText="Teléfono" DataField="strTelefono" SortExpression="Teléfono" ItemStyle-Font-Size="10" />
                                                    <asp:TemplateField HeaderText="Editar">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImgEditar" runat="server" ImageUrl="~/Imagenes/edit_16x16.png" CommandName="Editar" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnAgregarDatosFamiliares" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingDocumentacion">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDocumentacion" aria-expanded="false" aria-controls="collapseDocumentacion">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-folder-open"></span>Documentación</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseDocumentacion" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingDocumentacion">
                            <div class="panel-body">
                                <asp:UpdatePanel ID="UpdatePnlDocumento" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <ajaxToolkit:AsyncFileUpload ID="AsyncFpdArchivo" runat="server" 
                                            CssClass="form-control" OnUploadedComplete="AsyncFpdArchivo_UploadedComplete" ThrobberID="imgLoading" ToolTip="Guarda los Archivos del Empleado." />
                                        <asp:Image ID="imgLoading" runat="server" ImageUrl="~/Imagenes/loader.gif" Width="40" Height="40" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingChecador">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseChecador" aria-expanded="false" aria-controls="collapseChecador">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-time"></span>Checador</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseChecador" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingChecador">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                         <div class="form-inline">
                                            <div class="form-group">
                                                Registrar: <asp:CheckBox ID="cbxSi" runat="server" Text="Si" CssClass="fonts-text" />
                                            </div>
                                             <div class="form-group">
                                                 <asp:CheckBox ID="cbxNo" runat="server"  Text="No" CssClass="fonts-text" />
                                             </div>
                                             <div class="form-group">
                                                 <asp:CheckBox ID="cbxEntrada" runat="server" Text="Entrada" CssClass="fonts-text" />
                                             </div>
                                             <div class="form-group">
                                                 <asp:CheckBox ID="cbxSalid" runat="server"  Text="Salida" CssClass="fonts-text" />
                                             </div>
                                             <div class="form-group">
                                                 <asp:CheckBox ID="cbxSalidaComedor" runat="server"  Text="Salida Comedor" CssClass="fonts-text" />
                                             </div>
                                             <div class="form-group">
                                                 <asp:CheckBox ID="cbxRegresoComedor" runat="server"  Text="Regreso Comedor" CssClass="fonts-text" />
                                             </div>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingIdiomas">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseIdiomas" aria-expanded="false" aria-controls="collapseIdiomas">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-hand-right"></span>Idiomas</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseIdiomas" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingIdiomas">
                            <div class="panel-body">
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="fonts-text">
                                            <asp:Label ID="etNombreIdioma" runat="server" Text="Nombre Idioma:" CssClass="fonts-text"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNombreIdioma" runat="server" CssClass="form-control" placeholder="Idioma"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:Label ID="etNivelEscritura" runat="server" Text="Nivel de Escritura:" CssClass="fonts-text"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNivelEscritura" runat="server" CssClass="form-control" placeholder="Nivel de Escritura"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:Label ID="etNivelLectura" runat="server" Text="Nivel de Lectura:" CssClass="fonts-text"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNivelLectura" runat="server" CssClass="form-control" placeholder="Nivel de Lectura"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:Label ID="etNivelConversacion" runat="server" Text="Nivel de Conversación:" CssClass="fonts-text"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNivelConversacion" runat="server" CssClass="form-control" placeholder="Nivel de Conversacion"></asp:TextBox>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="etDocumentoAvala" runat="server" Text="Documento Avala:" CssClass="fonts-text"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlDocumentoAvala" runat="server" CssClass="form-control"></asp:DropDownList>

                                        </td>
                                        <td class="fonts-text">
                                            Folio:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFolioidioma" runat="server" CssClass="form-control" placeholder="Folio"></asp:TextBox>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingContratacion">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseContratacion" aria-expanded="false" aria-controls="collapseContratacion">
                                    <p class="fonts-text"><span class="glyphicon glyphicon-hand-right"></span>Contratación</p>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseContratacion" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingContratacion">
                            <div class="panel-body">
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>

     <script>
        function mostrarBlock() {
            $.blockUI({ message: '<h4><img alt="imgload" src="/Imagenes/loader.gif" />Espere un momento...</h4>' });
            __doPostBack("<%= BtnGuardar%>", "OnClick");
            
         }

         function quitarBlock() {
             $.unblockUI();
         }
    </script>
</asp:Content>
