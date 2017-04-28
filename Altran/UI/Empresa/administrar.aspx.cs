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
using Altran.Factory.factoria;
using Altran.Factory.flow;

namespace Altran.UI.Empresa
{
    public partial class administrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.CleanField();
            }
        }

        protected void dgvDatosEmpresa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());
            switch (e.CommandName)
            {
                case "Editar":

                    string nombreEditar = dgvDatosEmpresa.Rows[index].Cells[0].Text;
                    int idEditar = int.Parse(nombreEditar);
                    FlowCatEmpresa flowEmpresa = new FlowCatEmpresa();
                    CatEmpresa catEmpresa= flowEmpresa.GetCatEmpresaById(FactoryExpresionCatEmpresa.GetCatEmpresaById(idEditar));
                    this.etId.Text = catEmpresa.id.ToString();
                    this.SetDatosVistaEmpresa(catEmpresa);
                    //se activa el modal
                    ScriptManager.RegisterStartupScript(this, Page.GetType(), "Mymodal", "$('#myModalEmpresaAdministra').modal({keyboard:false});", true);
                    break;
                case "Eliminar":

                   break;
            }
        }

        #region Metodo Principal para Obtener Datos de la Pantalla

        private CatEmpresa GetDatosVistaEmpresa()
        {
            CatEmpresa catEmpresa = new CatEmpresa();
            catEmpresa.id = int.Parse( this.etId.Text);
            catEmpresa.strNombre = txtNombreEmpresa.Text.Trim().ToUpper();
            catEmpresa.strRfc = txtRazonSocial.Text.Trim().ToUpper();
            catEmpresa.strDireccionFiscal = txtDireccionFiscal.Text.Trim().ToUpper();
            catEmpresa.strTelefono = this.txtTelefono.Text.ToString(); 
            catEmpresa.strEmail = txtMail.Text.Trim();
            catEmpresa.strFax = txtNumeroFax.Text.Trim();
            return catEmpresa;
        }
        #endregion



        #region Metodo Principal para Pintar Datos de la Vista
        private void SetDatosVistaEmpresa(CatEmpresa catEmpresa)
        {
            this.txtNombreEmpresa.Text = catEmpresa.strNombre;
            this.txtRazonSocial.Text = catEmpresa.strRfc;
            this.txtDireccionFiscal.Text = catEmpresa.strDireccionFiscal;
            this.txtTelefono.Text = catEmpresa.strTelefono;
            this.txtMail.Text = catEmpresa.strEmail;
            this.txtNumeroFax.Text = catEmpresa.strFax;
        }
        #endregion

        #region Limpiar Campos
        private void CleanField()
        {
            this.txtNombreEmpresa.Text = string.Empty;
        }
        #endregion

        protected void BtnEditarEmpresa_Click(object sender, EventArgs e)
        {
            FlowCatEmpresa flujoEmpresa = new FlowCatEmpresa();
            flujoEmpresa.upadte(this.GetDatosVistaEmpresa());
        }
    }
}