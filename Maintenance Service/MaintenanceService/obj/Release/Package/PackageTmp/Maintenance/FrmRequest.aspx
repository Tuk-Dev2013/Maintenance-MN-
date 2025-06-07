<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Maintenance.Master" AutoEventWireup="true" CodeBehind="FrmRequest.aspx.cs" Inherits="MaintenanceService.Maintenance.FrmRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4
        {
            height: 28px;
        }
        .auto-style5
        {
            height: 28px;
            width: 191px;
        text-align: right;
    }
        .auto-style6
        {
            width: 191px;
            text-align: right;
        }
        .auto-style7
        {
            height: 158px;
        }
        .auto-style8
        {
            width: 141px;
        }
        .auto-style9
        {
            height: 66px;
        }
    .auto-style10
    {
        height: 4px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="dxflInternalEditorTable_Moderno">
        <tr>
            <td></td>
            <td colspan="7">
                <h3><asp:Label ID="Label3" runat="server" Text="Service Request Online(MN)"></asp:Label>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                </h3>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style6">
                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblEdit" runat="server" ForeColor="Red" style="font-weight: 700" Text="lblEdit" Visible="False"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </td>
            <td> 
                  <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="IssueNo" runat="server" Font-Bold="True" ForeColor="#3333FF" Visible="False"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style6">
                </td>
            <td> 
                <table class="dxflInternalEditorTable_Moderno">
                    <tr>
                        <td class="auto-style8">
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox ID="ck1" runat="server" Font-Size="12pt" Text="แจ้งสร้าง" AutoPostBack="True" OnCheckedChanged="ck1_CheckedChanged" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td class="auto-style8">
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox ID="ck2" runat="server" Font-Size="12pt" Text="แจ้งซ่อม" AutoPostBack="True" OnCheckedChanged="ck2_CheckedChanged" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                          
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5">
                <asp:Label ID="Label4" runat="server" Text="วันที่แจ้ง"></asp:Label>
            </td>
            <td class="auto-style4"> 
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtdate" runat="server" Width="229px" Enabled="False"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style6">
                <asp:Label ID="Label5" runat="server" Text="ผู้แจ้งเรื่อง"></asp:Label>
            </td>
            <td> <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtname" runat="server" Width="347px" Enabled="False"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel></td>
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
            <td class="auto-style6">
                <asp:Label ID="Label9" runat="server" Text="แผนก"></asp:Label>
            </td>
            <td> <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtdept" runat="server" Width="347px" Enabled="False"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel></td>
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
            <td class="auto-style6">
                <asp:Label ID="Label6" runat="server" Text="หัวหน้าฝ่าย(Manager)" ForeColor="#3333FF"></asp:Label>
            </td>
            <td> <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtmanager" runat="server" Width="347px" Enabled="False"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel></td>
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
            <td class="auto-style6">
                <asp:Label ID="Label10" runat="server" Text="ห้วข้อเรื่องที่แจ้ง"></asp:Label>
            </td>
            <td> <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txthead" runat="server" Width="347px"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td valign="top" style="text-align: right" class="auto-style7">
             <asp:Label ID="Label7" runat="server" Text="ปัญหาที่แจ้ง"></asp:Label>
            </td>
            <td class="auto-style7"> <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtdetail" runat="server" Width="755px" Height="148px" TextMode="MultiLine"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>


            </td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td valign="top" style="text-align: right" class="auto-style9">
                      <asp:Label ID="Label1" runat="server" Text="หมายเหตุ"></asp:Label></td>
            <td valign="top" class="auto-style9"> 
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtremark" runat="server" Width="755px" Height="67px" TextMode="MultiLine"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>


            </td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td></td>
            <td valign="top" style="text-align: right">
                      <asp:Label ID="Label11" runat="server" Text="แนบไฟล์1(Word,Excel,Pdf.)"></asp:Label></td>
            <td valign="top"> 
                      
                              <asp:FileUpload ID="FileUpload4" runat="server" />
                <asp:HyperLink ID="FileUpload44" runat="server">Attachments</asp:HyperLink>
                 


            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td valign="top" style="text-align: right" class="auto-style10">
                      <asp:Label ID="Label12" runat="server" Text="แนบไฟล์2(Word,Excel,Pdf.)"></asp:Label></td>
            <td valign="top" class="auto-style10"> 
                      <asp:FileUpload ID="FileUpload3" runat="server" />
                <asp:HyperLink ID="FileUpload33" runat="server">Attachments</asp:HyperLink>


            </td>
            <td class="auto-style10"></td>
            <td class="auto-style10"></td>
            <td class="auto-style10"></td>
            <td class="auto-style10"></td>
            <td class="auto-style10"></td>
            <td class="auto-style10"></td>
            <td class="auto-style10"></td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td valign="top" style="text-align: right" class="auto-style10">
                      <asp:Label ID="Label13" runat="server" Text="รูปภาพ(jpg.,png.)"></asp:Label></td>
            <td valign="top" class="auto-style10"> 
                      <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:HyperLink ID="FileUpload2" runat="server">Attachments</asp:HyperLink>


            </td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td valign="top" style="text-align: right">
                      </td>
            <td style="text-align: left"> 
<asp:Button ID="btnUpload" Text="&gt;&gt; กด Upload ไฟล์แนบก่อนส่งเมล์" runat="server" OnClick="UploadFile" Width="247px" ForeColor="#000099" />
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td valign="top" style="text-align: right">
                      </td>
            <td style="text-align: left"> 
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style6">
                <asp:Image ID="Image1" runat="server" Height="62px" ImageUrl="~/Images/email.png" Width="74px" />
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" BorderWidth="2px" Height="44px" ImageUrl="~/Images/email1.png" Width="122px" OnClick="ImageButton1_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
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
            <td class="auto-style6">&nbsp;</td>
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
            <td class="auto-style6">&nbsp;</td>
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
            <td class="auto-style6">&nbsp;</td>
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
            <td class="auto-style6">&nbsp;</td>
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
</asp:Content>
