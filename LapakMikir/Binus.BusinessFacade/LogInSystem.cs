/***
 * Created by: Jason
 * Date: December 24th, 2018
 * Purpose: Login system
***/


using System;
using Binus.Common.Data;
using Binus.DataAccess;

namespace Binus.BussinessFacade
{
    public class LogInSystem
    {
        public Student DoLogIn (Student Param)
        {
            return new DALogIn().DoLogIn(Param);
        }
    }
}
