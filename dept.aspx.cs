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
    string str1, str2, str3;

    protected void Page_Load(object sender, EventArgs e)
    {
        SetFocus(T_DID);
        dis_data();

    }
    protected void T_DID_TextChanged(object sender, EventArgs e)
    {
        str3 = @"select * from mrp.DEPT where dept_id = '" + T_DID.Text + "' ";
        OracleDataReader dr;
        dr = db.GetDataReader(str3);
        if (dr.HasRows)
        {
            dr.Read();
            T_DNAME.Text = dr["dept_name"].ToString();
        }
        else
        {
            SetFocus(T_DNAME);
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        submit_rec();
    }


    public void dis_data()
    {
        str1 = @"select * from mrp.dept";

        GridView1.DataSource = db.GetDataReader(str1);
        GridView1.DataBind();
    }

    public void clear_data()
    {
        T_DID.Text = "";
        T_DNAME.Text = "";
    }

    public void submit_rec()
    {
        str3 = @"select * from mrp.DEPT where dept_id = '" + T_DID.Text + "' ";
        OracleDataReader dr;
        dr = db.GetDataReader(str3);
        if (dr.HasRows) //update
        {
            while (dr.Read())
            {
                db.ExeDML(@"update mrp.dept set dept_name = '" + T_DNAME.Text + "' where dept_id = '" + T_DID.Text + "'");
            }
           
        }
        else //insert
        {
            str2 = @"insert into mrp.dept(dept_id,dept_name) values ('" + T_DID.Text + "','" + T_DNAME.Text + "')";

            db.ExeDML(str2);          

        }

        dis_data();
        clear_data();
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clear_data();
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {

        db.ExeDML(@"delete  from mrp.dept where dept_id = '" + T_DID.Text + "'");

        clear_data();
        dis_data();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        string str4 = @"delete from mrp.DEPT where dept_id ='"+id+"'";

        db.ExeDML(str4);

        dis_data();
    }
}
