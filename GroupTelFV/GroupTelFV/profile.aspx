<%@ Page Title="" Language="C#" MasterPageFile="~/misc.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="GroupTelFV.profile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/button.css?v1" rel="stylesheet" />
    <script> 

        //create a timer for suggested purchases
        var j = '<%=EndDateToDisplay%>';
        var myfunc = setInterval(function () {

            var now = new Date().getTime();
            var countDownDate = new Date(j).getTime();
            var timeleft = countDownDate - now;
            var days = Math.floor(timeleft / (1000 * 60 * 60 * 24));
            var hours = Math.floor((timeleft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((timeleft % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((timeleft % (1000 * 60)) / 1000);

            let dateStr = `${days}: ${hours}: ${minutes}: ${seconds}`;
            document.getElementById("dateForDisplay").innerHTML = dateStr;


            if (timeleft < 0) {
                clearInterval(myfunc);
                document.getElementById("days").innerHTML = ""
                document.getElementById("hours").innerHTML = ""
                document.getElementById("mins").innerHTML = ""
                document.getElementById("secs").innerHTML = ""
                document.getElementById("end").innerHTML = "TIME UP!!";


            }

        }, 1000)

    </script>
    <!--New-->
    <link href="CSS/WebFormProfileCss.css?v1" rel="stylesheet" />
    <!--end-->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!--New beggening-->
    <!-- display personal information of user in the profile page -->
    <div class="container">
        <h2 class="header">מידע אישי
        </h2>
        <div class="side">
            <img src="img/profile.jpg" class="img-profile" alt="profile picture" />
            <asp:Button runat="server" CssClass="btn btn-info inputs" ID="changeInfo" Text="עדכון פרטים" OnClick="changeInfo_Click" />
            <asp:Button ID="OrdBtn" runat="server" OnClick="OrdBtn_Click" CssClass="btn btn-info inputs" Text="לכל ההזמנות" />
            <asp:Button ID="btnLogOut" runat="server" CssClass="btn btn-logout inputs" OnClick="btnLogOut_Click" Text="התנתקות" />
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
        <!-- show previous orders (if any exists) -->
         <h2 class="header-secondary">הזמנות אחרונות</h2>
        <div class="last-order">
           
            <asp:Literal ID="LtlOrd" runat="server" />
            <asp:Repeater ID="RptOrder" runat="server">
                <ItemTemplate>
                    <div class="order-item">
                        <span class="order-name"><%#Eval("Pname") %></span>
                        <img src="<%#Eval("Ppic") %>" class="order-img" />
                        <p class="order-date">תאריך הזמנה: <%#Eval("Odate", "{0: dd/MM/yyyy}")%>  </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>        
        </div>
        <!-- display recommendations (based on searches in search engine in this specific session) -->
        <div class="recommendations">
            <h2 class="header-third">המלצות עבורך</h2>
            <asp:Literal ID="LtlRec" runat="server" />
            <asp:Repeater ID="RptRec" runat="server">
                <ItemTemplate>
                    <div class="order-item">
                        <span class="order-name"><%#Eval("Pname") %></span>
                        <img src="<%#Eval("Ppic") %>" class="order-img" />
                        <a href="joinGroup1.aspx?Pid=<%#Eval("Pid") %>" class="btn-purchase">לרכישה</a><br />
                        <div class="prod-timer">
                            <p class="countDown-text">זמן עד לסגירת הקבוצה </p>
                            <p id="dateForDisplay" class="countDown"></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!--New end-->

   
</asp:Content>
