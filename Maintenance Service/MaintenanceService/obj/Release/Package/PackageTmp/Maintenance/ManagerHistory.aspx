<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Maintenance.Master" AutoEventWireup="true" CodeBehind="ManagerHistory.aspx.cs" Inherits="MaintenanceService.Maintenance.ManagerHistory" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4
        {
            width: 218px;
        }
        .auto-style5
        {
            height: 28px;
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

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

.dxeButtonEditSys 
{
    width: 170px;
}

.dxeMemoEditAreaSys, /*Bootstrap correction*/
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
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
.dxeEditAreaSys,
.dxeMemoEditAreaSys, /*Bootstrap correction*/
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    font: inherit;
    line-height: normal;
    outline: 0;
}

input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    margin-top: 0;
    margin-bottom: 0;
}
.dxeEditAreaSys,
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    padding: 0px 1px 0px 0px; /* B146658 */
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


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="dxflInternalEditorTable_Moderno">
        <tr>
            <td class="auto-style5" colspan="10">
                <asp:Label ID="Label3" runat="server" Text="List History" style="font-weight: 700"></asp:Label>
               <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                  
                        <asp:Label ID="lblstatus" runat="server" Text="Label" Visible="False"></asp:Label>
                  
                    </ContentTemplate>
                </asp:UpdatePanel>
              
            </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="10">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" EnableTheming="True" KeyFieldName="IssueNo" Theme="Office2010Blue" Width="100%" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
       
                                <dx:GridViewDataHyperLinkColumn FieldName="IssueNo" 
                                UnboundType="String"
                                UnboundExpression="'?id='+[IssueNo]" 
                                VisibleIndex="1" Width="130px">
                               <PropertiesHyperLinkEdit TextField="IssueNo" 
                             DisplayFormatString="Open <b>{0}<b/>" 
                             NavigateUrlFormatString="Frmviewhistory.aspx?id={0}"></PropertiesHyperLinkEdit>
                                    <HeaderStyle Font-Bold="True" Font-Overline="False" Font-Size="9pt" ForeColor="#0000CC" />
                                    <CellStyle Font-Bold="True" Font-Size="9pt" ForeColor="#0000CC">
                                    </CellStyle>
                             </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataTextColumn FieldName="IssueName" VisibleIndex="2">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="IssueDate" VisibleIndex="3" UnboundType="DateTime">
                                     <PropertiesDateEdit DisplayFormatString="yyyy/MM/dd hh:mm:ss" ></PropertiesDateEdit>  
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="IssueDept" VisibleIndex="4">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="IssueHead" VisibleIndex="5" Caption="Issue Title">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="8" Caption="Status">
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="IssueDetail" FieldName="IssueDetail" VisibleIndex="6">
                                        <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Remark" FieldName="Remark" VisibleIndex="7">
                                        <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="ผู้รับเรื่อง(MN)" FieldName="MNName" VisibleIndex="9">
                                      <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="วันที่รับเรื่อง(MN)" FieldName="MNDate" VisibleIndex="10">
                                      <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="ผู้ปฎิบัติงาน(MN)" FieldName="MNIssueName" VisibleIndex="11">
                                      <HeaderStyle Font-Bold="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="สถานะ(MN)" FieldName="MNStatus" VisibleIndex="12" Width="100px">
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
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="MaintenanceService.DataAccess.ProjectDataSetTableAdapters.tb_DocIssueAppMnaagerHistory" InsertMethod="Insert" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_IssueNo" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="IssueNo" Type="String" />
                                <asp:Parameter Name="IssueName" Type="String" />
                                <asp:Parameter Name="IssueDate" Type="DateTime" />
                                <asp:Parameter Name="IssueDept" Type="String" />
                                <asp:Parameter Name="IssueHead" Type="String" />
                                <asp:Parameter Name="IssueDetail" Type="String" />
                                <asp:Parameter Name="Remark" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblstatus" Name="IssueDept" PropertyName="Text" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IssueName" Type="String" />
                                <asp:Parameter Name="IssueDate" Type="DateTime" />
                                <asp:Parameter Name="IssueDept" Type="String" />
                                <asp:Parameter Name="IssueHead" Type="String" />
                                <asp:Parameter Name="IssueDetail" Type="String" />
                                <asp:Parameter Name="Remark" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="Original_IssueNo" Type="String" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
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
            <td colspan="10">&nbsp;</td>
        </tr>
        </table>
</asp:Content>
