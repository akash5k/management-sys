<%@ Page Title="" Language="C#" MasterPageFile="~/FormX.master" AutoEventWireup="true" CodeFile="Form EMP.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                scrollX: true});
            
        });
        $('.table').on('click', '.remove', function () {
            var table = ('.table').Datatable();
            table
            .row($(this).parents('tr'))
            .remove
            .draw();
        });
        
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Employee Form --%>
     <div class="container"> 
      <div class="row">
         <div class="col">
          <%--  <div class="card">
               <div class="card-body"> --%>
                  <div class="row">
                     <div class="col">
                         <center>
                           &nbsp;</center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Employee Details</h4> 
                            <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="New Registration"></asp:Label>                                                     
                        </center>
                         
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>PB NO</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_PBNO" runat="server" placeholder="PB NO" AutoPostBack="True" OnTextChanged="T_PBNO_TextChanged"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_NAME" runat="server" placeholder="Full Name" AutoPostBack="True" OnTextChanged="T_NAME_TextChanged" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Grade</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_GRADE" runat="server" placeholder="Grade" AutoPostBack="True" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Department</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DEPT" runat="server" placeholder="Department" AutoPostBack="True" OnTextChanged="T_DEPT_TextChanged1" ></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Designation</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DESG" runat="server" placeholder="Designation" AutoPostBack="True" OnTextChanged="T_DESG_TextChanged1" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-6">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DOB" runat="server" placeholder="DOB"  AutoPostBack="True" OnTextChanged="T_DOB_TextChanged1" ToolTip="DD/MM/YYYY" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>DOA</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DOA" runat="server" placeholder="DOA"  AutoPostBack="True" OnTextChanged="T_DOA_TextChanged1" ToolTip="DD/MM/YYYY" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-md-4">
                        <label>Account Number</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_ACCNO" runat="server" placeholder="Account Number" AutoPostBack="True" OnTextChanged="T_ACCNO_TextChanged1" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Bank Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_BNAME" runat="server" placeholder="Bank Name" AutoPostBack="True" OnTextChanged="T_BNAME_TextChanged1" ></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>PAN Number</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_PANNO" runat="server" placeholder="PAN Number" AutoPostBack="True" OnTextChanged="T_PANNO_TextChanged1" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                        <div class="col-md-6">
                        <label>Mobile Number</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="T_MOBILE" runat="server" placeholder="Mobile Number" AutoPostBack="True" OnTextChanged="T_MOBILE_TextChanged1"></asp:TextBox>
                        </div>
                     </div> 
                     <div class="col-md-6">
                        <label>Sex</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DD_SEX" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DD_SEX_SelectedIndexChanged1">
                              <asp:ListItem Value="">Select</asp:ListItem>
                               <asp:ListItem Value="M">Male</asp:ListItem>
                               <asp:ListItem Value="F">Female</asp:ListItem>
                               <asp:ListItem Value="O">Other</asp:ListItem>
                           </asp:DropDownList>
                        </div>
                     </div>
                                     
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Full Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_ADDR" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" AutoPostBack="True" OnTextChanged="T_ADDR_TextChanged1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  
                  <div class="row">
                     <div class="col-4 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click1" />
                               <br />                               
                           </div>
                        </center>
                     </div>                         
                        </>
                     </div>                                                   
                  </div>
                   
             
               </div>
            </div>           
              
      
     <%--Grid View --%>
    <div class="container">
        <centre>
        <div class="row">
            <div class="col-md">
            <%--  <div class="card">
               <div class="card-body"> --%>                  
                  <div class="row">
                     <div class="col">
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="pb_no" OnRowDeleting="GridView1_RowDeleting">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True">
                                <ControlStyle CssClass="btn btn-danger" />
                                </asp:CommandField>
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>           
        </div>
        </centre>
    </div>      
</asp:Content>
