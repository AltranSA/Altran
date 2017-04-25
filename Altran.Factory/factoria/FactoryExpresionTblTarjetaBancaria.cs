using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Altran.Data.Entities;
namespace Altran.Factory.factoria
{
    public static class FactoryExpresionTblTarjetaBancaria
    {
        public static Expression<Func<TblTarjetaBancaria, bool>> GetTblTarjetaBancariayId(int id)
        {
            Expression<Func<TblTarjetaBancaria, bool>> predicate = p => p.idEmpleado == id;
            return predicate;
        }
    }
}
