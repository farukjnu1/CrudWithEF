using CrudWithEF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudWithEF
{
    public partial class CustomerList : System.Web.UI.Page
    {
        private TestDBEntities db = new TestDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Reset();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
            try
            {
                Customer oCustomer = new Customer();
                oCustomer.FirstName = this.txtFirstName.Text.Trim();
                oCustomer.LastName = this.txtLastName.Text.Trim();
                oCustomer.Mobile = this.txtMobile.Text.Trim();
                oCustomer.Password = this.txtPassword.Text.Trim();
                oCustomer.Email = this.txtEmail.Text.Trim();
                db.Customers.Add(oCustomer);
                db.SaveChanges();

                this.LabelMessage.Text = "Save successfully.";

                Reset();
            }
            catch
            {
                this.LabelMessage.Text = "Can't add new Customer, internal server error.";
            }

        }

        protected void gvCust_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "edi")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                int id = Convert.ToInt32(gvCust.Rows[index].Cells[0].Text.TrimEnd());

                Customer oCustomer = db.Customers.Where(w => w.CustomerId == id).FirstOrDefault();
                if (oCustomer != null)
                {
                    this.HiddenCustomerId.Value = oCustomer.CustomerId.ToString();
                    this.txtFirstName.Text = oCustomer.FirstName;
                    this.txtLastName.Text = oCustomer.LastName;
                    this.txtMobile.Text = oCustomer.Mobile;
                    this.txtPassword.Text = oCustomer.Password;
                    this.txtEmail.Text = oCustomer.Email;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                }
            }

            if (e.CommandName == "del")
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                int id = Convert.ToInt32(gvCust.Rows[index].Cells[0].Text.TrimEnd());

                Customer oCustomer = db.Customers.Where(w => w.CustomerId == id).FirstOrDefault();
                if (oCustomer != null)
                {
                    // Cascade delete
                    // delete orders first before customer delete
                    List<Order> listOrder = db.Orders.Where(w => w.CustomerId == id).ToList();
                    db.Orders.RemoveRange(listOrder);

                    db.Customers.Remove(oCustomer);
                    db.SaveChanges();
                    this.LabelMessage.Text = "Remove successfully.";
                    Reset();
                }
            }

        }

        private void Reset()
        {
            this.HiddenCustomerId.Value = "";
            this.txtFirstName.Text = string.Empty;
            this.txtLastName.Text = "";
            this.txtMobile.Text = "";
            this.txtPassword.Text = "";
            this.txtEmail.Text = "";
            btnSave.Visible = true;
            btnUpdate.Visible = false;
            gvCust.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenCustomerId.Value);
            Customer oCustomer = db.Customers.Where(w => w.CustomerId == id).FirstOrDefault();
            if (oCustomer != null)
            {
                oCustomer.FirstName = this.txtFirstName.Text.Trim();
                oCustomer.LastName = this.txtLastName.Text.Trim();
                oCustomer.Mobile = this.txtMobile.Text.Trim();
                oCustomer.Password = this.txtPassword.Text.Trim();
                oCustomer.Email = this.txtEmail.Text.Trim();
                db.SaveChanges();

                this.LabelMessage.Text = "Update successfully.";
                Reset();
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
    }
}