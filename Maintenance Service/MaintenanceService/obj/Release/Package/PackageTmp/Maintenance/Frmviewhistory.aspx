<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Maintenance.Master" AutoEventWireup="true" CodeBehind="Frmviewhistory.aspx.cs" Inherits="MaintenanceService.Maintenance.Frmviewhistory" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
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
        .auto-style12
        {
            width: 18px;
        }

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

.dxeTextBoxSys,
.dxeButtonEditSys 
{
    width: 170px;
}

.dxeTrackBar, 
.dxeIRadioButton, 
.dxeButtonEdit, 
.dxeTextBox, 
.dxeRadioButtonList, 
.dxeCheckBoxList, 
.dxeMemo, 
.dxeListBox, 
.dxeCalendar, 
.dxeColorTable
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox,
.dxeButtonEdit,
.dxeIRadioButton,
.dxeRadioButtonList,
.dxeCheckBoxList
{
    cursor: default;
}

.dxeButtonEdit
{
	background-color: white;
	border: 1px solid #9F9F9F;
    font: 12px Tahoma, Geneva, sans-serif;
}

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

.dxeButtonEditSys 
{
    width: 170px;
}

.dxeButtonEdit .dxeEditArea
{
	background-color: white;
}
.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}

.dxeEditArea
{
	border: 1px solid #A0A0A0;
}

.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


