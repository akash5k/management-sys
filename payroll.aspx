<%@ Page Title="" Language="C#" MasterPageFile="~/FormX.master" AutoEventWireup="true" CodeFile="Form_Payroll.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
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
     <%--Payroll Form --%>
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
                           <h4>Payroll Details</h4>                                                     
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr />
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
                        <label>Transaction ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_TID" runat="server" placeholder="Transaction ID" AutoPostBack="True" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      <div class="col-md-4">
                        <label>Month</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_MONTH" runat="server" placeholder="Month" AutoPostBack="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Basic</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_BASIC" runat="server" placeholder="Basic" AutoPostBack="True" OnTextChanged="T_BASIC_TextChanged1" ></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>
                   <div class="row">
                       <div class="col-md-4">
                        <label>DA</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DA" runat="server" placeholder="DA" ReadOnly="True" AutoPostBack="True" ToolTip="Basic * 0.4" ></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>HRA</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_HRA" runat="server" placeholder="HRA" ReadOnly="True" AutoPostBack="True" ToolTip="Basic * 0.2" ></asp:TextBox>
                        </div>
                     </div>                     
                     <div class="col-md-4">
                        <label>Net Salary</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_NSALARY" runat="server" placeholder="Net Salary" ReadOnly="True" AutoPostBack="True" ToolTip="Basic+DA+HRA " ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  
                  
                  <div class="row">
                     <div class="col-4 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click1" />
                           </div>
                        </center>
                     </div>
                  </div>                   
             <div class="row">
                     <div class="col-4 mx-auto">
                     </div>
                  </div>
               </div>
          </div>
               </div> 
     
            

     <%--Grid View --%>
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
   </div>
</asp:Content>
