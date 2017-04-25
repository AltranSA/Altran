using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Factory.Ifactory;
using Altran.Data.Entities;
using Altran.Data;
using System.Linq.Expressions;

namespace Altran.Factory.flow
{
    public class FlowTblTarjetaBancaria:IFactoryTblTarjetaBancaria
    {
        public List<TblTarjetaBancaria> GetTblTarjetaBancariaById(Expression<Func<TblTarjetaBancaria, bool>> predicado)
        {
            List<TblTarjetaBancaria> tarjetasBancarias = new List<TblTarjetaBancaria>();
            try
            {
                using (DCAltranDataContext contexto = new DCAltranDataContext())
                {
                   tarjetasBancarias = contexto.TblTarjetaBancarias.Where(predicado.Compile()).ToList<TblTarjetaBancaria>();
                }

            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
            }
            System.GC.Collect();
            return tarjetasBancarias;
        }
    }
}
