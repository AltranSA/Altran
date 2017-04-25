using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Altran.Data.Entities;
using Altran.Data;


namespace Altran.Factory.flow
{
    public class flowModeloVehiculo
    {
        public List<CatModeloVehiculo> GetModeloVehiculoByIdMarcaVehiculo(int id)
        {
            List<CatModeloVehiculo> modelos = new List<CatModeloVehiculo>();
            using (DCAltranDataContext contexto = new DCAltranDataContext())
            {
                return modelos = contexto.CatModeloVehiculos.Where(p => p.idMarca == id).ToList<CatModeloVehiculo>();
            }

        }
    }
}
