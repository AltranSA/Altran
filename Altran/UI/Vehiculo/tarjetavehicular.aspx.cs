using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//cargamos las librerias necesarias para el acceso a datos
using Altran.Data.Entities;
using Altran.Data;
using Altran.Extension.Control;
using Altran.Factory.Ifactory;
using Altran.Factory.flow;
//cargamos datos para llenar combo

namespace Altran.UI.Vehiculo
{
    public partial class tarjetavehicular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void BtnAgregarTipoVehiculo_Click(object sender, EventArgs e)
        {
            //llamada al metodo de inserción
            IFactory<CatTipoVehiculo> ifactoryVehiculo = new FlowCatTipoVehiculo();
            if (ifactoryVehiculo.Insert(this.GetDatosVistaTipoVehiculo()))
            {
                this.txtTipoVehiculo.Text = string.Empty;
                this.dgvDatosVehiculares.GetData<CatTipoVehiculo>();
                this.UpdatePnlAgregarTipoVehiculo.Update();
            }
        }

        /// <summary>
        /// Este metodo se encarga de obtener los datos de la vista para almacenarlos en un objeto
        /// </summary>
        /// <returns>retorna el objeto del tipo especifico con los datos de la vista</returns>
        public CatTipoVehiculo GetDatosVistaTipoVehiculo()
        {
            CatTipoVehiculo catTipoVehiculo = new CatTipoVehiculo();
            catTipoVehiculo.strValor = txtTipoVehiculo.Text.ToUpper().Trim();
            return catTipoVehiculo;
        }

        public CatMarcaVehiculo GetDatosVistaMarcaModelo()
        {
            CatMarcaVehiculo catMarcaMarcaVehiculo = new CatMarcaVehiculo();
            catMarcaMarcaVehiculo.strValor = this.txtMarca.Text.ToUpper().Trim();
            return catMarcaMarcaVehiculo;
        }


        protected void BtnAgregarMarca_Click(object sender, EventArgs e)
        {
            ///lamada al metodo de inserción dela marca del vehiculo
            IFactory<CatMarcaVehiculo> ifactoryMarca = new Factory.factoria.Factory<CatMarcaVehiculo>();
            if (ifactoryMarca.Insert(this.GetDatosVistaMarcaModelo()))
            {
                this.dgvDatosMarcaVehiculo.GetData<CatMarcaVehiculo>();
                this.UpdatePnlMarcaVehiculo.Update();
            }

        }

        protected void dgvDatosMarcaVehiculo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            switch (e.CommandName)
            {
                case "Editar":
                    int row = int.Parse(e.CommandArgument.ToString());
                    string nombre = dgvDatosMarcaVehiculo.Rows[row].Cells[0].Text;
                    int idEditar = int.Parse(nombre);

                    break;
                case "Eliminar":
                    int rowEliminar = int.Parse(e.CommandArgument.ToString());
                    string nombreEliminar = dgvDatosMarcaVehiculo.Rows[rowEliminar].Cells[0].Text;
                    int idEliminar = int.Parse(nombreEliminar);
                    CatMarcaVehiculo catMarcaVehiculo = new CatMarcaVehiculo();
                    catMarcaVehiculo.id = idEliminar;
                    FlowMarcaVehiculo flujoMarca = new FlowMarcaVehiculo();
                    flujoMarca.Delete(catMarcaVehiculo);
                    this.dgvDatosMarcaVehiculo.GetData<CatMarcaVehiculo>();
                    this.UpdatePnlMarcaVehiculo.Update();
                    break;
            }
        }

        protected void BtnVincularMarcaModelo_Click(object sender, EventArgs e)
        {
            this.ddlMarcaVehiculoAsignar.Items.Clear();
            this.ddlMarcaVehiculoAsignar.GetData<CatMarcaVehiculo>();
            ScriptManager.RegisterStartupScript(this, Page.GetType(), "Mymodal", "$('#myModalVehiculo').modal({keyboard:false});", true);
            
        }
    }
}