.dxeButtonEditButton,
.dxeSpinLargeIncButton,
.dxeSpinLargeDecButton
{
	
}
.dxeButtonEditButton
{
    padding: 0px 2px 1px 3px;    
}
.dxeButtonEditButton,
.dxeCalendarButton,
.dxeSpinIncButton,
.dxeSpinDecButton,
.dxeSpinLargeIncButton,
.dxeSpinLargeDecButton,
.dxeColorEditButton
{
	vertical-align: middle;
	border: 1px solid #7f7f7f;
	cursor: pointer;
	text-align: center;
	white-space: nowrap;
} 
        .auto-style13
        {
            width: 18px;
            height: 29px;
        }
        .auto-style14
        {
            width: 189px;
            text-align: right;
            height: 29px;
        }
        .auto-style15
        {
            height: 29px;
        }
        .auto-style16
        {
            width: 554px;
            text-align: left;
        }
        .auto-style17
        {
            height: 29px;
            width: 554px;
        }
        .auto-style18
        {
            width: 189px;
            text-align: right;
        }
        .auto-style19
        {
            width: 99px;
        }
        .auto-style21
        {
            width: 37px;
        }
        .auto-style23
        {
            text-align: center;
        width: 65px;
    }
    .auto-style24
    {
        text-align: center;
        width: 353px;
    }
    .auto-style26
    {
        text-align: center;
        width: 66px;
    }
    .auto-style29
    {
        width: 353px;
        height: 14px;
    }
    .auto-style30
    {
        width: 66px;
        height: 14px;
    }
    .auto-style32
    {
        height: 14px;
        width: 65px;
    }
    .auto-style33
    {
        width: 353px;
        height: 4px;
    }
    .auto-style34
    {
        width: 66px;
        height: 4px;
    }
    .auto-style35
    {
        height: 4px;
        width: 65px;
    }
    .auto-style36
    {
        text-align: center;
        width: 37px;
        height: 4px;
    }
    .auto-style37
    {
        height: 4px;
    }
    .auto-style38
    {
        width: 353px;
        height: 10px;
    }
    .auto-style39
    {
        width: 66px;
        height: 10px;
    }
    .auto-style40
    {
        height: 10px;
        width: 65px;
    }
    .auto-style41
    {
        text-align: center;
        width: 37px;
        height: 10px;
    }
    .auto-style42
    {
        height: 10px;
    }
    .auto-style43
    {
        text-align: center;
        width: 37px;
        height: 14px;
    }
    .auto-style44
    {
        height: 14px;
    }
    .auto-style45
    {
        text-align: center;
        width: 37px;
        height: 13px;
    }
    .auto-style46
    {
        width: 353px;
        height: 13px;
    }
    .auto-style47
    {
        width: 66px;
        height: 13px;
    }
    .auto-style48
    {
        height: 13px;
        width: 65px;
    }
    .auto-style49
    {
        height: 13px;
    }
        .auto-style50
        {
            width: 18px;
            height: 2px;
        }
        .auto-style51
        {
            width: 189px;
            text-align: right;
            height: 2px;
        }
        .auto-style52
        {
            height: 2px;
            width: 554px;
        }
        .auto-style53
        {
            height: 2px;
        }
        .auto-style54
        {
            width: 18px;
            height: 10px;
        }
        .auto-style55
        {
            width: 189px;
            text-align: right;
            height: 10px;
        }
        .auto-style56
        {
            height: 10px;
            width: 554px;
        }
        .auto-style57
        {
            width: 102px;
        }
        .auto-style58
        {
            height: 58px;
        }
        .auto-style59
        {
            height: 8px;
        }
        .auto-style60
        {
            width: 185px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
<hr />
            <p>
                <table id="MN" runat="server"  class="dxflInternalEditorTable_Moderno">
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td>
                <asp:Label ID="lblMe" runat="server" Text="เลขที่ใบแจ้ง" Font-Bold="True" ForeColor="#000066" style="text-decoration: underline; text-align: left" Font-Size="12pt" BackColor="#FFCCCC"></asp:Label>
                        </td>
                        <td class="auto-style16">
                <asp:Label ID="Label12" runat="server" Text="ข้อมูลสำหรับเจ้าหน้าที(MN)" Font-Bold="True" ForeColor="#0000CC"></asp:Label>
                        &nbsp;
                        </td>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                <asp:Label ID="Label17" runat="server" Text="เลขที่ใบแจ้ง"></asp:Label>
                        </td>
                        <td class="auto-style16">
                            <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtissueno" runat="server" Width="229px"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                <asp:Label ID="Label13" runat="server" Text="ชื่อผู้รับเรื่อง(เสมียน)"></asp:Label>
                        </td>
                        <td class="auto-style16">
                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="cboissuename0" runat="server" DataSourceID="SqlDataSource1" DataTextField="EMPName" DataValueField="EMPName" Font-Size="10pt" Height="25px" Width="215px">
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                <asp:Label ID="Label14" runat="server" Text="วันที่รับเรื่อง"></asp:Label>
                        </td>
                        <td class="auto-style16">
                            <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtissuedate" runat="server" Width="229px"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style13"></td>
                        <td class="auto-style14">
                <asp:Label ID="Label15" runat="server" Text="ชื่อช่างผู้ตรวจสอบ"></asp:Label>
                        </td>
                        <td>
                           <asp:UpdatePanel ID="UpdatePanel46" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="cbomncheck" runat="server" DataSourceID="SqlDataSource2" DataTextField="EMPName" DataValueField="EMPName" Font-Size="10pt" Height="25px" Width="215px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBBarcode %>" SelectCommand="select EMPName
from [dbo].[tb_Emp]
Order by EMPCode"></asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            </td>
                        <td class="auto-style15"></td>
                        <td class="auto-style15"></td>
                        <td class="auto-style15"></td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="auto-style50"></td>
                        <td valign="top"  class="auto-style51">
                <asp:Label ID="Label24" runat="server" Text="ลักษณะความผิดปกติที่ตรวจพบ"></asp:Label>
                        </td>
                        <td class="auto-style52">
                            <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtmnissue" runat="server" Width="755px" Height="67px" TextMode="MultiLine"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td class="auto-style53"></td>
                        <td class="auto-style53"></td>
                        <td class="auto-style53"></td>
                        <td class="auto-style53"></td>
                    </tr>
                    <tr>
                        <td class="auto-style54"></td>
                        <td valign="top"  class="auto-style55">
                                     <asp:Label ID="Label2" runat="server" Text="ชื่อช่างผู้ดำเนินการ"></asp:Label></td>
                        <td class="auto-style56">
                              <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="cboissuename" runat="server" DataSourceID="SqlDataSource1" DataTextField="EMPName" DataValueField="EMPName" Font-Size="10pt" Height="25px" Width="215px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBBarcode %>" SelectCommand="select EMPName
from [dbo].[tb_Emp]
Order by EMPCode"></asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel></td>
                        <td class="auto-style42"></td>
                        <td class="auto-style42"></td>
                        <td class="auto-style42"></td>
                        <td class="auto-style42"></td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;</td>
                        <td valign="top"  class="auto-style14">
                <asp:Label ID="Label25" runat="server" Text="การดำเนินการ/แก้ไขสิ่งผิดปกติ"></asp:Label>
                        </td>
                        <td class="auto-style17">
                            <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtmnedit" runat="server" Width="755px" Height="67px" TextMode="MultiLine"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;</td>
                        <td valign="top"  class="auto-style14">
                <asp:Label ID="Label26" runat="server" Text="รายการอะไหล่/อปุกรณ์"></asp:Label>
                        </td>
                        <td class="auto-style17">
                           
                            <table class="dxflInternalEditorTable_Moderno">
                                <tr>
                                    <td class="auto-style21" style="background-color: #C0C0C0;">
                <asp:Label ID="Label27" runat="server" Text="ลำดับ"></asp:Label>
                                    </td>
                                    <td class="auto-style24" style="background-color: #C0C0C0">
                <asp:Label ID="Label28" runat="server" Text="รายการ"></asp:Label>
                                    </td>
                                    <td class="auto-style26" style="background-color: #C0C0C0">
                <asp:Label ID="Label29" runat="server" Text="จำนวน"></asp:Label>
                                    </td>
                                    <td class="auto-style23" style="background-color: #C0C0C0">
                <asp:Label ID="Label30" runat="server" Text="หน่วย"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style36">
                <asp:Label ID="Label31" runat="server" Text="1"></asp:Label>
                                    </td>
                                    <td class="auto-style33">
                                        <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist1" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty1" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style35"><asp:UpdatePanel ID="UpdatePanel28" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit1" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style37"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style43">
                <asp:Label ID="Label32" runat="server" Text="2"></asp:Label>
                                    </td>
                                     <td class="auto-style29">
                                        <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist2" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style30">
                                        <asp:UpdatePanel ID="UpdatePanel29" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty2" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style32"><asp:UpdatePanel ID="UpdatePanel30" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit2" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style44"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style41">
                <asp:Label ID="Label33" runat="server" Text="3"></asp:Label>
                                    </td>
                                      <td class="auto-style38">
                                        <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist3" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style39">
                                        <asp:UpdatePanel ID="UpdatePanel32" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty3" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style40"><asp:UpdatePanel ID="UpdatePanel33" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit3" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style42"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style43">
                <asp:Label ID="Label34" runat="server" Text="4"></asp:Label>
                                    </td>
                                      <td class="auto-style29">
                                        <asp:UpdatePanel ID="UpdatePanel34" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist4" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style30">
                                        <asp:UpdatePanel ID="UpdatePanel35" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty4" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style32"><asp:UpdatePanel ID="UpdatePanel36" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit4" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style44"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style45">
                <asp:Label ID="Label35" runat="server" Text="5"></asp:Label>
                                    </td>
                                     <td class="auto-style46">
                                        <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist5" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style47">
                                        <asp:UpdatePanel ID="UpdatePanel38" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty5" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style48"><asp:UpdatePanel ID="UpdatePanel39" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit5" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style49"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style45">
                <asp:Label ID="Label36" runat="server" Text="6"></asp:Label>
                                    </td>
                                    <td class="auto-style46">
                                        <asp:UpdatePanel ID="UpdatePanel40" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist6" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style47">
                                        <asp:UpdatePanel ID="UpdatePanel41" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty6" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style48"><asp:UpdatePanel ID="UpdatePanel42" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit6" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style49"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style45">
                <asp:Label ID="Label37" runat="server" Text="7"></asp:Label>
                                    </td>
                                      <td class="auto-style46">
                                        <asp:UpdatePanel ID="UpdatePanel43" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtlist7" runat="server" Width="356px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style47">
                                        <asp:UpdatePanel ID="UpdatePanel44" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtqty7" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="auto-style48"><asp:UpdatePanel ID="UpdatePanel45" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtunit7" runat="server" Width="75px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel></td>
                                    <td class="auto-style49"></td>
                                </tr>
                            </table>
                           
                        </td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                <asp:Label ID="Label16" runat="server" Text="วันที่เริ่มงาน"></asp:Label>
                        </td>
                        <td class="auto-style16">
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="149px">
                                    </dx:ASPxDateEdit>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                <asp:Label ID="Label18" runat="server" Text="วันที่เสร็จสิ้น"></asp:Label>
                        </td>
                        <td class="auto-style16">
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="149px">
                                    </dx:ASPxDateEdit>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18" style="background-color: #FFFF00">
                <asp:Label ID="Label20" runat="server" Text="สถานะ" style="font-weight: 700"></asp:Label>
                        </td>
                        <td class="auto-style16" style="background-color: #FFFF00">
                            <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="cbostatus" runat="server" Height="25px" Width="215px" Font-Size="10pt">
                                        <asp:ListItem>&lt;&lt; Select &gt;&gt;</asp:ListItem>
                                        <asp:ListItem>รับเรื่องแล้ว</asp:ListItem>
                                        <asp:ListItem>อยู่ระหว่างดำเนินการ</asp:ListItem>
                                        <asp:ListItem>รอดำเนินการ</asp:ListItem>
                                        <asp:ListItem>รออะไหล่/อุปกรณ์</asp:ListItem>
                                        <asp:ListItem>งานเสร็จสมบูรณ์</asp:ListItem>
                                        <asp:ListItem>ยกเลิกงาน</asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                <asp:Label ID="Label19" runat="server" Text="หมายเหตุ"></asp:Label>
                        </td>
                        <td class="auto-style16">
                            <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtremark" runat="server" Width="500px"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style18">
                                    <asp:Label ID="Label38" runat="server" style="font-weight: 700" Text="กดส่ง &gt;&gt;"></asp:Label>
                                </td>
                        <td class="auto-style16">
                         
                                    
                                     <table class="dxflInternalEditorTable_Moderno">
                                        <tr>
                                            <td class="auto-style57">   <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="bntsent" runat="server" BorderWidth="2px" Height="36px" ImageUrl="~/Images/save.png"  Width="101px" OnClick="bntsent_Click" />
                                     </ContentTemplate>
                            </asp:UpdatePanel></td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel47" runat="server">
                                                    <ContentTemplate>
                                                                                          <asp:ImageButton ID="bntprint" runat="server" BorderWidth="2px" Height="36px" ImageUrl="~/Images/Print.png"  Width="101px" OnClick="bntprint_Click" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                               <td>&nbsp;</td>
                                        </tr>
                                    </table>
                              
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
        </table>
    </p>
    <hr />
   <div>
       <table id="IDuser" runat="server">
           <tr>
               <td style="background-color: #66CCFF; color: #000000;"><strong><span>สำหรับผู้ใช้ ตรวจสอบ<asp:UpdatePanel ID="UpdatePanel50" runat="server">
                   <ContentTemplate>
                       <asp:Image ID="Image3" runat="server" Height="51px" ImageUrl="~/Images/Click-Here.gif" Width="177px" />
                   </ContentTemplate>
                   </asp:UpdatePanel>
&nbsp;</span></strong>&nbsp;</td>
                 <td class="auto-style60" style="background-color: #FFCCCC">
                     <asp:UpdatePanel ID="UpdatePanel48" runat="server">
                         <ContentTemplate>
                             &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                             <asp:LinkButton ID="LinkButton1" runat="server" style="text-align: center" OnClick="LinkButton1_Click">แก้ไขเพิ่มเติม </asp:LinkButton>
                             &nbsp;
                         </ContentTemplate>
                     </asp:UpdatePanel>
               </td>
                 <td style="background-color: #99FFCC">
                     <asp:UpdatePanel ID="UpdatePanel49" runat="server">
                         <ContentTemplate>
                             <asp:LinkButton ID="LinkButton2" runat="server" style="text-align: center" OnClick="LinkButton2_Click">   &nbsp;งานเสร็จสมบูรณ์เรียบร้อย    &nbsp;</asp:LinkButton>
                         </ContentTemplate>
                     </asp:UpdatePanel>
               </td>
                 <td></td>
           </tr></table>

   </div>
    <table class="dxflInternalEditorTable_Moderno">
        <tr>
            <td colspan="10">
<hr />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style4"> 
                <asp:Label ID="Label11" runat="server" Text="ข้อมูลผู้จัดการ" Font-Bold="True" ForeColor="#0000CC"></asp:Label>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td valign="top" class="auto-style5" style="background-color: #66FFCC">
                <asp:Label ID="Label21" runat="server" Text="Manager***"></asp:Label>
            </td>
            <td class="auto-style4" style="background-color: #66FFCC"> 
                        <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtuserreamrk0" runat="server" Height="67px" TextMode="MultiLine" Width="755px"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
            </td>
            <td class="auto-style4">
             
            </td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td valign="top" class="auto-style5">
                <asp:Image ID="Image1" runat="server" Height="38px" ImageUrl="~/Images/email.png" Width="56px" Visible="False" />
            </td>
            <td class="auto-style4"> 
                           <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                <ContentTemplate>
                                    <asp:ImageButton ID="bntapprove" runat="server" Height="40px" ImageUrl="~/Images/MgApprove.png"  Width="110px" BorderColor="#333333" OnClick="bntapprove_Click" Visible="False"  />
                                    &nbsp;
                                    <asp:ImageButton ID="bntreject" runat="server" ImageUrl="~/Images/MgReject.png" Height="40px" Width="110px" BorderColor="#333333" BorderStyle="None" Visible="False" OnClick="bntreject_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel></td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style4"> 
                <asp:Label ID="Label22" runat="server" Text="ข้อมูลผู้แจ้งเรื่อง" Font-Bold="True" ForeColor="#0000CC"></asp:Label>
               
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style4"> 
                 <table class="dxflInternalEditorTable_Moderno">
                    <tr>
                        <td class="auto-style19">
                            <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox ID="ck1" runat="server" Font-Size="12pt" Text="แจ้งสร้าง" AutoPostBack="True" Enabled="False"/>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td class="auto-style8">
                            <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox ID="ck2" runat="server" Font-Size="12pt" Text="แจ้งซ่อม" AutoPostBack="True" Enabled="False"/>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style5">
                <asp:Label ID="Label23" runat="server" Text="เลขที่ใบแจ้ง"></asp:Label>
                        </td>
            <td class="auto-style4"> 
                 <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                     <ContentTemplate>
                         <asp:TextBox ID="lblnumber" runat="server" Enabled="False" Width="229px"></asp:TextBox>
                     </ContentTemplate>
                 </asp:UpdatePanel></td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
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
                <asp:Label ID="Label5" runat="server" Text="ชื่อผู้แจ้งเรื่อง"></asp:Label>
            </td>
            <td> <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtname" runat="server" Width="347px" Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="txtnameemail" runat="server" Enabled="False" Visible="False" Width="347px"></asp:TextBox>
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
                <asp:Label ID="Label6" runat="server" Text="ชื่อผู้จัดการ"></asp:Label>
            </td>
            <td> <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtmanager" runat="server" Width="347px" Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="txtmanageremail" runat="server" Enabled="False" Visible="False" Width="347px"></asp:TextBox>
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
                    <asp:TextBox ID="txthead" runat="server" Width="347px" Enabled="False"></asp:TextBox>
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
                    <asp:TextBox ID="txtdetail" runat="server" Width="755px" Height="148px" TextMode="MultiLine" Enabled="False"></asp:TextBox>
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
            <td class="auto-style58"></td>
            <td valign="top" style="text-align: right" class="auto-style58">
                      <asp:Label ID="Label1" runat="server" Text="หมายเหตุ"></asp:Label>
            </td>
            <td valign="top"class="auto-style58">   <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtuserreamrk" runat="server" Width="755px" Height="67px" TextMode="MultiLine" Enabled="False"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style59"></td>
            <td valign="top" style="text-align: right" class="auto-style59">
                      <asp:Label ID="Label39" runat="server" Text="แนบไฟล์ 1"></asp:Label>
            </td>
            <td valign="top"class="auto-style59">   
                <asp:HyperLink ID="hlAttachment" runat="server">Attachments</asp:HyperLink>
                <asp:Button ID="btnViewFile" runat="server" ForeColor="Blue" onclick="btnViewFile_Click" Text="View" />
            </td>
            <td class="auto-style59"></td>
            <td class="auto-style59"></td>
            <td class="auto-style59"></td>
            <td class="auto-style59"></td>
            <td class="auto-style59"></td>
            <td class="auto-style59"></td>
            <td class="auto-style59"></td>
        </tr>
        <tr>
            <td class="auto-style59">&nbsp;</td>
            <td valign="top" style="text-align: right" class="auto-style59">
                      <asp:Label ID="Label40" runat="server" Text="แนบไฟล์ 2"></asp:Label>
            </td>
            <td valign="top"class="auto-style59">   
                <asp:HyperLink ID="HyperLink2" runat="server">Attachments</asp:HyperLink>
                <asp:Button ID="btnViewFile0" runat="server" ForeColor="Blue" OnClick="btnViewFile0_Click" Text="View" />
            </td>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style59">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td valign="top">
                &nbsp;</td>
            <td style="text-align: left"> 
<asp:Image ID="Image2" runat="server" Height = "350px" Width = "600px" />
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
            <td class="auto-style6">
                &nbsp;</td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
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
