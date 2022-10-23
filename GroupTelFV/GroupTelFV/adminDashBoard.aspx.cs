using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Management;

namespace GroupTelFV
{
    public partial class adminDashBoard : System.Web.UI.Page
    {
        public double JSvactionYearlyPercentage;
        public double JSelectronicYearlyPernectage;
        public double JSfurnitureYearlyPercentage;

        public double JSactionMonthlyPercentage;
        public double JSelectronicMonthlyPercentage;
        public double JSfurnitureMonthlyPercentage;

        protected void Page_Load(object sender, EventArgs e)
        {
            //check if admin is logged in and if not, send admin to login page for admins
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
            else
            {
                // list of orders from global file
                List<OrderList> Lstorder = (List<OrderList>)Application["Lstorder"];
                
                int j;
                long yearPrice = 0, monthPrice = 0, totalPrice=0;
                //calculate yearly and monthly earnings according to the orders
                for (j = 0; j < Lstorder.Count; j++)
                {
                        if (Lstorder[j].Pquantity2 != 2)
                    {
                        //yearly income calculation
                        totalPrice += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                        if (DateTime.Today.Year == Lstorder[j].Odate.Year)
                        {
                            yearPrice += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                        }
                        //monthly income calculation
                        if (DateTime.Today.Month == Lstorder[j].Odate.Month)
                        {
                            monthPrice += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));

                        }
                    }                    
                    
                }
                //check how many closed and open groups there are
                List<ProdList> prodLists = (List<ProdList>)Application["LstProd"];
                int i, closedGroups = 0, openGroups = 0, closedGroupNoBuyers = 0;
                for (i = 0; i < prodLists.Count; i++)
                {
                    //how many closed groups due to all products purchased before timer came to 0
                    if (prodLists[i].Pquantity2 == 3)
                    {
                        closedGroups++;
                    }
                    //how many open groups are there 
                    else if (prodLists[i].Pquantity2 == 0)
                    {
                        openGroups++;
                    }
                    //how many closed groups due to not sufficient buyers
                    else if (prodLists[i].Pquantity2 == 4)
                    {

                        closedGroupNoBuyers++;
                    }
                }
                closedGroup.Text = closedGroups.ToString();
                openGroup.Text = openGroups.ToString();
                closedNoBuyers.Text = closedGroupNoBuyers.ToString();

                monthlyEarnings.Text = '₪' + "" + monthPrice.ToString();
                yearlyEarnings.Text = '₪' + "" + yearPrice.ToString();
                totalEarnings.Text = '₪' + "" + totalPrice.ToString();


                double vactionincomeI = 0, electronicIncomeI = 0, furnitureIncomeI = 0, vactionincomeIM = 0, electronicIncomeIM = 0, furnitureIncomeIM = 0;
                double yearlyIncome = 0, monthlyIncome = 0, vactionYearlyPercentage = 0, electronicYearlyPernectage = 0, furnitureYearlyPercentage = 0, vactionMonthlyPercentage = 0, electronicMonthlyPercentage = 0, furnitureMonthlyPercentage = 0;
                for (j = 0; j < Lstorder.Count; j++)
                {
                    //calculation of income per category
                    if(Lstorder[j].Pquantity2 != 4) 
                    { 
                        if (Lstorder[j].Cid == 1 )
                        {
                            vactionincomeI += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                        }
                        else if (Lstorder[j].Cid == 2)
                        {
                            electronicIncomeI += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                        }
                        else if (Lstorder[j].Cid == 3 )
                        {
                            furnitureIncomeI += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                        }
                        //calculation of monthly income per category
                        if (DateTime.Today.Month == Lstorder[j].Odate.Month)
                        {
                            if (Lstorder[j].Cid == 1 )
                            {
                                vactionincomeIM += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                            }
                            else if (Lstorder[j].Cid == 2 )
                            {
                                electronicIncomeIM += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                            }
                            else if (Lstorder[j].Cid == 3 )
                            {
                                furnitureIncomeIM += Convert.ToInt64(Convert.ToDecimal(Lstorder[j].Price));
                            }
                        }
                    }
                }
               
                //total income
                yearlyIncome = (int)(vactionincomeI + electronicIncomeI + furnitureIncomeI);
                monthlyIncome = (int)(vactionincomeIM + electronicIncomeIM + furnitureIncomeIM);
               

