<%----------------------------------------
 -- Created by: Dar 
 -- Date: December 27th, 2018
 -- Purpose: Course Desc(Adv Java)
----------------------------------------%>

<%@ Page Title="" Language="C#" MasterPageFile="~/NavbarFooter.Master" AutoEventWireup="true" CodeBehind="AdvJavaDesc.aspx.cs" Inherits="WebApplication2.AdvJavaDesc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="title">Advanced Java</h3>

    <div class="course_desc">
        <p style=" text-align:center; ">This course will show the more advanced theories of Java. Here are the material you will learn in this course.</p>
        <div class="descbox">
            1. Inheritance <br />
            2. Polymorphism <br />
            3. Encapsulation <br />
            4. GUI Basics <br />
            5. Advanced GUI Usage <br />
            6. Events <br />
            7. JDBC <br />
        </div>
        <div class="btnx">
            <a href="Index.aspx" id="btnx">Back</a>
        </div>
        
    </div>
</asp:Content>
