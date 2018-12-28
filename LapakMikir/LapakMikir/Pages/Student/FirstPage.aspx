<%----------------------------------------
 -- Created by: Dar 
 -- Date: December 27th, 2018
 -- Purpose: First Page
----------------------------------------%>

<%@ Page Title="" Language="C#" MasterPageFile="~/NavbarFooter.Master" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="title">Start Learning Java & SQL Now</h3>
    
        

        <div class="list">
            <asp:DropDownList ID="DropDownList1" class="list1" runat="server">
            <asp:ListItem>Java</asp:ListItem>
            <asp:ListItem>SQL</asp:ListItem>
            <asp:ListItem>Advanced Java</asp:ListItem> 
        </asp:DropDownList>

        </div>
        
        <div class="courses">
            <a href="JavaDesc.aspx" class="btn1">Java</a>
            <a href="SqlDesc.aspx" class="btn2">SQL</a>
            <a href="AdvJavaDesc.aspx" class="btn3">Advanced Java</a>
        </div>


    </div>
</asp:Content>
