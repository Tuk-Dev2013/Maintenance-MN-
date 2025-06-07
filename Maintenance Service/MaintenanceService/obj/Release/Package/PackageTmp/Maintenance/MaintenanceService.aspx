<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Maintenance.Master" AutoEventWireup="true" CodeBehind="MaintenanceService.aspx.cs" Inherits="MaintenanceService.Maintenance.MaintenanceService" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


.dxeButtonEditSys 
{
    width: 170px;
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

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

input[type=text].dxeEditAreaSys
{
    padding: 0px 1px 0px 0px; /* B146658 */
}

input[type=text].dxeEditAreaSys
{
    margin-top: 0;
    margin-bottom: 0;
}
input[type=text].dxeEditAreaSys
{
    font: inherit;
    line-height: normal;
    outline: 0;
}

input[type=text].dxeEditAreaSys
{
    display: block;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-transition: none;
    -moz-transition: none;
    -o-transition: none;
    transition: none;
	-webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
}

.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}


.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}

.dxeEditAreaSys
{
    padding: 0px 1px 0px 0px; /* B146658 */
}
.dxeEditAreaSys
{
    font: inherit;
    line-height: normal;
    outline: 0;
}


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


    .dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


.dxeTextBoxSys 
{
    width: 170px;
}

        .auto-style4
        {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="dxflInternalEditorTable_Moderno">
    <tr>
        <td>
                <asp:Label ID="Label3" runat="server" Text="Maintenance Service" style="font-weight: 700"></asp:Label>
               <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
            </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="5">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" EnableTheming="True" KeyFieldName="IssueNo" Theme="Office2010Blue" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
       
                                <dx:GridViewDataHyperLinkColumn FieldName="IssueNo" 
                                UnboundType="String"
                                UnboundExpression="'?id='+[IssueNo]" 
                                VisibleIndex="1" Width="130px" Caption="เลขที่ใบแจ้ง">
                               <PropertiesHyperLinkEdit TextField="IssueNo" 
                             DisplayFormatString="Open <b>{0}<b/>" 
                             NavigateUrlFormatString="Frmviewhistory.aspx?id={0}">
                            </PropertiesHyperLinkEdit>
                                    <HeaderStyle Font-Bold="True" Font-Overline="False" Font-Size="9pt" ForeColor="#0000CC" />
                                    <CellStyle Font-Bold="True" Font-Size="9pt" ForeColor="#0000CC">
                                    </CellStyle>
                             </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataTextColumn FieldName="IssueName" VisibleIndex="3" Caption="ชื่อผู้แจ้งเรื่อง">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="IssueDate" VisibleIndex="4" UnboundType="DateTime" Caption="วันที่แจ้งเรื่อง">
                                     <PropertiesDateEdit DisplayFormatString="yyyy/MM/dd hh:mm:ss" >  
       </PropertiesDateEdit>  
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="IssueDept" VisibleIndex="5" Caption="แผนก">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IssueHead" VisibleIndex="6" Caption="ชื่อเรื่องแจ้ง">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8" Caption="Status">
                                    <HeaderStyle Font-Bold="True" />
                                      <CellStyle BackColor="#66FFCC">
                                      </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MNName" VisibleIndex="9" Caption="ชื่อผู้รับเรื่อง(MN)">
                                    <HeaderStyle Font-Bold="True" ForeColor="#000066" />
                                    <CellStyle BackColor="#FFFFCC">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="MNDate" VisibleIndex="10" Caption="วันที่รับเรื่อง(MN)">
                                     <PropertiesDateEdit DisplayFormatString="yyyy/MM/dd hh:mm:ss" >  
       </PropertiesDateEdit>  
                                    <HeaderStyle Font-Bold="True" ForeColor="#000066" />
                                     <CellStyle BackColor="#FFFFCC">
                                     </CellStyle>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="MNIssueName" VisibleIndex="11" Caption="ผู้ปฏิบัติงาน(MN)">
                                    <HeaderStyle Font-Bold="True" ForeColor="#000066" />
                                    <CellStyle BackColor="#FFFFCC">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Manager Remark" FieldName="ManagerRemark" VisibleIndex="7">
                                      <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                         
                                  <dx:GridViewDataComboBoxColumn Caption="สถานะ" FieldName="MNStatus" VisibleIndex="12">
                                     <PropertiesComboBox>
                                         <Items>
                                             <dx:ListEditItem />
                                             <dx:ListEditItem Text="รับเรื่องแล้ว" Value="รับเรื่องแล้ว" />
                                             <dx:ListEditItem Text="อยู่ระหว่างดำเนินการ" Value="อยู่ระหว่างดำเนินการ" />
                                             <dx:ListEditItem Text="รอดำเนินการ" Value="รอดำเนินการ" />
                                             <dx:ListEditItem Text="รออะไหล่/อุปกรณ์" Value="รออะไหล่/อุปกรณ์" />
                                         </Items>
                                     </PropertiesComboBox>
                                     <HeaderStyle CssClass="myHeader2" Font-Bold="True"  HorizontalAlign="Center" ForeColor="#0000CC" />
                                     <CellStyle Cursor="default"  HorizontalAlign="Center" Font-Bold="True" ForeColor="#0000CC" BackColor="#99FFCC">
                                     </CellStyle>
                                 </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataTextColumn Caption="ประเภท" FieldName="TypeHead" VisibleIndex="2" Width="40px">
                                     <HeaderStyle Font-Bold="True" ForeColor="#000066" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="ตรวจสอบ(ผู้ใช้)" FieldName="CkUser" VisibleIndex="13">
                                    <HeaderStyle Font-Bold="True" ForeColor="#0000CC" />
                                    <CellStyle BackColor="#99FFCC">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsPager PageSize="200">
                            </SettingsPager>
                            <Settings ShowFilterRow="True" />
                            <SettingsCommandButton>
                                <DeleteButton ButtonType="Image">
                                    <Image IconID="actions_cancel_32x32">
                                    </Image>
                                </DeleteButton>
                            </SettingsCommandButton>
                            <SettingsSearchPanel Visible="True" />
                            <Styles>
                                <AlternatingRow Enabled="True">
                                </AlternatingRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="MaintenanceService.DataAccess.ProjectDataSetTableAdapters.tb_DocIssueMNChecklist">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_IssueNo" Type="String" />
                            </DeleteParameters>
                        </asp:ObjectDataSource>
                    </td>
    </tr>
    <tr>
        <td class="auto-style4"></td>
        <td class="auto-style4"></td>
        <td class="auto-style4"></td>
        <td class="auto-style4"></td>
        <td class="auto-style4"></td>
    </tr>
    <tr>
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
    </tr>
</table>
</asp:Content>
