using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data.Entities;
using Altran.Data;
using Altran.Factory.factoria;
using System.Linq.Expressions;
using Altran.Factory.Ifactory;

namespace Altran.Factory.flow
{
    public class FlowCatEmpleado: IFactoryCatEmpleado
    {
        public CatEmpleado GetCatEmpleado(int id)
        {
            CatEmpleado catEmpleado = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    catEmpleado= contexto.CatEmpleados.Where(c => c.id == id).FirstOrDefault<CatEmpleado>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            return catEmpleado;
        }
        public CatEmpleado GetCatEmpleadoNombre(string nombre)
        {
            CatEmpleado catEmpleado = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                    catEmpleado = contexto.CatEmpleados.Where(c => c.strNombre == nombre).FirstOrDefault<CatEmpleado>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;              
            }
            return catEmpleado;
        }
        public CatEmpleado GetCatEmpleadoByExpresionEntity(Expression<Func<CatEmpleado, bool>> predicado)
        {
            CatEmpleado catEmpleado = null;
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                     catEmpleado = contexto.CatEmpleados.Where(predicado.Compile()).FirstOrDefault<CatEmpleado>();
                }
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;            
            }
            return catEmpleado;
        }
    }
}
