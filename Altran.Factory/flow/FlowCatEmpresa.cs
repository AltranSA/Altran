using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data;
using Altran.Data.Entities;
using Altran.Factory.factoria;
using System.Linq.Expressions;
using System.Data.Linq;

namespace Altran.Factory.flow
{
    public class FlowCatEmpresa
    {
        public CatEmpresa GetCatEmpresaById(Expression<Func<CatEmpresa, bool>> predicado)
        {
            CatEmpresa catEmpresa = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    catEmpresa = contexto.CatEmpresas.Where(predicado.Compile()).FirstOrDefault<CatEmpresa>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;   
            }
            System.GC.Collect();
            return catEmpresa;
        }

        public bool Delete(CatEmpresa entidad)
        {
            bool respuesta = false;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    CatEmpresa catEmpresa = contexto.CatEmpresas.Where(p => p.id == entidad.id).First<CatEmpresa>();
                    contexto.CatEmpresas.DeleteOnSubmit(catEmpresa);
                    contexto.SubmitChanges();
                    contexto.Refresh(RefreshMode.KeepChanges);
                    respuesta = true;
                }

            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            return respuesta;
        }

        public List<CatEmpresa> GetListCatEmpresaById(Expression<Func<CatEmpresa, bool>> predicado)
        {
            List<CatEmpresa> catEmpresas = new List<CatEmpresa>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    catEmpresas = contexto.CatEmpresas.Where(predicado.Compile()).ToList<CatEmpresa>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return catEmpresas;
        }


    }
}
