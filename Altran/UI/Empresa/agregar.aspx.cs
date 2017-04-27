using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Altran.Data.Entities;
using Altran.Data;
//carga las factorias genericas y especificas
using Altran.Factory.Ifactory;
//carga las factorias y sus procesos
using Altran.Factory.factoria;
using Altran.Factory.flow;
using Altran.Extension.Control;

namespace Altran.UI.Empresa
{
    public partial class agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Evento Guardar de la Pagina
        protected void BtnGuardarEmpresa_Click(object sender, EventArgs e)
        {
            //aqui vamos hacer la insercion 
            IFactory<CatEmpresa> ifactoryEmpresa = new Factory<CatEmpresa>();///este objeto se encarga de insertar cualquier entidad
            ifactoryEmpresa.Insert(this.GetDatosVistaEmpresa());///listo insertamos la entidad
            //ahora vamos a consultar y pegar al grid
            //voy a llenar el grid en un solo paso utilizando la extesion
            this.dgvDatosEmpresa.GetData<CatEmpresa>();//listo traigo todos los elementos de la tabla catEmpresa
            this.UpdatePnlDatosEmpresa.Update();
            
        }
        #endregion

        #region Obtener Datos de la Empresa
        private CatEmpresa GetDatosVistaEmpresa()
        {
            CatEmpresa catEmpresa = new CatEmpresa();
            catEmpresa.strNombre = txtNombre.Text.Trim().ToUpper();
            catEmpresa.strRfc = txtRazonSocial.Text.Trim().ToUpper();
            catEmpresa.strDireccionFiscal = txtDireccionFiscal.Text.Trim().ToUpper();
            catEmpresa.idTelefono = 1;
            catEmpresa.strEmail = txtMail.Text;
            catEmpresa.strFax = txtFax.Text.Trim().ToUpper();
            
            return catEmpresa;
        }

        #endregion


        #region Evento del Grid para seleccionar una fila
        protected void dgvDatosEmpresa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            switch (e.CommandName)
            {
                case "Asignar":

                    string nombreAsignar = dgvDatosEmpresa.Rows[index].Cells[0].Text;
                    int idAsignar = int.Parse(nombreAsignar);
                    FlowCatEmpresa flowEmpresaAsignar = new FlowCatEmpresa();
                    List<CatEmpresa> catEmpresasAsignar = flowEmpresaAsignar.GetListCatEmpresaById(FactoryExpresionCatEmpresa.GetCatEmpresaById(idAsignar));
                    ///configurar el dropdownList
                    this.ddlNombreEmpresa.Items.Clear();
                    this.ddlNombreEmpresa.DataTextField = "strNombre";
                    this.ddlNombreEmpresa.DataValueField = "id";
                    this.ddlNombreEmpresa.Items.Insert(0,Recursos.Recurso.Seleccionar);
                    this.ddlNombreEmpresa.DataSource = catEmpresasAsignar;
                    this.ddlNombreEmpresa.DataBind();
                    this.UpdatePnlDDLEmpresa.Update();
                    ///
                    //se activa el modal
                    ScriptManager.RegisterStartupScript(this, Page.GetType(), "Mymodal", "$('#myModalProyecto').modal({keyboard:false});", true);
                    break;
                case "Eliminar":
                    
                    int rowEliminar = int.Parse(e.CommandArgument.ToString());
                    string nombreEliminar = dgvDatosEmpresa.Rows[rowEliminar].Cells[0].Text;
                    int idEliminar = int.Parse(nombreEliminar);
                    FlowCatEmpresa flowEmpresa = new FlowCatEmpresa();
                    CatEmpresa catEmpresa =flowEmpresa.GetCatEmpresaById(FactoryExpresionCatEmpresa.GetCatEmpresaById(idEliminar));
                    flowEmpresa.Delete(catEmpresa);
                    this.dgvDatosEmpresa.GetData<CatEmpresa>();
                    this.UpdatePnlDatosEmpresa.Update();
                    break;
            }
        }
        #endregion

        #region  Agregar Empresa a Proyecto
        protected void BtnAsignarProyectoEmpresa_Click(object sender, EventArgs e)
        {
            if (this.ddlNombreEmpresa.SelectedValue != Recursos.Recurso.Seleccionar)
            {
                int idEmpresa = int.Parse(this.ddlNombreEmpresa.SelectedValue);
                IFactory<CatProyectoEmpresa> ifactoryProyectoEmpresa = new Factory<CatProyectoEmpresa>();
                ifactoryProyectoEmpresa.Insert(this.GetDatosVistaProyectoEmpresa(idEmpresa));
            }
        }
        #endregion


        #region Obtener Datos del Proyecto
        private CatProyectoEmpresa GetDatosVistaProyectoEmpresa(int id)
        {
            CatProyectoEmpresa proyecto = new CatProyectoEmpresa();
            proyecto.idEmpresa = id;
            proyecto.strValor = txtNombreProyecto.Text.Trim().ToUpper();
            proyecto.strNumeroContrato = txtOrdenTrabajo.Text.Trim().ToUpper();
            return proyecto;
        }
        #endregion

    }
}