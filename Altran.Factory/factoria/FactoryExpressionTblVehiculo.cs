using Altran.Data;
using Altran.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Altran.Factory.factoria
{
   public static class FactoryExpressionTblVehiculo
    {

        public static Expression<Func<TblVehiculo, bool>> GetVehiculoByNoEconomico(string NoEconomico)
        {
            Expression<Func<TblVehiculo, bool>> predicate = p => p.strNumEconomico == NoEconomico;
            return predicate;
        }

    }
}
