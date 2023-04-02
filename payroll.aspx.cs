using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OracleClient;
using System.IO;
using System.Xml.Linq;

public partial class Default2 : System.Web.UI.Page
{
    DbAccess db = new DbAccess("IFSWEBED");
    string str1, str2,str3,str4;    

    protected void Page_Load(object sender, EventArgs e)
    {
        SetFocus(T_PBNO);
        dis_data();

    }
    protected void T_TID_TextChanged(object sender, EventArgs e)
    {
        SetFocus(T_MONTH);
    } 
    protected void T_MONTH_TextChanged(object sender, EventArgs e)
    {
        SetFocus(T_BASIC);
    }

    protected void T_PBNO_TextChanged(object sender, EventArgs e)
    {
        str3 = @"select * from mrp.payroll where pb_no = '" + T_PBNO.Text + "' ";
        OracleDataReader dr;
        dr = db.GetDataReader(str3);
        if (dr.HasRows)
        {
            dr.Read();
            {
                T_TID.Text = dr["transaction_id"].ToString();
                T_MONTH.Text = dr["month"].ToString();
                T_BASIC.Text = dr["basic"].ToString();
                T_DA.Text = dr["da"].ToString();
                T_HRA.Text = dr["hra"].ToString();
                T_NSALARY.Text = dr["emp_net_salary"].ToString();
            }
        }
        else
        {
            SetFocus(T_TID);
        }
    }
    
    protected void T_BASIC_TextChanged1(object sender, EventArgs e)
    {
        //Net salary calculation
        double Basic, DA, HRA, N_SALARY;
       
        Basic = Convert.ToInt32(T_BASIC.Text);

        DA = Basic * 0.4;
        HRA = Basic * 0.2;
        N_SALARY = Basic + DA + HRA ;

        T_DA.Text = DA.ToString();
        T_HRA.Text = HRA.ToString();
        T_NSALARY.Text = N_SALARY.ToString() ;
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        submit_rec();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public void dis_data()
    {
        str1 = @"select pb_no,transaction_id,month,basic,da,hra,emp_net_salary from mrp.payroll";

        GridView1.DataSource = db.GetDataReader(str1);
        GridView1.DataBind();

    }
    public void clr_data()
    {
        T_TID.Text = "";
        T_PBNO.Text = "";
        T_NSALARY.Text = "";
        T_MONTH.Text = "";
        T_DA.Text = "";
        T_BASIC.Text = "";
        T_HRA.Text = "";

    }
    public void submit_rec()
    {
       
       str2 = @"select * from mrp.PAYROLL where pb_no = '" + T_PBNO.Text + "'";
        OracleDataReader dr;
        dr = db.GetDataReader(str2);
        if (dr.HasRows) //update
        {
            while (dr.Read())
            {
                str3 = @"update mrp.payroll set transaction_id = '" + T_TID.Text + "',emp_net_salary='" + T_NSALARY.Text + "',month='"+T_MONTH.Text+"',basic='"+T_BASIC.Text+"',da='"+T_DA.Text+"',hra='"+T_HRA.Text+"' where pb_no = '" + T_PBNO.Text + "'";
                db.ExeDML(str3);
             }

        }
        else //insert
        {
            str4 = @"insert into mrp.payroll (transaction_id,pb_no, emp_net_salary,month,basic,da,hra) values ('" + T_TID.Text + "','" + T_PBNO.Text + "','" + T_NSALARY.Text + "','" + T_MONTH.Text + "','"+T_BASIC.Text+"','"+T_DA.Text+"','"+T_HRA.Text+"')";
            db.ExeDML(str4);
        }      
        clr_data();
        dis_data();
    }

    protected void Button3_Click1(object sender, EventArgs e)
    {
        db.ExeDML(@"delete  from mrp.payroll where pb_no = '" + T_PBNO.Text + "'");
        clr_data();
        dis_data();
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        clr_data();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        string str4 = @"delete from mrp.payroll where pb_no ='" + id + "'";

        db.ExeDML(str4);

        dis_data();
    }
}
