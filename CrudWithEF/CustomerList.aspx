<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="CrudWithEF.CustomerList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    
        <style>
            .pagination-ys {
                /*display: inline-block;*/
                padding-left: 0;
                margin: 20px 0;
                border-radius: 4px;
            }

                .pagination-ys table > tbody > tr > td {
                    display: inline;
                }

                    .pagination-ys table > tbody > tr > td > a,
                    .pagination-ys table > tbody > tr > td > span {
                        position: relative;
                        float: left;
                        padding: 8px 12px;
                        line-height: 1.42857143;
                        text-decoration: none;
                        color: #dd4814;
                        background-color: #ffffff;
                        border: 1px solid #dddddd;
                        margin-left: -1px;
                    }

                    .pagination-ys table > tbody > tr > td > span {
                        position: relative;
                        float: left;
                        padding: 8px 12px;
                        line-height: 1.42857143;
                        text-decoration: none;
                        margin-left: -1px;
                        z-index: 2;
                        color: #aea79f;
                        background-color: #f5f5f5;
                        border-color: #dddddd;
                        cursor: default;
                    }

                    .pagination-ys table > tbody > tr > td:first-child > a,
                    .pagination-ys table > tbody > tr > td:first-child > span {
                        margin-left: 0;
                        border-bottom-left-radius: 4px;
                        border-top-left-radius: 4px;
                    }

                    .pagination-ys table > tbody > tr > td:last-child > a,
                    .pagination-ys table > tbody > tr > td:last-child > span {
                        border-bottom-right-radius: 4px;
                        border-top-right-radius: 4px;
                    }

                    .pagination-ys table > tbody > tr > td > a:hover,
                    .pagination-ys table > tbody > tr > td > span:hover,
                    .pagination-ys table > tbody > tr > td > a:focus,
                    .pagination-ys table > tbody > tr > td > span:focus {
                        color: #97310e;
                        background-color: #eeeeee;
                        border-color: #dddddd;
                    }

            .edit {
                border-color: #F0AD4E;
                background-color: white;
                color: #F0AD4E;
            }

                        .edit:hover {
                            border-color: #F0AD4E;
                            background-color: #F0AD4E;
                            color: white;
                        }

                        .del {
                border-color: red;
                background-color: white;
                color: red;
            }

                        .del:hover {
                            border-color: red;
                            background-color: red;
                            color: white;
                        }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="container">
                <table class="auto-style1">
                     <tr>
                        <td class="auto-style6"></td>
                        <td class="auto-style7">
                         </td>
                        <td class="auto-style8">
                            <h3><i class="glyphicon glyphicon-user"></i>&nbsp;Add Customer</h3>
                        </td>
                        <td class="auto-style6"></td>
                    </tr>
                    <tr>
                        <td class="auto-style6"></td>
                        <td class="auto-style9">
                            <asp:Label ID="LabelMessage" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style8"></td>
                        <td class="auto-style6"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">
                            <asp:HiddenField ID="HiddenCustomerId" runat="server" />
                            <asp:Label ID="Label2" runat="server" Text="FirstName  :"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtFirstName" runat="server" Width="168px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtNameRequired" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Name cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">
                            <asp:Label ID="Label3" runat="server" Text="LastName  :"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtLastName" runat="server" Width="168px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtNameRequired0" runat="server" ControlToValidate="txtLastName" ErrorMessage="Name cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">
                            <asp:Label ID="Label4" runat="server" Text="Mobile  :"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtMobile" runat="server" Width="168px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtMobileRequired" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="txtMobileRegularExpression" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">
                            <asp:Label ID="Label5" runat="server" Text="Password  :"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtPassword" runat="server" Width="168px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtPasswordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">
                            <asp:Label ID="Label6" runat="server" Text="Email  : "></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtEmail" runat="server" Width="168px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="txtEmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email cannot be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="txtEmailRegularExpression" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter proper email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style3">
                            <asp:UpdateProgress runat="server" id="PageUpdateProgress">
                                <ProgressTemplate>
                                    Loading...
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                             <asp:UpdatePanel runat="server" id="Panel">
                                <ContentTemplate>
                            
                                </ContentTemplate>
                            </asp:UpdatePanel> 
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

                <hr />
                <h3><i class="glyphicon glyphicon-trash"></i>&nbsp;Customer List</h3>
                <asp:GridView ID="gvCust" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerId" 
                    EmptyDataText="data not found! keep trying" EmptyDataRowStyle-BackColor="Beige" PagerStyle-CssClass="pagination-ys" 
                    CssClass="table table-bordered table-hover table-responsive" ShowHeaderWhenEmpty="true" DataSourceID="dataSrcGvCust" OnRowCommand="gvCust_RowCommand" >
                    <Columns>
                        <asp:BoundField DataField="CustomerId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerId" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:ButtonField ButtonType="Link" Text="" HeaderText="Edit" HeaderStyle-ForeColor="#437AA9" CommandName="edi" ControlStyle-CssClass="btn glyphicon glyphicon-pencil edit" />
                        <asp:ButtonField ButtonType="Link" Text="" HeaderText="Delete" HeaderStyle-ForeColor="#437AA9" CommandName="del" ControlStyle-CssClass="btn glyphicon glyphicon-trash del" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dataSrcGvCust" runat="server" ConnectionString="<%$ ConnectionStrings:TestDBContext %>" SelectCommand="SELECT [CustomerId],[FirstName],[LastName],[Mobile],[Password],[Email] FROM [Customer]"></asp:SqlDataSource>
            </div>
        
        </form>
    </body>
</html>
