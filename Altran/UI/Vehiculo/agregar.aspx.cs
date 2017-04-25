using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Altran.Data;
using Altran.Data.Entities;
using Altran.Factory.Ifactory;
using Altran.Factory.factoria;
using Altran.Extension.Control;
using Altran.Recursos;
using Altran.Factory.flow;

namespace Altran.UI.Vehiculo
{
    public partial class agregar : System.Web.UI.Page
    {
        private int tipo =0;
        private int marca = 0;
        private int modelo = 0;
        private int anio = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.SetDatosDropDownList();
            }

        }


        [System.Web.Services.WebMethod]
        public static string GetDatosModelos(string name)
        {
           
            name = "Parametro";
            return name;
        }


        #region Establecer Datos de Precarga en la Pantalla
        protected void SetDatosVisiblesInicio()
        {

        }
        protected void SetDatosDropDownList()
        {
            this.ddlModelo.Enabled = false;
            this.ddlTipoVehiculo.GetData<CatTipoVehiculo>();
            this.ddlMarca.GetData<CatMarcaVehiculo>();
        }

        #endregion

        #region Obtener Los datos de la pantalla
        protected TblVehiculo GetDatosVistaVehiculo(int tipo, int marca, int modelo,int anio)
        {  
            //validar tipo marca y modelo año
            TblVehiculo tblVehiculo = new TblVehiculo();
            tblVehiculo.strNumEconomico = txtNoEconomico.ToString().ToUpper().Trim();
            tblVehiculo.dteFechaIngreso = this.txtFechaIngreso.ConvertDate();
            tblVehiculo.strNumSerie = txtNoSerie.Text.ToUpper().Trim();
            tblVehiculo.idTipoVehiculo = tipo;
            tblVehiculo.idModelo = modelo;
            ///revisar  la marca
            tblVehiculo.strNumMotor = txtNoMotor.Text.ToUpper().Trim();
            tblVehiculo.strCapacidadVehicular = txtCapacidad.Text.ToUpper().Trim();
            tblVehiculo.strColor = txtColor.Text.ToUpper().Trim();
            tblVehiculo.intAnio = anio;
            tblVehiculo.dcePrecioCompra = this.txtPrecioCompra.ConvertDecimal();
            tblVehiculo.strPropietario = txtPropietario.Text.ToUpper().Trim();
            tblVehiculo.intNumeroLlantas = this.txtNoLlantas.ConvertInt();
            tblVehiculo.strMedida = this.txtMedida.Text.ToUpper().Trim();
            tblVehiculo.strCapacidadVehicular = txtCapacidadLlanta.Text.ToUpper().Trim();
            tblVehiculo.strCombustible = txtCombustible.Text.ToUpper().Trim();
            tblVehiculo.dceKmLitros = this.txtNoKmLitros.ConvertDecimal();
            tblVehiculo.dceCapacidadCombus = this.txtCapacidadCombustible.ConvertDecimal();
            tblVehiculo.dceRendimiento = this.txtRendimiento.ConvertDecimal();
            return tblVehiculo;
        }
        #endregion

        #region Evento del boton
        protected void btnAgregarVehiculo_Click(object sender, EventArgs e)
        {
            if (this.ddlMarca.SelectedValue != Recurso.Seleccionar  && this.ddlModelo.SelectedValue != Recurso.Seleccionar && this.ddlAnio.SelectedValue != Recurso.Seleccionar )
            {
                IFactory<TblVehiculo> ifactoryTblDLaborales = new Factory<TblVehiculo>();
                ifactoryTblDLaborales.Insert(this.GetDatosVistaVehiculo(this.tipo,this.marca,this.modelo,this.anio));
               
            }


        }
        #endregion

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlMarca.SelectedValue != Recurso.Seleccionar)
            {
                this.ddlModelo.Items.Clear();
                this.marca = int.Parse(this.ddlMarca.SelectedValue);
                flowModeloVehiculo flowModelo = new flowModeloVehiculo();
                List<CatModeloVehiculo> modelos = flowModelo.GetModeloVehiculoByIdMarcaVehiculo(this.marca);
                if (modelos.Count > 0)
                {

                    this.ddlModelo.AppendDataBoundItems = true;   
                    this.ddlModelo.Items.Insert(0,"Seleccionar");
                    this.ddlModelo.DataValueField = "id";
                    this.ddlModelo.DataTextField = "strValor";
                    this.ddlModelo.DataSource = modelos;
                    this.ddlModelo.DataBind();

                }
            }
        }

        protected void ddlModelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlModelo.SelectedValue != Recurso.Seleccionar)
            {
                this.modelo = int.Parse(this.ddlModelo.SelectedValue);
            }
        }

        protected void ddlAnio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlAnio.SelectedValue != Recurso.Seleccionar)
            {
                this.anio = int.Parse(this.ddlAnio.SelectedValue);
            }
        }
    }
}