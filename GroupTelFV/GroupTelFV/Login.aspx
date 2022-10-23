<%@ Page Title="" Language="C#" MasterPageFile="~/misc.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GroupTelFV.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <center> 
 
<div class="grid-log">
    
                <!--- For Name---->
               <div class="flex-1">
                            <label class="label" ;">  </label>
                        
                       
                            <asp:TextBox ID="identity" placeholder=" הזן אימייל" runat="server" CssClass="form-control inputs" />
                       
                        <asp:RequiredFieldValidator ID="identityVal" runat="server" ControlToValidate="identity" ErrorMessage="*הזן אימייל" ForeColor="red" />
                   
                <!-----For Password----->
                
                            <label class="label" "> </label>
                      
                            <asp:TextBox ID="UserPass" placeholder="הזן סיסמה" runat="server" TextMode="Password" CssClass="form-control inputs" />
                        <asp:RequiredFieldValidator ID="PassVal" runat="server" ControlToValidate="UserPass" ErrorMessage="*הזן סיסמא" ForeColor="Red" />
                   
               
                        <asp:Literal ID="userInfo" runat="server"></asp:Literal>
                        <asp:Literal ID="LtlLogin" runat="server"></asp:Literal>
   
                    <asp:Button ID="RegButton" runat="server"  OnClick="RegButton_Click1" CssClass="btn-log inputs" type="button" Text="התחבר" /><br />
                      <a href="Default.aspx" class="btn-log1">לדף הבית</a>
                    
                    
    

                
        <div class="register">
             <br />
            <span >עדיין לא רשומים? </span><a  href="Register.aspx" class="registerTxt">להרשמה</a>
        </div>
</div>
    <div class="flex-2">
        <img src="img/login.jpg" class="img-log" />
    </div>
    </div>

</center> 
    <br /><br />
</asp:Content>
