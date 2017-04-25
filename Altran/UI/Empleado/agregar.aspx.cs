using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Altran.Extension.Control;
using Altran.Data;
using Altran.Data.Entities;
using Altran.Factory.Ifactory;
using Altran.Factory.flow;
using Altran.Factory.factoria;
using Altran.Recursos;
using Altran.Extension.Session;
using System.IO;


namespace Altran.UI.Empleado
{
    public partial class agregar : System.Web.UI.Page
    {
        SessionManager sesionManager = null;
        private int idBanco = 0;
        private int idMovimiento = 0;
        private int idParentescoFamiliar = 0;
        private string path = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.SetDatosDropDownList();
                //creamos la sesion y la ponemos en esta variable
                this.Session[Recurso.Manager] = new SessionManager();
                //sesionManager = (SessionManager)this.Session[Recurso.Manager];
            }

        }

        #region Boton de Datos Pirncipales
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {

            if (this.ddlSexo.SelectedValue != Recurso.Seleccionar && this.ddlSangre.SelectedValue != Recurso.Seleccionar
                && this.ddlEstadoCivil.SelectedValue != Recurso.Seleccionar && this.ddlNacionalidad.SelectedValue != Recurso.Seleccionar)
            {
                int tipoSangre = int.Parse(this.ddlSangre.SelectedValue.ToString());
                int intNacionalidad = int.Parse(this.ddlNacionalidad.SelectedValue.ToString());
                CatEmpleado empleado= this.GetDatosVistaEmpleado(this.ddlSexo.SelectedValue, tipoSangre, this.ddlEstadoCivil.SelectedValue, intNacionalidad);
                //creo el objeto para insertar
                IFactory<CatEmpleado> ifactory = new Factory<CatEmpleado>();
                if (ifactory.Insert(empleado))////inserto el objeto
                {
                    this.SetActualizarMensajeRegistro();
                    #region boton agregar visible
                    this.SetBotonesAgregar();
                    #endregion
                    sesionManager = (SessionManager)this.Session[Recurso.Manager];
                    FlowCatEmpleado flowEmpleado = new FlowCatEmpleado();

                    CatEmpleado catEmpleado= flowEmpleado.GetCatEmpleadoByExpresionEntity(FactoryExpresionCatEmpleado.GetCatEmpleadoByRfc(empleado.strRfc));
                    sesionManager.Parametros[Recurso.IDEmpleado] = catEmpleado.id;
                    Session[Recurso.Manager] = sesionManager;
                }
                

            }

            

        }
        #endregion

        #region Establecer Datos Visibles en la Pantalla
        protected void SetActualizarMensajeRegistro()
        {
            this.PnlMensaje.Visible = true;
            this.UpdatePnlGenerales.Update();
        }

        /// <summary>
        /// Este metodo se encarga de establecer los botones visibles en la primera vez de carga de la pagina
        /// </summary>
        protected void SetBotonesAgregar()
        {
            #region Boton DatosFamiliares
            this.PnlBotonDatosFamiliares.Visible = true;
            this.UpdatePnlBotonDatosFamiliares.Update();
            #endregion

            #region Boton Datos Laborales
            this.PnlBotonAgregarAccion.Visible = true;
            this.UpdatePnlBotonAccionLaborales.Update();
            #endregion

            #region Boton Datos Escolares
            this.btnAgregarDatosEscolares.Visible = true;
            this.UpdatePnlBtnAgregarDatosEscolares.Update();
            #endregion
        }

        #endregion

        #region Establecer Datos de Precarga en la Pantalla
        protected void SetDatosVisiblesInicio()
        {
            
        }
        protected void SetDatosDropDownList()
        {
            this.ddlSangre.GetData<CatTipoSangre>();
            this.ddlParentesco.GetData<CatParentesco>();
            this.ddlNacionalidad.GetData<CatNacionalidad>();
            this.ddlParentescoFamiliares.GetData<CatParentesco>();
            this.ddlEscolarProfesion.GetData<CatProfesion>();
            this.ddlEscolarEstatus.GetData<CatStatusEscolar>();
            this.ddlEscolaresDocumentoCertifica.GetData<CatDocumentoCertifica>();
            this.ddlNivelEscolar.GetData<CatNivelEscolar>();
            this.ddlPais.GetData<CatPai>();
            this.ddlBancos.GetData<CatBanco>();
            this.ddlMovimientos.GetData<CatMovimiento>();
            this.ddlParentescoBeneficiario.GetData<CatParentesco>();
            this.ddlPaisBeneficiario.GetData<CatPai>();///estos tienen que dejar de estar cargados desde el incio
            this.ddlEstadoBeneficiario.GetData<CatEstado>();
            this.ddlMunicipioBeneficiario.GetData<CatMunicipio>();
        }

        #endregion

        protected void BtnAgregarDatosFamiliares_Click(object sender, EventArgs e)
        {
            if (this.ddlParentescoFamiliares.SelectedValue != Recurso.Seleccionar)
            {
                sesionManager = (SessionManager)this.Session[Recurso.Manager];
                int idEmpleado = (int)sesionManager.Parametros[Recurso.IDEmpleado];
                IFactory<TblFamiliar> ifactoryFamiliar = new Factory<TblFamiliar>();
                ifactoryFamiliar.Insert(this.GetDatosFamiliares(idEmpleado, this.idParentescoFamiliar));
                IFactoryTblFamiliares ifactoryTblfamiliar = new FlowTblDatosFamiliares();
                this.dgvDatosFamiliares.GetData<TblFamiliar>( ifactoryTblfamiliar.GetTblDatosFamiliaresById(FactoryExpressionTblFamiliares.GetTblFamiliaresById(idEmpleado) ) );
                this.UpdatePnlDatosFamiliares.Update();
            }
        }

        #region Evento de los DropdonwList
        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlPais.SelectedValue != "Seleccionar")
            {
                FlowCatEstados flowEstados = new FlowCatEstados();
                List<CatEstado>  estados= flowEstados.
                    GetCatEstados(FactoryExpresionCatEstado.GetCatEstadosByIdPais(int.Parse(this.ddlPais.SelectedValue.ToString().Trim())));

                if (estados.Count > 0)
                {
                    this.ddlEstado.Enabled = true;
                    this.ddlEstado.GetData<CatEstado>(estados); 
                    this.UpdatePnlEstado.Update();
                }
            }
        }
      

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlEstado.SelectedValue != "Seleccionar")
            {
               int idEstado = int.Parse(this.ddlEstado.SelectedValue.ToString().Trim());

                this.ddlColonia.Enabled = false;
                this.ddlColonia.SelectedValue = Recurso.Seleccionar;
                this.UpdatePnlColonia.Update();

                FlowCatMunicipio flowMunicipios = new FlowCatMunicipio();
                List<CatMunicipio> municipios =  
                    flowMunicipios.
                    GetCatMunicipios(FactoryExpresionCatMunicipio.GetCatEstadosByIdEstado(idEstado));
                //Where<CatMunicipio>.GetCatalogById(idEstado)
                if (municipios.Count > 0)
                {
                    this.ddlMunicipio.Items.Clear();
                    this.ddlMunicipio.Enabled = true;
                    this.ddlMunicipio.DataSource = null;
                    this.ddlMunicipio.GetData<CatMunicipio>(municipios);
                    this.UpdatePnlMunicipio.Update();
                }
            }
        }

        protected void ddlMunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlMunicipio.SelectedValue != "Seleccionar")
            {
                int idmunicipio = int.Parse(this.ddlMunicipio.SelectedValue.ToString().Trim());
              
                FlowCatColonia flowColonias = new FlowCatColonia();
                List<CatColonia> colonias = 
                                 flowColonias.
                                 GetCatColonias(FactoryExpresionCatColonia.
                                 GetCatColoniaByIdMunicipio(idmunicipio));

                if (colonias.Count > 0)
                {
                    this.ddlColonia.Items.Clear();
                    this.ddlColonia.Enabled = true;
                    this.ddlColonia.GetData<CatColonia>(colonias);
                    this.UpdatePnlColonia.Update();
                }

            }
        }
        protected void ddlColonia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlColonia.SelectedValue != Recurso.Seleccionar)
            {
                int idColonia = int.Parse(this.ddlColonia.SelectedValue);
                FlowCatColonia flowColonia = new FlowCatColonia();
                CatColonia catColonia = flowColonia.GetCatColoniaById(idColonia);

                if (catColonia.id > 0)
                {
                    this.ddlCodigoPostal.Items.Add(catColonia.intCp.ToString().Trim());
                    this.UpdatePnlCodigoPostal.Update();
                }
               

            }
        }

        protected void ddlCodigoPostal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlCodigoPostal.SelectedValue != "Seleccionar")
            {

            }
        }


        protected void ddlBancos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlBancos.SelectedValue != Recurso.Seleccionar)
            {
                this.idBanco = int.Parse(this.ddlBancos.SelectedValue.ToString().Trim());
            }
        }

        protected void ddlMovimientos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlMovimientos.SelectedValue != Recurso.Seleccionar)
            {
                this.idMovimiento = int.Parse(this.ddlMovimientos.SelectedValue.ToString().Trim());
            }
        }

        protected void ddlParentescoFamiliares_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlParentescoFamiliares.SelectedValue != Recurso.Seleccionar)
            {
                this.idParentescoFamiliar = int.Parse(this.ddlParentescoFamiliares.SelectedValue.ToString().Trim());
            }
        }



        #endregion


        #region Obtener Datos del Empleado Generales
        public CatEmpleado GetDatosVistaEmpleado(string sexo,int tipoSangre,string estadoCivil,int nacionalidad)
        {
            CatEmpleado catEmpleado = new CatEmpleado();
            catEmpleado.strNombre = txtNombre.Text.ToUpper();
            catEmpleado.strApaterno = txtApaterno.Text.ToUpper();
            catEmpleado.strAmaterno = txtAmaterno.Text.ToUpper();
            catEmpleado.intEdad = this.txtEdad.ConvertInt();
            catEmpleado.dteFechaNaci = DateTime.Parse(this.dteFechaNacimiento.Text);//fecha de nacimiento
            catEmpleado.dceEstatura = this.txtEstatura.ConvertDecimal();
            catEmpleado.dcePeso = this.txtPeso.ConvertDecimal();
            catEmpleado.strRfc = txtRfc.Text.ToUpper();
            catEmpleado.strCurp = txtCurp.Text.ToUpper();
            catEmpleado.strNss = txtNss.Text.ToUpper();
            catEmpleado.strSexo = sexo;
            catEmpleado.idTipoSangre = tipoSangre;
            catEmpleado.strEstadoCivil = estadoCivil;
            catEmpleado.idNacionalidad = nacionalidad;
            return catEmpleado;

        }


        #endregion

        #region Obtener Datos Laborales del Empleado
        private TblDatosLaborale GetDatosVistaLaborales(int id)
        {
            TblDatosLaborale tblDatosLaborales = new TblDatosLaborale();
            tblDatosLaborales.idEmpleado = id;
            tblDatosLaborales.strPuesto = txtPuesto.Text.ToUpper();
            tblDatosLaborales.strEmpresa = txtEmpresa.Text.ToUpper();
            tblDatosLaborales.strDepartamento = txtDepartamento.Text.ToUpper();
            tblDatosLaborales.dteFechaEntrada = this.txtFechaEntrada.ConvertDate();
            tblDatosLaborales.dceSueldoInicial = this.txtSueldoInicial.ConvertDecimal();
            tblDatosLaborales.strDireccion = txtDireccionLaboral.Text.ToUpper();
            tblDatosLaborales.strTelefono = txtTelefonoLaboral.Text;
            tblDatosLaborales.strJefeInmediato = txtJefeInmediato.Text.ToUpper();
            tblDatosLaborales.dceSueldoFinal = this.txtSueldoFinal.ConvertDecimal();
            tblDatosLaborales.dteFechaSalida = this.txtFechaSalida.ConvertDate();
            tblDatosLaborales.strMotivoSalida = txtMotivoSalida.Text.ToUpper();
            tblDatosLaborales.strHerramientas = txtHerramientas.Text.ToUpper();

            return tblDatosLaborales;
        }
        #endregion

        #region Datos de la tarjeta Bancaria

        private TblTarjetaBancaria GetDatosTarjetaBancaria(int id, int idBanco, int idMovimiento)
        {
            TblTarjetaBancaria tblTarjetaBancaria = new TblTarjetaBancaria();
            tblTarjetaBancaria.idEmpleado = id;
            tblTarjetaBancaria.idBanco = idBanco;
            tblTarjetaBancaria.idMovimiento = idMovimiento;
            tblTarjetaBancaria.dteFecha = this.dteFechaTarjetaBancaria.ConvertDate();
            tblTarjetaBancaria.intNumeroCuenta = this.txtNumeroCuenta.Text;
            tblTarjetaBancaria.intNumeroTarjeta = this.txtNumeroTarjeta.Text;
            return tblTarjetaBancaria;
        }
        #endregion

        #region Datos de los Familiares
        private TblFamiliar GetDatosFamiliares(int idEmpleado, int idParentesco)
        {
            TblFamiliar tblFamiliar = new TblFamiliar();
            tblFamiliar.idEmpleado = idEmpleado;
            tblFamiliar.idParentesco = idParentesco;
            tblFamiliar.strNombreCompleto = txtNombreFamiliares.Text.ToUpper();
            tblFamiliar.strDireccion = txtDireccionFamiliares.Text.ToUpper();
            tblFamiliar.strTelefono = txtTelefonoFamiliares.Text;
            tblFamiliar.dteFechaNacimiento = this.txtFechaNacimientoFamiliares.ConvertDate();
            return tblFamiliar;
        }
        #endregion


        protected void BtnAgregarDatosLaborales_Click(object sender, EventArgs e)
        {
            sesionManager = (SessionManager)this.Session[Recurso.Manager];
            IFactory<TblDatosLaborale> ifactoryLaborales = new Factory<TblDatosLaborale>();
            int idEmpleado = (int)sesionManager.Parametros[Recurso.IDEmpleado];
            ifactoryLaborales.Insert(this.GetDatosVistaLaborales(idEmpleado));
            this.dgvDatosLaborales.GetData<TblDatosLaborale>();
            this.UpdatePnlGridDatosLaborales.Update();

        }

        #region Boton Agregar Tarjeta Bancaria
        protected void BtnAgregarTarjeta_Click(object sender, EventArgs e)
        {
            if (this.ddlBancos.SelectedValue != Recurso.Seleccionar && this.ddlMovimientos.SelectedValue != Recurso.Seleccionar)
            {
                sesionManager = (SessionManager)this.Session[Recurso.Manager];
                int idEmpleado = (int)sesionManager.Parametros[Recurso.IDEmpleado];
                //creamos el objeto de factoria para insertar
                IFactory<TblTarjetaBancaria> ifactoryTB = new Factory<TblTarjetaBancaria>();
                ifactoryTB.Insert(this.GetDatosTarjetaBancaria(idEmpleado, this.idBanco, this.idMovimiento));///pasamos la entidad de tarjeta bancaria
                //consultamos los datos de la tarjeta por el id del empleado
                IFactoryTblTarjetaBancaria ifactoryTarjetaBancaria = new FlowTblTarjetaBancaria();
                List<TblTarjetaBancaria> tarjetasBancarias= ifactoryTarjetaBancaria.GetTblTarjetaBancariaById(FactoryExpresionTblTarjetaBancaria.GetTblTarjetaBancariayId(idEmpleado));
                this.dgvDatosTarjetaBancaria.GetData<TblTarjetaBancaria>(tarjetasBancarias);
                this.UpdatePnlDatosTarjetaBancaria.Update();
            }
            
        }



        #endregion

        protected void AsyncFpdArchivo_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            path = Server.MapPath(Recurso.Documentos);
            if (this.AsyncFpdArchivo.HasFile)
            {
                
                this.AsyncFpdArchivo.SaveAs(this.path+this.AsyncFpdArchivo.FileName);
            }
        }
    }
}