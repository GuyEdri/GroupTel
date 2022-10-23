<%@ Page Title="" Language="C#" MasterPageFile="~/general.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GroupTelFV.Default" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Query-Default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
     <br /><br />
    <%-- HOTELS repeater --%>
     <h5 class="heading-fifth">חופשות>> <a class="btn-nav" href="showallprods.aspx?Cid=1">צפייה בהכול</a></h5>

    <section class="prod-section">
        <div class="prod-item">
            <asp:Repeater ID="DataList1" runat="server">
                <ItemTemplate>
                   <div class="prod-box">
                   <img src="<%#Eval("Ppic") %>" class="prod-img" />
                    <div class="grid-quantity-name">
                   <div class="prod-name"><%#Eval("Pname") %></div>
                        <asp:Literal runat="server" ID="LtlMsg" ></asp:Literal>
                    </div>
                   <div class="grid-price-btn">
                   <a href="#" class="price">₪<%#Eval("Price") %></a>
                   <a href="JoinGroup1.aspx?Pid=<%#Eval("Pid") %>" class="prod-btn"> לרכישה</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div>
            
        </div>
    </section>
   

    <%-- ELECTRONIC repeater --%>
            <h5 class="heading-fifth">אלקטרוניקה>> <a class="btn-nav" href="showallprods.aspx?Cid=2">צפייה בהכול</a></h5>
    <section class="prod-section">
        <div class="prod-item">
            <asp:Repeater ID="DataList2" runat="server">
                <ItemTemplate>
                    <div class="prod-box">
                   <img src="<%#Eval("Ppic") %>" class="prod-img" />
                   <div class="prod-name"><%#Eval("Pname") %></div>
                   <a href="#" class="price">₪<%#Eval("Price") %></a>
                   <a href="JoinGroup1.aspx?Pid=<%#Eval("Pid") %>" class="prod-btn"> לרכישה</a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
   

    <%-- FURNITURES repeater --%>

    <h5 class="heading-fifth">ריהוט>> <a class="btn-nav" href="showallprods.aspx?Cid=3">צפייה בהכול</a></h5>
    <section class="prod-section">
        <div class="prod-item">
            <asp:Repeater ID="DataList3" runat="server">
                <ItemTemplate>
                    <div class="prod-box">
                   <img src="<%#Eval("Ppic") %>" class="prod-img" />
                   <div class="prod-name"><%#Eval("Pname") %></div>
                   <a href="#" class="price">₪<%#Eval("Price") %></a>
                   <a href="JoinGroup1.aspx?Pid=<%#Eval("Pid") %>" class="prod-btn"> לרכישה</a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
        <script  src="//code.tidio.co/41ys4q70e9ys6wkagae894wz3fqv4viu.js" async></script>

</asp:Content>
