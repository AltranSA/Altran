using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data.Entities;
using System.Linq.Expressions;

namespace Altran.Factory.factoria
{
    public static class FactoryExpressionTblFamiliares
    {
        public static Expression<Func<TblFamiliar, bool>> GetTblFamiliaresById(int id)
        {
            Expression<Func<TblFamiliar, bool>> predicate = p => p.idEmpleado == id;
            return predicate;
        }
    }
}
