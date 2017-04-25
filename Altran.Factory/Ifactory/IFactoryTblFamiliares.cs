using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data.Entities;
using System.Linq.Expressions;

namespace Altran.Factory.Ifactory
{
    public interface IFactoryTblFamiliares
    {
        List<TblFamiliar> GetTblDatosFamiliaresById(Expression<Func<TblFamiliar, bool>> predicado);
    }
}
