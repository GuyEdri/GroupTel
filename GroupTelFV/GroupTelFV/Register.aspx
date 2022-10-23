<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GroupTelFV.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>הרשמה</title>
    <link href="CSS/login2.css?v6" rel="stylesheet" />
<%--    <link href="CSS/Query-size.css" rel="stylesheet" />--%>
    <link href="CSS/navbar.css?v5" rel="stylesheet" />
   <meta name="viewport" content="width=device-width",initail-scale="1.0" />

</head>
<body class="body-reg" >
    
        <div class="top-row" dir="rtl"    >
		<button type="button" class="nav-btn">
			<span class="material-icons">
				תפריט
			</span>
		</button>
		
	</div>
         <header class="nav-overlay" >
       
        <nav class="nav" style="display:flex; flex-direction:column;" dir="rtl"> 
            
            
                <a class="nav-link" href="Default.aspx" >בית</a>
                <a class="nav-link" href="Login.aspx" >הרשמה/התחברות</a>
                <%--<li><a class="main-nav-link" href="index.aspx" >קטגוריות מוצרים</a></li>--%>
               <a class="nav-link" href="contact.aspx" >צרו קשר</a>
                <a class="nav-link1" href="profile.aspx" >איזור אישי</a>

           
          
    
     </nav>
       
       </header>
       
            <div>
                <p class="logo">GroupTel</p> 
            </div>
        
          <form id="form1" runat="server" dir="rtl">  

              

        
 

<div class="grid-log-reg" >
    <div class="flex-1">

    
                <!--- For Name---->
                  
                            <label class="identity" style="color:white;"  ></label>
                       
                            <asp:TextBox ID="UserName" placeholder=" הזן שם " runat="server" CssClass="form-control-reg inputs" />
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="*הזן שם משתמש" ForeColor="red" />
                 




    <%-- FOR EMAIL --%>
               
                            <label class="identity" style="color:white; "> </label>
                      
                            <asp:TextBox ID="identity" placeholder=" הזן אימייל" runat="server" CssClass="form-control-reg inputs" />
                      
                        <asp:RequiredFieldValidator ID="identityVal" runat="server" ControlToValidate="identity" ErrorMessage="*הזן אימייל" ForeColor="red" />
                   

    <%-- FOR PHONE --%>
     
                            <label class="mail"  style="color:white;"></label>
                        
                            <asp:TextBox ID="Phone" placeholder=" הזן מספר טלפון" runat="server" CssClass="form-control-reg inputs" />
                      
                        <asp:RegularExpressionValidator ID="PhoneVal" runat="server" ErrorMessage="*נא להזין מספר תקין כולל איזור חיוג" ValidationExpression="^([0-9]{10})$" ControlToValidate="Phone" ForeColor="Red" />
                   
    <div class="grid-layout1">


                <!-----For Password----->
               
                            <label class="pass" style="color:white;"></label>
                       
                            <asp:TextBox ID="UserPass" placeholder=" (לפחות 5 תווים)הזן סיסמה" runat="server" TextMode="Password" CssClass="form-control-reg inputs" /><br />
                       
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*נא להזין סיסמה עם לפחות 5 תווים" ValidationExpression="^([\w]{5,})$" ControlToValidate="UserPass" ForeColor="Red" />

                 


            <%-- PASSWORD CONFIRMATION --%>
      
                            <label class="pass" style="color:white;"></label>
                       
                            <asp:TextBox ID="UserPass2" placeholder="אימות סיסמה" runat="server" TextMode="Password" CssClass="form-control-reg inputs" />
                        
                        <asp:CompareValidator ID="CmpPass" runat="server" ControlToCompare="UserPass" ControlToValidate="UserPass2"  ErrorMessage="*סיסמא ואימות סיסמא אינם תואמים" ForeColor="Red" />
                 



              
                        <asp:Literal ID="userInfo" runat="server"></asp:Literal>
                        <asp:Literal ID="LtlLogin" runat="server"></asp:Literal>
             
    </div>
    
       

                
                    <asp:Button ID="RegButton" runat="server"  OnClick="RegButton_Click" CssClass="btn-log inputs" type="button" Text="הרשמה"  /><br /><br />

               
        
        <div class="grid-layout3">
                  <p >כבר רשומים?      <a href="Login.aspx" style="" class="home-button1" ">     התחברות</a>   </p>           
                     <br /> <a href="Default.aspx" class="btn-log1" style= "margin-right:.9rem; "><ion-icon name="home-outline"></ion-icon>  לדף בית</a>
        </div>

                 
            </div>
    <div class="flex-2">
        <img src="img/login.jpg" class="img-log"/>
    </div>



    </div>
            
    </form>
    <footer>
        <div class="footer-grid">

            <div class="about-us">
                <h3 class="heading-third">עלינו</h3>
                <p>
                    זירת השופינג של גרופטל מרכזת חוויות ומוצרים בהנחות ממש משתלמות. מידי יום מתעדכנות באתר הצעות חדשות כך שלרגע לא משעמם פה.
