<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="PageStockbal.aspx.cs" Inherits="MaintenanceService.PageStockbal" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="~/Style/Site.css"/>
     <script type="text/javascript">
         function ConfirmDelete() {
             if (confirm('Do you want to delete?')) {
                 return true;
             } else {
                 return false;
             }
         }
    </script> 
<style type="text/css">
    .auto-style2
    {
        width: 100%;
    }
    .auto-style6
    {
    }
    .auto-style7
    {
        width: 111px;
        height: 25px;
    }
    .auto-style8
    {
        height: 25px;
    }
    .auto-style9
    {
        width: 111px;
        height: 37px;
    }
    .auto-style10
    {
        height: 37px;
    }
    .auto-style11
    {
        width: 111px;
        height: 23px;
    }
    .auto-style12
    {
        height: 23px;
    }
.dxeTrackBar_Office2003Blue, 
.dxeIRadioButton_Office2003Blue, 
.dxeButtonEdit_Office2003Blue, 
.dxeTextBox_Office2003Blue, 
.dxeRadioButtonList_Office2003Blue, 
.dxeCheckBoxList_Office2003Blue, 
.dxeMemo_Office2003Blue, 
.dxeListBox_Office2003Blue, 
.dxeCalendar_Office2003Blue, 
.dxeColorTable_Office2003Blue
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox_Office2003Blue,
.dxeButtonEdit_Office2003Blue,
.dxeIRadioButton_Office2003Blue,
.dxeRadioButtonList_Office2003Blue,
.dxeCheckBoxList_Office2003Blue
{
    cursor: default;
}

.dxeButtonEdit_Office2003Blue
{
	background-color: white;
	border: 1px solid #6a8ccb;
	font: 12px Tahoma, Geneva, sans-serif;
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

.dxeButtonEdit_Office2003Blue .dxeEditArea_Office2003Blue
{
	background-color: white;
}

.dxeEditArea_Office2003Blue
{
	border: 1px solid #6a8ccb;
}
.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}


.dxeButtonEditButton_Office2003Blue.dxeButtonEditClearButton_Office2003Blue,
.dxeButtonEditButton_Office2003Blue.dxeButtonEditClearButton_Office2003Blue:hover
{
    background: none;
    border-width: 0;
    padding-bottom: 1px;
    padding-top: 2px;
}

.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


