<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="GroupTelFV.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>צור קשר</title>
    <link href="CSS/navbar.css?v5" rel="stylesheet" />
    <link href="CSS/contact.css?v2" rel="stylesheet" />
      <meta name="viewport" content="width=device-width",initail-scale="1.0" />
</head>
<body dir="rtl">
      <div class="top-row" >
		<button type="button" class="nav-btn">
			<span class="material-icons">
				תפריט
			</span>
		</button>
		
	</div>
      <header class="nav-overlay ">
       
        <nav class="nav nav-open"  > 
            
            
                <a class="nav-link"  href="Default.aspx" >בית</a>
                <a class="nav-link" href="Login.aspx" >הרשמה/התחברות</a>
                <%--<li><a class="main-nav-link" href="index.aspx" >קטגוריות מוצרים</a></li>--%>
               <a class="nav-link" href="contact.aspx" >צרו קשר</a>
                <a class="nav-link1" href="profile.aspx" >איזור אישי</a>

           
          
    
     </nav>
       
       </header>
    <form id="form1" runat="server">
        <center>
        <section class="contact-main">
            <center>
            <a href="mailto:grouptelgroup@gmail.com" class="a">ניתן לשלוח מייל כאן</a>
                </center>
            <center>
            <div class="phone">
                <a href="tel:0522255447"><p>כמו כן ניתן ליצור קשר במספרי הטלפון:<br /> 052-2255447 <br /><a href="tel:088555208">08-8555208</a></p></a>
                
<%--            <p> כמו כן ניתן ליצור קשר במספרי הטלפון: <br />08-8555208<br />052-2255447</p>      --%>
            </div>
                </center>
        </section>
            </center>
    </form>
</body>
<script src="JS/nav.js"></script>
<script src="JS/navbar.js"></script>
</html>