                //per category yearlyIncome
                vactionYearlyPercentage = (int)((vactionincomeI / yearlyIncome) * 100) + 1;
                electronicYearlyPernectage = (int)((electronicIncomeI / yearlyIncome) * 100);
                furnitureYearlyPercentage = (int)((furnitureIncomeI / yearlyIncome) * 100);


                //per category monthlyIncome
                vactionMonthlyPercentage = (int)((vactionincomeIM / monthlyIncome) * 100) + 1;
                electronicMonthlyPercentage = (int)((electronicIncomeIM / monthlyIncome) * 100);
                furnitureMonthlyPercentage = (int)((furnitureIncomeIM / monthlyIncome) * 100);

                //JS background ProgressBar color
                JSvactionYearlyPercentage = vactionYearlyPercentage;
                JSelectronicYearlyPernectage = electronicYearlyPernectage;
                JSfurnitureYearlyPercentage = furnitureYearlyPercentage;

                JSactionMonthlyPercentage = vactionMonthlyPercentage;
                JSelectronicMonthlyPercentage = electronicMonthlyPercentage;
                JSfurnitureMonthlyPercentage = furnitureMonthlyPercentage;

                //yearlyPercentage
                vacationPercentageYearly.Text = vactionYearlyPercentage.ToString() + '%';
                electronicPercentageYearly.Text = electronicYearlyPernectage.ToString() + '%';
                furniturePercentageYearly.Text = furnitureYearlyPercentage.ToString() + '%';

                //monthlyPercentage
                vacationPercentageMonthly.Text = vactionMonthlyPercentage.ToString() + '%';
                electronicPercentageMonthly.Text = electronicMonthlyPercentage.ToString() + '%';
                furniturePercentageMonthly.Text = furnitureMonthlyPercentage.ToString() + '%';


                vacationIncomeMonth.Text = '₪' + "" + vactionincomeIM.ToString();
                electronicIncomeMonth.Text = '₪' + "" + electronicIncomeIM.ToString();
                furnitureIncomeMonth.Text = '₪' + "" + furnitureIncomeIM.ToString();
                vacationIncome.Text = '₪' + "" + vactionincomeI.ToString();
                electronicIncome.Text = '₪' + "" + electronicIncomeI.ToString();
                furnitureIncome.Text = '₪' + "" + furnitureIncomeI.ToString();

               
            }
            //display role of admin.
            if ((string)Session["UserEmail"] == "guyedrix2@gmail.com")
            {
                profilePicture.ImageUrl = "img/" + "CEO.jpg";
                profileRole.InnerText = "CEO";
            }
            else if ((string)Session["UserEmail"] == "elirannakash7@gmail.com")
            {
                profilePicture.ImageUrl = "img/" + "FOUNDER.jpg";
                profileRole.InnerText = "FOUNDER";
            }
        }
        //upload product to database
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (imgUpload.PostedFile.FileName != "")
            {
                /*Upload a product*/

                string imgFile = Path.GetFileName(imgUpload.PostedFile.FileName);
                string Image = "img/" + imgFile;
                imgUpload.SaveAs(@"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\img\" + imgFile);
                string mainConn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
                SqlConnection sqlConn = new SqlConnection(mainConn);
                sqlConn.Open();
                string sqlQuery = $"Insert into T_Prod(Cid,MenuCat,Pname, Price,Pdisc, Pfineprint,Pquantity,Paddress, EndDate,Ppic) values (N'{productCid.Text}', N'{productMenuCat.Text}', N'{productName.Text}', N'{productPrice.Text}', N'{productDisc.Text}', N'{productText.Text}', N'{productQuantity.Text}',N'{productAddress.Text}', N'{productDate.Text}', N'{Image}')";
                SqlCommand sqlComm = new SqlCommand(sqlQuery, sqlConn);
                sqlComm.ExecuteNonQuery();
                ltlMsg.Text = "העלאה בוצעה בהצלחה";
                sqlConn.Close();
            }
            else
            {
                ltlMsg.Text = "העלאה לא בוצעה, נא בחר קובץ";
            }
        }
        //search engine
        protected void searchBtn_Click(object sender, EventArgs e)
        {
            Session["results"] = searchBox.Text;
            Response.Redirect("results.aspx");

        }
    }


}