.dxeButtonEditButton_Office2003Blue,
.dxeCalendarButton_Office2003Blue,
.dxeSpinIncButton_Office2003Blue,
.dxeSpinDecButton_Office2003Blue,
.dxeSpinLargeIncButton_Office2003Blue,
.dxeSpinLargeDecButton_Office2003Blue,
.dxeColorEditButton_Office2003Blue
{
	vertical-align: middle;
	border: 1px solid #6a8ccb;
	cursor: pointer;
	text-align: center;
	white-space: nowrap;
} 
.dxEditors_edtClear_Office2003Blue
{
    background-position: -42px -266px;
    width: 13px;
    height: 13px;
}
.dxeButtonEditButtonHover_Office2003Blue .dxEditors_edtClear_Office2003Blue,
.dxEditors_caRefresh_Office2003Blue,
.dxEditors_edtCalendarFNNextYear_Office2003Blue,
.dxEditors_edtCalendarFNPrevYear_Office2003Blue,
.dxEditors_edtCalendarNextMonth_Office2003Blue,
.dxEditors_edtCalendarNextMonthDisabled_Office2003Blue,
.dxEditors_edtCalendarNextYear_Office2003Blue,
.dxEditors_edtCalendarNextYearDisabled_Office2003Blue,
.dxEditors_edtCalendarPrevMonth_Office2003Blue,
.dxEditors_edtCalendarPrevMonthDisabled_Office2003Blue,
.dxEditors_edtCalendarPrevYear_Office2003Blue,
.dxEditors_edtCalendarPrevYearDisabled_Office2003Blue,
.dxEditors_edtClear_Office2003Blue,
.dxEditors_edtDETSClockFace_Office2003Blue,
.dxEditors_edtDETSHourHand_Office2003Blue,
.dxEditors_edtDETSMinuteHand_Office2003Blue,
.dxEditors_edtDETSSecondHand_Office2003Blue,
.dxEditors_edtDropDown_Office2003Blue,
.dxEditors_edtDropDownDisabled_Office2003Blue,
.dxEditors_edtEllipsis_Office2003Blue,
.dxEditors_edtEllipsisDisabled_Office2003Blue,
.dxEditors_edtError_Office2003Blue,
.dxEditors_edtRadioButtonChecked_Office2003Blue,
.dxEditors_edtRadioButtonCheckedDisabled_Office2003Blue,
.dxEditors_edtRadioButtonUnchecked_Office2003Blue,
.dxEditors_edtRadioButtonUncheckedDisabled_Office2003Blue,
.dxEditors_edtSpinEditDecrementImage_Office2003Blue,
.dxEditors_edtSpinEditDecrementImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditIncrementImage_Office2003Blue,
.dxEditors_edtSpinEditIncrementImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditLargeDecImage_Office2003Blue,
.dxEditors_edtSpinEditLargeDecImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditLargeIncImage_Office2003Blue,
.dxEditors_edtSpinEditLargeIncImageDisabled_Office2003Blue,
.dxEditors_edtTBDecBtn_Office2003Blue,
.dxEditors_edtTBDecBtnDisabled_Office2003Blue,
.dxEditors_edtTBDecBtnHover_Office2003Blue,
.dxEditors_edtTBDecBtnPressed_Office2003Blue,
.dxEditors_edtTBIncBtn_Office2003Blue,
.dxEditors_edtTBIncBtnDisabled_Office2003Blue,
.dxEditors_edtTBIncBtnHover_Office2003Blue,
.dxEditors_edtTBIncBtnPressed_Office2003Blue,
.dxEditors_edtTokenBoxTokenRemoveButton_Office2003Blue,
.dxEditors_edtTokenBoxTokenRemoveButtonDisabled_Office2003Blue,
.dxEditors_fcadd_Office2003Blue,
.dxEditors_fcaddhot_Office2003Blue,
.dxEditors_fcgroupaddcondition_Office2003Blue,
.dxEditors_fcgroupaddgroup_Office2003Blue,
.dxEditors_fcgroupand_Office2003Blue,
.dxEditors_fcgroupnotand_Office2003Blue,
.dxEditors_fcgroupnotor_Office2003Blue,
.dxEditors_fcgroupor_Office2003Blue,
.dxEditors_fcgroupremove_Office2003Blue,
.dxEditors_fcopany_Office2003Blue,
.dxEditors_fcopbegin_Office2003Blue,
.dxEditors_fcopbetween_Office2003Blue,
.dxEditors_fcopblank_Office2003Blue,
.dxEditors_fcopcontain_Office2003Blue,
.dxEditors_fcopend_Office2003Blue,
.dxEditors_fcopequal_Office2003Blue,
.dxEditors_fcopgreater_Office2003Blue,
.dxEditors_fcopgreaterorequal_Office2003Blue,
.dxEditors_fcopless_Office2003Blue,
.dxEditors_fcoplessorequal_Office2003Blue,
.dxEditors_fcoplike_Office2003Blue,
.dxEditors_fcopnotany_Office2003Blue,
.dxEditors_fcopnotbetween_Office2003Blue,
.dxEditors_fcopnotblank_Office2003Blue,
.dxEditors_fcopnotcontain_Office2003Blue,
.dxEditors_fcopnotequal_Office2003Blue,
.dxEditors_fcopnotlike_Office2003Blue,
.dxEditors_fcremove_Office2003Blue,
.dxEditors_fcremovehot_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBHSys .dxeFocusedMDHSys .dxEditors_edtTBMainDH_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBHSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHHover_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBHSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHPressed_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBHSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDH_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBHSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHHover_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBHSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHPressed_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBVSys .dxeFocusedMDHSys .dxEditors_edtTBMainDH_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBVSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHHover_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBVSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHPressed_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBVSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDH_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBVSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHHover_Office2003Blue,
.dxeFocused_Office2003Blue .dxeTBVSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHPressed_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBMainDH_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBMainDHDisabled_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBMainDHHover_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBMainDHPressed_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDH_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDHDisabled_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDHHover_Office2003Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDHPressed_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBMainDH_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBMainDHDisabled_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBMainDHHover_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBMainDHPressed_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDH_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDHDisabled_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDHHover_Office2003Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDHPressed_Office2003Blue
{
   
    background-repeat: no-repeat;
    background-color: transparent;
}

.dxpDesignMode,
.dxpDesignMode b {
	float: none !important;
}

.dxpDesignMode {
	display: inline;
}

