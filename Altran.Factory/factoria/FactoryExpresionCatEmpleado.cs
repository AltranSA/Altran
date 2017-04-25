using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Altran.Data;
using Altran.Data.Entities;
using Altran.Factory.Ifactory;
namespace Altran.Factory.factoria
{
    public static class FactoryExpresionCatEmpleado 
    {
        public static Expression<Func<CatEmpleado, bool>> GetCatEmpleadoByRfc(string rfc)
        {
            Expression<Func<CatEmpleado, bool>> predicate = p => p.strRfc == rfc;
            return predicate;
        }
        public static Expression<Func<CatEmpleado, bool>> GetCatEmpleadoByCurp(string curp)
        {
            Expression<Func<CatEmpleado, bool>> predicate = p => p.strCurp == curp;
            return predicate;
        }
        public static Expression<Func<CatEmpleado, bool>> GetCatEmpleadoById(int id)
        {
            Expression<Func<CatEmpleado, bool>> predicate = p => p.id == id;
            return predicate;
        }

        public static Expression<Func<CatEmpleado, bool>> GetCatEmpleadoByIdRfcCurp(int id, string curp, string rfc)
        {
            Expression<Func<CatEmpleado, bool>> predicate = p => p.id == id && p.strRfc==rfc && p.strCurp==curp;
            return predicate;
        }

    }
}
