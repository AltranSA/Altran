using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Altran.Factory.flow;
using Altran.Data.Entities;
using Altran.Factory.factoria;
namespace Altran.UI.Bitacora
{
    public partial class agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnConsultarVehiculo_Click(object sender, EventArgs e)
        {
            FlowTblVehiculo flujuVehiculo = new FlowTblVehiculo();
            TblVehiculo Vehiculo = flujuVehiculo.GetVehiculoByNoEconomico(txtNoEconomico.Text.Trim());
            this.SetDatosVistaVehiculo(Vehiculo);    
            
           
        }

        protected void btnAgregarBitacoraMnatenimiento_Click(object sender, EventArgs e)
        {

        }

        #region  Establecer los Datos en La vista en la pantalla
        private void SetDatosVistaVehiculo(TblVehiculo vehiculo)
        {
            txtPlacas.Text = vehiculo.strPlacas;
            txtMarcas.Text = vehiculo.CatModeloVehiculo.CatMarcaVehiculo.strValor;
            txtModelo.Text = vehiculo.CatModeloVehiculo.strValor;
            txtAño.Text = vehiculo.intAnio.ToString();
        }

        #endregion

        #region  Obtener los Datos en La vista en la pantalla

        #endregion



    }
}