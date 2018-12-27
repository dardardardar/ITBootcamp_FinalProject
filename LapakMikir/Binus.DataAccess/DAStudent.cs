/***
 * Created by: Jason
 * Date: December 24th, 2018
 * Purpose: Data access to student features
***/


using System;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Binus.DataAccess
{
    public class DAStudent
    {
        private Database DB;

        public DAStudent()
        {
            try
            {
                DB = DatabaseFactory.CreateDatabase("ConStr");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //...
    }
}
