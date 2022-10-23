<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change.aspx.cs" Inherits="GroupTelFV.change" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>עדכון פרטים</title>
<link href="CSS/change.css?v3" rel="stylesheet" />
<%--    <link href="CSS/Query-size.css?v1" rel="stylesheet" />--%>
    <meta name="viewport" content="width=device-width",initail-scale="1.0" />
</head>
<body>
    <form id="form1" class="form-change" runat="server" dir="rtl">

            <nav class="nav">
                <ul class="main-nav-change">
                    <li><a class="main-nav-change" href="Default.aspx">בית</a></li>
                    <li><a><asp:Button ID="logout" CssClass="logout" runat="server" OnClick="logout_Click" Text="התנתקות" /></a></li>
                    <li> <asp:TextBox runat="server" ID="searchBox" placeholder="מה ברצונכם למצוא?" CssClass="search1-change" /></li>
                    <li><asp:Button runat="server" ID="searchBtn" Text="מצא" OnClick="searchBtn_Click" CssClass="btn-search-change" /></li>
                </ul>   
            </nav>
        

         <div class="container">
             <div class="header">
              <h2>מידע אישי</h2>
             </div>

            <div class="info">
            <div class="info-header">
                <p>שם</p>
                <p>סיסמה</p>
                <p>אימייל</p>
                <p>טלפון</p>
            </div>
        </div>
             
        <div class="info-value">
            <asp:TextBox ID="UserName" runat="server" ReadOnly="true" CssClass="profile-info inputs" />
            <asp:TextBox ID="UserPass" runat="server" ReadOnly="true" CssClass="profile-info inputs" />
            <asp:TextBox ID="UserEmail" runat="server" ReadOnly="true" CssClass="profile-info inputs" />
            <asp:TextBox ID="UserPhone" runat="server" ReadOnly="true" CssClass="profile-info inputs" />
        </div>

             <div>
                  <span class="literal-change-phone">
             <asp:Literal ID="LtlPass" runat="server"/>
             </span>
                 <%-- change phone number or password for user --%>
                    <div class="info-grid-change2"><br />
                    <asp:TextBox ID="NewPhone" runat="server" placeholder="שינוי טלפון" CssClass="change-info inputs" />
                        <asp:RegularExpressionValidator ID="PhoneVal" runat="server" ErrorMessage="*נא להזין מספר תקין כולל איזור חיוג" ValidationExpression="^([0-9]{10})*$" ControlToValidate="NewPhone" ForeColor="Red" /><br />
                   <asp:Button runat="server" CssClass="logout inputs" ID="changeInfo" Text="עדכון פרטים" OnClick="changeInfo_Click" />
                  <asp:TextBox ID="NewPass" runat="server" placeholder="שינוי סיסמה" CssClass="change-info inputs"/>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*נא להזין סיסמה עם לפחות 5 תווים" ValidationExpression="^([a-zA-Z0-9_.-]{5,})*$" ControlToValidate="NewPass" ForeColor="Red" /><br />
                        <asp:Button ID="changePass" runat="server" Text="עדכון פרטים" OnClick="changePass_Click" CssClass="logout inputs" />
             </div>
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
    <script src="JS/nav.js"></script>

</body>
</html>
