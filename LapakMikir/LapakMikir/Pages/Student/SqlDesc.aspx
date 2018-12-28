<%----------------------------------------
 -- Created by: Dar 
 -- Date: December 27th, 2018
 -- Purpose: Course Desc(Sql)
----------------------------------------%>

<%@ Page Title="" Language="C#" MasterPageFile="~/NavbarFooter.Master" AutoEventWireup="true" CodeBehind="SqlDesc.aspx.cs" Inherits="WebApplication2.Sql" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="title">SQL</h3>

    <div class="course_desc">
        <p style=" text-align:center; ">This course revolves around the basics theories of SQL. Here are the material you will learn in this course.</p>
        <div class="descbox">
            1. SELECT <br />
            2. WHERE <br />
            3. LIKE <br />
            4. FUNCTION <br />
            5. VIEW <br />
            6. Stored Procedure <br />
        </div>
        <div class="btnx">
            <a href="FirstPage.aspx" id="btnx">Back</a>
        </div>
        
    </div>
</asp:Content>
