 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Configuration;
using System.Text;
using System.Threading;
using System.ComponentModel;




namespace GroupTelFV
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class orderUpdate : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest (HttpContext context)
        {
            if (context.Session["Login"] == null)
            {
                context.Response.Redirect("Login.aspx");
            }
            List<ProdList> tmp1 = (List<ProdList>)context.Application["LstProd"];
            List<OrderList> tmp4 = (List<OrderList>)context.Application["Lstorder"];
            string pid = context.Request["Pid"] + "";
            string email = context.Session["UserEmail"] + "";
            string Price = context.Session["Price"] + "";
            User tmp = (User)context.Session["Login"];
            int quantity = (int)context.Session["pquantity"];
            int quantity2 = (int)context.Session["Pquantity2"];
            int count = (quantity - (int)context.Session["count"] - 1);
            context.Response.ContentType = "text/plain";

            string Sql1 = $"Insert into T_order (Pid, Email,Ppic,Pname,Cid,Price,pquantity2) values(N'{pid}',N'{email}',N'{context.Session["Ppic"]}',N'{context.Session["Pname"]}',N'{context.Session["Cid"]}',N'{Price}',N'{quantity2}')";

            string Connstr1 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

            SqlConnection Conn1 = new SqlConnection(Connstr1);
            Conn1.Open();
            SqlCommand Cmd1 = new SqlCommand(Sql1, Conn1);
            Cmd1.ExecuteNonQuery();
            Conn1.Close();
            context.Response.Write("OK");
            string addresses = null;

            /*for mail order update*******************************************************************/

            for (int i = tmp4.Count - 1; i >= 0; i--)
            {
                if (pid == tmp4[i].pid.ToString())
                {
                    addresses += tmp4[i].Email + ',';
                    
                }

            }
            string emailSender1 = "grouptelgroup@gmail.com".ToString();
            string emailSenderPassword1 = "bjzcnmarlpsqrtfs".ToString();


            string[] splitAddresses = addresses.Split(','); 

            string emailSenderHost1 = "smtp.gmail.com".ToString();
            int emailSenderPort1 = Convert.ToInt16("587");
            Boolean emailIsSSL1 = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);

            //after purchase, send an update mail to all other users who purchased the product that another purchase has been done and also
            //display how many items left for purchase  of this product in the mail
            string FilePath1 = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\EmailTemplates\orderUpdate.html";
            StreamReader str1 = new StreamReader(FilePath1);
            string MailText1 = str1.ReadToEnd();
            str1.Close();

            MailText1 = MailText1.Replace("[Pname]", (string)context.Session["Pname"]);
            MailText1 = MailText1.Replace("[Price]", (string)context.Session["Price"]);
            MailText1 = MailText1.Replace("[Pdisc]", (string)context.Session["Pdisc"]);
            MailText1 = MailText1.Replace("[Pfineprint]", (string)context.Session["Pfineprint"]);
            MailText1 = MailText1.Replace("[count]", count.ToString());
            string img1 = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\" + (string)context.Session["Ppic"];


            string subject1 = "התבצעה עוד רכישה בקבוצה אליה אתם מקושרים!";
            //Base class for sending email  
            MailMessage _mailmsg1 = new MailMessage();

            //Make TRUE because our body text is html  
            _mailmsg1.IsBodyHtml = true;

            //Set From Email ID  
            _mailmsg1.From = new MailAddress(emailSender1);

            //Set To Email ID  
            _mailmsg1.To.Add(emailSender1);
            //create BCC list of users to update
            foreach(var address in splitAddresses)
            {
                if(address == "")
                    break;
                else
                _mailmsg1.Bcc.Add(address);
            }

            //Set Body Text of Email   
            _mailmsg1.Body = MailText1;
            //Set Subject  
            _mailmsg1.Subject = subject1;
            //for image
            AlternateView imgview1 = AlternateView.CreateAlternateViewFromString(_mailmsg1.Body, null, "text/html");
            LinkedResource lr1 = new LinkedResource(img1);
            lr1.ContentId = "imgpath1";
            imgview1.LinkedResources.Add(lr1);
            _mailmsg1.AlternateViews.Add(imgview1);




            //Now set your SMTP   
            SmtpClient _smtp1 = new SmtpClient();

            //Set HOST server SMTP detail  
            _smtp1.Host = emailSenderHost1;

            //Set PORT number of SMTP  
            _smtp1.Port = emailSenderPort1;

            //Set SSL --> True / False  
            _smtp1.EnableSsl = emailIsSSL1;

            //Set Sender UserEmailID, Password  
            NetworkCredential _network1 = new NetworkCredential(emailSender1, emailSenderPassword1);
            _smtp1.Credentials = _network1;

            //Send Method will send your MailMessage create above.  

            _smtp1.Send(_mailmsg1);

            /*for mail NEW END*/

            /*for mail order confirmation*******************************************************************/

            for (int i = 0; i < tmp1.Count; i++)
            {
                //send mail to user for order confirmation
                if (pid == tmp1[i].Pid.ToString())
                {
                    string emailSender = "grouptelgroup@gmail.com".ToString();
                    string emailSenderPassword = "bjzcnmarlpsqrtfs".ToString();




                    string emailSenderHost = "smtp.gmail.com".ToString();
                    int emailSenderPort = Convert.ToInt16("587");
                    Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                    string FilePath = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\EmailTemplates\OrderConfirmation.html";
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();
                    str.Close();

                    MailText = MailText.Replace("[Pname]", (string)context.Session["Pname"]);
                    MailText = MailText.Replace("[Price]", (string)context.Session["Price"]);
                    MailText = MailText.Replace("[Pdisc]", (string)context.Session["Pdisc"]);
                    MailText = MailText.Replace("[Pfineprint]", (string)context.Session["Pfineprint"]);
                    string img = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\" + (string)context.Session["Ppic"];
                    //MailText = MailText.Replace("[Ppic]", img);


                    string subject = "תודה על הזמנתך!";
                    //Base class for sending email  
                    MailMessage _mailmsg = new MailMessage();

                    //Make TRUE because our body text is html  
                    _mailmsg.IsBodyHtml = true;

                    //Set From Email ID  
                    _mailmsg.From = new MailAddress(emailSender);

                    //Set To Email ID  
                    _mailmsg.To.Add(email);

                    //Set Body Text of Email   
                    _mailmsg.Body = MailText;
                    //Set Subject  
                    _mailmsg.Subject = subject;
                    //for image
                    AlternateView imgview = AlternateView.CreateAlternateViewFromString(_mailmsg.Body /*+ @"<img src= cid:imgpath height=150 width=150> "*/, null, "text/html");
                    LinkedResource lr = new LinkedResource(img);
                    lr.ContentId = "imgpath";
                    imgview.LinkedResources.Add(lr);
                    _mailmsg.AlternateViews.Add(imgview);




                    //Now set your SMTP   
                    SmtpClient _smtp = new SmtpClient();

                    //Set HOST server SMTP detail  
                    _smtp.Host = emailSenderHost;

                    //Set PORT number of SMTP  
                    _smtp.Port = emailSenderPort;

                    //Set SSL --> True / False  
                    _smtp.EnableSsl = emailIsSSL;

                    //Set Sender UserEmailID, Password  
                    NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
                    _smtp.Credentials = _network;

                    //Send Method will send your MailMessage create above.  
                    _smtp.Send(_mailmsg);


                    /*for mail order confirmation END*/


                    break;
                }
            }






            




        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}