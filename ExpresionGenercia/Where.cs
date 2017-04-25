using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data;
using Altran.Data.Entities;
using System.Data.Linq;
using System.Linq.Expressions;

namespace ExpresionGenercia
{
    public static class Where<T> where T:class,IBaseTable,IBaseCatalog
    {

        public static Expression<Func<T, bool>> GetCatalogById(int id)
        {
            Expression<Func<T, bool>> predicate = p => p.id == id;
            return predicate;
        }

        public static Expression<Func<T, bool>> GetCatalogByStrValor(string strvalor)
        {
            Expression<Func<T, bool>> predicate = p => p.strValor == strvalor;
            return predicate;
        }

        public static Expression<Func<T, bool>> GetTableById(int id)
        {
            Expression<Func<T, bool>> predicate = p => p.id == id;
            return predicate;
        }



    }
}
