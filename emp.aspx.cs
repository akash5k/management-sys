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
        SetFocus(T_PBNO);
        dis_data();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void T_PBNO_TextChanged(object sender, EventArgs e)
    {
        str3 = @"select * from mrp.emp where pb_no = '" + T_PBNO.Text + "' ";
        OracleDataReader dr;
        dr = db.GetDataReader(str3);
        if (dr.HasRows)
        {
            dr.Read();
            {
                T_NAME.Text = dr["emp_name"].ToString();
                T_GRADE.Text = dr["grade"].ToString();
                T_DEPT.Text = dr["emp_dept"].ToString();
                T_DESG.Text = dr["emp_desg"].ToString();
                T_ADDR.Text = dr["addr"].ToString();
                T_DOB.Text = dr["emp_dob"].ToString();
                T_DOA.Text = dr["emp_doa"].ToString();
                T_ACCNO.Text = dr["emp_acc_no"].ToString();
                T_BNAME.Text = dr["emp_bname"].ToString();
                T_PANNO.Text = dr["emp_pan_no"].ToString();
                T_MOBILE.Text = dr["emp_mobile"].ToString();
                DD_SEX.SelectedValue = dr["sex"].ToString();
            }
        }
        else
        {
            SetFocus(T_NAME);
        }
    }
    protected void T_NAME_TextChanged(object sender, EventArgs e)
    {
        SetFocus(T_GRADE);
    }
    protected void T_GRADE_TextChanged(object sender, EventArgs e)
    {
        SetFocus(T_DEPT);
    }

    protected void T_DEPT_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_DESG);
    }
    protected void T_DESG_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_DOB);
    }
    
    protected void T_DOB_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_DOA);
    }

    protected void T_DOA_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_ACCNO);
    }
    protected void T_ACCNO_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_BNAME);
    }
    protected void T_BNAME_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_PANNO);
    }
    protected void T_PANNO_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(T_MOBILE);
    }

    protected void T_MOBILE_TextChanged1(object sender, EventArgs e)
    {
        SetFocus(DD_SEX);
    }

    protected void DD_SEX_SelectedIndexChanged1(object sender, EventArgs e)
    {
        SetFocus(T_ADDR);
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        save_rec();
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clear_data();
    }

    public void save_rec()
    {
        str3 = @" select * from mrp.emp where pb_no ='" + T_PBNO.Text + "' ";
        OracleDataReader dr;
        dr = db.GetDataReader(str3);
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                db.ExeDML(@"update mrp.emp set emp_name = '" + T_NAME.Text + "',grade = '" + T_GRADE.Text + "', emp_dept =  '" + T_DEPT.Text + "',emp_desg = '" + T_DESG.Text + "',addr = '" + T_ADDR.Text + "' ,emp_dob = TO_DATE('" + T_DOB.Text + "','DD/MM/YYYY'),emp_doa= TO_DATE('" + T_DOA.Text + "','DD/MM/YYYY'), emp_acc_no ='" + T_ACCNO.Text + "',  emp_bname = '" + T_BNAME.Text + "' , emp_pan_no =  '" + T_PANNO.Text + "' , emp_mobile = '" + T_MOBILE.Text + "', sex = '" + DD_SEX.SelectedValue + "'where pb_no = '" + T_PBNO.Text + "'");
                                
            }
        }
        else
        {
            str1 = @"insert into mrp.emp(pb_no,emp_name, grade,emp_dept, emp_desg,addr, emp_dob, emp_doa, emp_acc_no, emp_bname, emp_pan_no, emp_mobile, sex)
               values('" + T_PBNO.Text + "','" + T_NAME.Text + "', '" + T_GRADE.Text + "','" + T_DEPT.Text + "', '" + T_DESG.Text + @"',
                    '" + T_ADDR.Text + "', TO_DATE('" + T_DOB.Text + "','DD-MM-YYYY'), TO_DATE('" + T_DOA.Text + "','DD-MM-YYYY'), '" + T_ACCNO.Text + "', '" + T_BNAME.Text + @"', 
                    '" + T_PANNO.Text + "', '" + T_MOBILE.Text + "', '" + DD_SEX.SelectedValue + "')";

            db.ExeDML(str1);
           
        }
        dis_data();
        clear_data();

    }

    public void dis_data()
    {
        str2 = @"select pb_no,emp_name, grade,emp_dept, emp_desg,addr, TO_CHAR(emp_dob,'DD/MM/YYYY') EMP_DOB, 
            TO_CHAR(emp_doa,'DD/MM/YYYY') EMP_DOA, emp_acc_no, emp_bname, 
                    emp_pan_no, emp_mobile, sex from mrp.emp order by pb_no";
       
        GridView1.DataSource = db.GetDataReader(str2);
        GridView1.DataBind();
    }

    public void clear_data()
    {
        T_PBNO.Text = "";
        T_NAME.Text = "";
        T_GRADE.Text = "";
        T_DEPT.Text = "";
        T_DESG.Text = "";
        T_ADDR.Text = "";
        T_DOB.Text = "";
        T_DOA.Text = "";
        T_ACCNO.Text = "";
        T_BNAME.Text = "";
        T_PANNO.Text = "";
        T_MOBILE.Text = "";

    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        clear_data();
    }

    protected void Button3_Click1(object sender, EventArgs e)
    {
        db.ExeDML(@"delete  from mrp.emp where pb_no = '" + T_PBNO.Text + "'");

        clear_data();
        dis_data();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void T_ADDR_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        string str4 = @"delete from mrp.EMP where pb_no ='" + id + "'";

        db.ExeDML(str4);

        dis_data();
    }
}