בין היתר תוכלו למצוא כאן הנחות ל: ימי כיף בבתי מלון, ארוחות מפנקות במסעדות, הצגות והופעות, פעילויות לכל המשפחה, אטרקציות לילדים, סדנאות ועוד יםםםם אפשרויות שמכניסות עוד קצת צבע והרבה כיף לחיים.
בנוסף, תמצאו באתר באליגם מוצרים לבית, מוצרי חשמל ואלקטרוניקה, מחשוב, פריטי אופנה וספורט, מוצרי טיפוח ופארם, צעצועים ועוד מאות מוצרים שהופכים את היום יום לנוחים ומפנקים יותר בלי לקרוע את הכיס.
אנחנו חברת אולטימייט ווקיישן מתחייבים בזאת שהלקוח תמיד בראש סדר העדיפיות צברנו ותק בשוק של עשרות שנים ואנחנו כאן כדי להוכיח זאת
                </p>
            </div>
            <div class="footer-collabs">
                <h3 class="heading-third">בשיתוף פעולה</h3>
                <p>
                    <a href="https://www.fattal.co.il/" target="_blank">
                        <img src="img/logo/fattal.jpg" class="footer-img-collabs" alt="fatal logo" />
                    </a>

                    <a href="https://www.isrotel.co.il/" target="_blank">
                        <img src="img/logo/isrotel.jpg" class="footer-img-collabs" alt="isrotel logo" />
                    </a>

                    <a href="https://www.payngo.co.il/" target="_blank">
                        <img src="img/logo/hashmal.png" class="footer-img-collabs" alt="mahsanei hashmal logo" />
                    </a>

                    <a href="https://www.shw.co.il/" target="blank">
                        <img src="img/logo/shomrat.png" class="footer-img-collabs" alt="shomrat logo" />
                    </a>

                    <a href="https://ace.co.il" target="_blank">
                        <img src="img/logo/ace.jpg" class="footer-img-collabs" alt="ace logo" />
                    </a>

                    <a href="https://homecenter.co.il" target="_blank">
                        <img src="img/logo/home-center.jpg" class="footer-img-collabs" alt="home center logo" />
                    </a>

                </p>

            </div>
            <div class="footer-contact">
                <h3 class="heading-third">צור קשר</h3>
                <p>
                    <a href="mailto:UltimateVacation@gmail.com">
                        <ion-icon name="mail-open-outline" class="icon"></ion-icon>
                        grouptelgroup@gmail.com 
                    </a>
                </p>
                <p>
                    <ion-icon name="phone-portrait-outline" class="icon"></ion-icon>
                    <a href="tel:0522255447">052-2255447</a>
                </p>
                <p>
                    <ion-icon name="call-outline" class="icon"></ion-icon>
                    08-8555208    
                </p>
            </div>
            <div class="hideAdmin">
                <a href="adminDashBoard.aspx">כניסת אדמין</a>
            </div>
        </div>
        <div class="footer-rights" dir="ltr">
            <p>
                <a href="#" style="text-decoration: none;">©<span id="year"></span>   <strong class="text-warning">GoupTel</strong> כל הזכויות שמורות ל 
                                
                                   
                </a>
            </p>
        </div>
    </footer>
    <script src="JS/CopyRight.js"></script>
        <script src="https://apis.google.com/js/platform.js" async="async" defer="defer"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule="nomodule" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="JS/navbar.js"></script>
    <script>
        const btn = document.getElementById("RegButton");
        btn.addEventListener("click", function () {
            window.location.reload();
        });
    </script>
</body>
</html>