.dxp-summary,
.dxp-sep,
.dxp-button,
.dxp-pageSizeItem,
.dxp-num,
.dxp-current,
.dxp-ellip
{
	display: block;
	float: left;
    line-height: 100%;
}
.dxp-button,
.dxp-dropDownButton,
.dxp-num
{
    cursor: pointer;
}
.dx-clear
{
	display: block;
	clear: both;
	height: 0;
	width: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	visibility: hidden;
}
    .auto-style18
    {
        width: 84px;
    }
    .auto-style19
    {
        width: 10px;
    }
    .auto-style20
    {
        width: 188px;
    }
    .auto-style21
    {
        height: 23px;
        width: 188px;
    }
    .auto-style22
    {
        height: 25px;
        width: 188px;
    }
    .auto-style23
    {
        height: 37px;
        width: 188px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <table class="auto-style2">
    <tr>
        <td class="auto-style6">
            <asp:Label ID="Label3" runat="server" Text="Itemcode :"></asp:Label>
        </td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtcode" runat="server" Width="226px"></asp:TextBox>
                    <asp:Label ID="lblname" runat="server" ForeColor="Red" Text="***" Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td class="auto-style20">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">
            <asp:Label ID="Label4" runat="server" Text="ItemName : "></asp:Label>
        </td>
        <td class="auto-style12">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtitemname" runat="server"  Width="494px"></asp:TextBox>
                    <asp:Label ID="lblitemname" runat="server" ForeColor="Red" Text="*** " Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td class="auto-style12"></td>
        <td class="auto-style12"></td>
        <td class="auto-style21"></td>
        <td class="auto-style12"></td>
    </tr>
    <tr>
        <td class="auto-style6">
            <asp:Label ID="Label5" runat="server" Text="Model :"></asp:Label>
        </td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtmodel" runat="server"  Width="226px"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td class="auto-style20">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style7">
            <asp:Label ID="Label6" runat="server" Text="Location :"></asp:Label>
        </td>
        <td class="auto-style8">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtlocaion" runat="server"  Width="226px"></asp:TextBox>
                    <asp:Label ID="Label7" runat="server" Text="Max :"></asp:Label>
                    <asp:TextBox ID="txtmax" runat="server"  Width="111px">0</asp:TextBox>
                    <asp:Label ID="Label8" runat="server" Text="Min :"></asp:Label>
                    <asp:TextBox ID="txtmin" runat="server"  Width="111px">0</asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style8"></td>
        <td class="auto-style22"></td>
        <td class="auto-style8"></td>
    </tr>
    <tr>
        <td class="auto-style9"></td>
        <td class="auto-style10">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style18">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="bntsave" runat="server" Text="SAVE" OnClick="bntsave_Click" Width="80px" />
                                <asp:Button ID="bntupdate" runat="server" OnClick="bntupdate_Click" Text="UPDATE" Visible="False" Width="80px" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td class="auto-style19">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="bntcancel" runat="server" Text="CANCEL" OnClick="bntcancel_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="bntdelete" runat="server" OnClick="bntdelete_Click" Text="DELETE" OnClientClick="return ConfirmDelete();" Visible="False" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </td>
        <td class="auto-style10"></td>
        <td class="auto-style10"></td>
        <td class="auto-style23"></td>
        <td class="auto-style10" style="left: auto">
            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                <ContentTemplate>
                    <asp:Button ID="bntdelete0" runat="server" BackColor="#3399FF" Font-Bold="True" ForeColor="White" Text="Print Stock" Width="154px" PostBackUrl="~/FrmPrintBal.aspx" />
                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
    </tr>
    <tr>
        <td class="auto-style6" colspan="6">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <dx:ASPxGridView ID="gvStdTime" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" EnableTheming="True" KeyFieldName="Itemcode" Theme="BlackGlass" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="No" FieldName="Row" VisibleIndex="0" Width="80px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Itemcode" FieldName="Itemcode" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="ItemName" FieldName="ItemName" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Model" FieldName="Model" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Location" FieldName="Location" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Max" FieldName="MaxItem" VisibleIndex="5" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Min" FieldName="MinItem" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Qty In" FieldName="QtyIn" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Qty Out" FieldName="QtyOut" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Qty Bal" FieldName="QtyBal" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Create Date" FieldName="Createdate" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                               <dx:GridViewDataHyperLinkColumn Caption="Edit" FieldName="Itemcode" VisibleIndex="11" Width="20px">
                        <PropertiesHyperLinkEdit ImageHeight="15px" ImageUrl="~/Images/edit.png" ImageWidth="15px" NavigateUrlFormatString="~/PageStockbal.aspx?Itemcode={0}&amp;mode=edit">
                        </PropertiesHyperLinkEdit>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataHyperLinkColumn>
                        </Columns>
                        <SettingsPager PageSize="60">
                        </SettingsPager>
                        <SettingsCommandButton>
                            <NewButton ButtonType="Button" Text="Add">
                            </NewButton>
                            <UpdateButton ButtonType="Button" Text="Save">
                            </UpdateButton>
                            <CancelButton ButtonType="Button">
                            </CancelButton>
                            <EditButton ButtonType="Button">
                            </EditButton>
                            <DeleteButton ButtonType="Button">
                            </DeleteButton>
                        </SettingsCommandButton>
                        <settingsdatasecurity allowinsert="False" />
                        <SettingsSearchPanel Visible="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <DetailRow BackColor="#CCFFFF">
                            </DetailRow>
                            <DetailCell BackColor="#FF9999">
                            </DetailCell>
                            <PreviewRow BackColor="#EBEBEB">
                            </PreviewRow>
                            <AlternatingRow BackColor="Silver">
                            </AlternatingRow>
                            <selectedrow backcolor="#E4EFFA">
                            </selectedrow>
                            <Cell BackColor="White">
                            </Cell>
                        </Styles>
                    </dx:ASPxGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="StdTimeEditor.DataAccess.ProjectDataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
                </td>
    </tr>
</table>
    </div>

</asp:Content>
