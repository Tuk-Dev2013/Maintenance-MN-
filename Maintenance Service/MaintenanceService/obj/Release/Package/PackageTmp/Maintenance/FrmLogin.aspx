<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="MaintenanceService.Maintenance.FrmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <style type="text/css">
        .auto-style4 {
            font-size: small;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        #go
        {
            font-weight: 700;
            font-size: large;
        }
        .p-container
        {
            text-align: center;
        }
        .auto-style6
        {
            font-size: medium;
        }
        #go0
        {
            font-weight: 700;
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td rowspan="5">
                    <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl="~/Images/mase.png" style="text-align: center" Width="400px" />
                  
                </td>
                <td class="auto-style2" rowspan="5">
                       <h1 class="auto-style5">
                           Maintenance Service</h1>
  <div class="inset">
  <p>
    <label for="email"><strong>USER ID</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="userid" id="userid" runat="server" maxlength="10" style="color: #000000"/>
      <asp:Label ID="lblme1" runat="server" ForeColor="Red" Text="***" Visible="False"></asp:Label>

  </p>
  <p>
    <label for="password"><strong>PASSWORD</strong></label>
    <input type="password" name="password" id="password" runat="server" maxlength="10" style="color: #000000"/>
      <asp:Label ID="lblme2" runat="server" ForeColor="Red" Text="***" Visible="False"></asp:Label>
  </p>
  </div>
        <p class="p-container">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="go0" id="go0" value="Cancel" runat="server"  OnServerClick="submited">&nbsp;&nbsp;&nbsp;
    <input type="submit" name="go" id="go" value="Log in" runat="server" OnServerClick="submited">
  </p>
        <div class="auto-style4" style="background-color: #CCCCCC">
            <div style="text-align: center; height: 44px; background-color: #808080; width: 302px;">
                <br />
                <span class="auto-style6">Development By </span> <strong><span class="auto-style6">IT (la-z-boy)</span></strong></div>
        </div>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
