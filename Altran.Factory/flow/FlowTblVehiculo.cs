using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Altran.Data;
using Altran.Data.Entities;
namespace Altran.Factory.flow
{
  public  class FlowTblVehiculo
    {
        public TblVehiculo GetVehiculoByNoEconomico(string numeroEconomico)
        {
            TblVehiculo vehiculo = null;
            try
            {
                DCAltranDataContext contexto = new DCAltranDataContext();
                vehiculo = contexto.TblVehiculos.Where(p => p.strNumEconomico == numeroEconomico).FirstOrDefault<TblVehiculo>();
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;

            }
            return vehiculo;
        }

        /*
        public TblVehiculo GetVehiculoNoEconomico(string numeroEconomico)
        {
            TblVehiculo vehiculo = null;
            try
            {
                DCAltranDataContext contexto = new DCAltranDataContext();
                vehiculo =  contexto.TblVehiculos.Where(p => p.strNumEconomico == numeroEconomico).FirstOrDefault<TblVehiculo>();
            }
            catch (Exception ex)
            {
                string mensajeErr = ex.Message;
               
            }
            return vehiculo;
        }*/
    }
}
