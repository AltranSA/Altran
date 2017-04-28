using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Altran.Factory.Ifactory
{
   public interface  IFactoryTblVehiculo
    {
        List<IFactoryTblVehiculo> GetVehiculoByNoEconomico(Expression<Func<IFactoryTblVehiculo, bool>> predicado);
    }
}
