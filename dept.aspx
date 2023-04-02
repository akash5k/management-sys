<%@ Page Title="" Language="C#" MasterPageFile="~/FormX.master" AutoEventWireup="true" CodeFile="Form_Dept.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
       $('.table').on('click','.remove',function(){
       var table= ('.table').Datatable();
           table
           .row($(this).parents('tr'))
           .remove
           .draw();
       });        

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
      <div class="row">
          <%--Department Form --%>
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
                           <h4>Department Details</h4>                           
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Department ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DID" runat="server" placeholder="Department ID" AutoPostBack="True" OnTextChanged="T_DID_TextChanged"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col">
                        <label>Department Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="T_DNAME" runat="server" placeholder="Department Name" AutoPostBack="True"  ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                 
                  <div class="row">
                     <div class="col-6 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click1" />
                               <%-- <button class="remove">Delete</button>--%>
                           </div>
                        </center>
                     </div>
                  </div>                  
             <div class="row">
                  </div>
               </div>
            
          <%--Grid view --%>
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
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="dept_id" OnRowDeleting="GridView1_RowDeleting">
                            <Columns>
                                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowHeader="True" >
                                
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
