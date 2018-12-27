/***
 * Created by: Jason
 * Date: December 24th, 2018
 * Purpose: Data access to login
***/


using System;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Binus.Common.Data;

namespace Binus.DataAccess
{
    public class DALogIn
    {
        private Database DB;

        public DALogIn()
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

        public Student DoLogIn(Student Param)
        {
            Student RetVal = null;

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_doLogIn");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);
                DB.AddInParameter(dbCommand, "Password", DbType.String, Param.studentPassword);

                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    while (Reader.Read())
                    {
                        RetVal = new Student();
                        RetVal.studentEmail = Reader["studentEmail"].ToString();
                        RetVal.studentPassword = Reader["studentPassword"].ToString();
                    }

                    Reader.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return null;
        }
    }
}
