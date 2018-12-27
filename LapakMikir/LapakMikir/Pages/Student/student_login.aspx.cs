using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BussinessFacade;
using Binus.Common.Data;


namespace LapakMikir.Pages.Student
{
    public partial class student_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text;
            string Password = txtPassword.Text;

            Binus.Common.Data.Student Login = new Binus.Common.Data.Student
            {
                studentEmail = Email,
                studentPassword = Password
            };

            Binus.Common.Data.Student DoLogIn = new LogInSystem().DoLogIn(Login);

            if(DoLogIn == null)
            {
                lblErrorMsg.Text = "Please input username & password!";
            }
            else
            {
                if(Login.studentPassword == DoLogIn.studentPassword)
                {
                    Session["Email"] = DoLogIn.studentEmail;
                    Session["ID"] = DoLogIn.studentID;

                    Response.Redirect("student_dashboard.aspx");
                }
                else
                {
                    lblErrorMsg.Text = "Invalid username & password!";
                }
            }
        }
    }
}