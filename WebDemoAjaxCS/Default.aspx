<%@ Page Language="C#" AutoEventWireup="true" Inherits="QueryMainForm" EnableSessionState="True" Trace="False" EnableEventValidation = "False" Codebehind="Default.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
  
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
	<head runat="server"> 
		<meta name="vs_snapToGrid" content="True" />
		<title>Task2 - Custom report generator</title>
		<meta content="C#" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
        <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <link href="EQStyles.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
          a:link { color:#006699 }
          a:active { color:#FF0000 }
          a:visited { color:#006699 }
          img {
              border-width:0px;
          }              
          td.leftCol{
            background-color:#FFFFFF;
            border-color:#4B9EDC;
            border-style:solid;
            border-width:4px 1px 4px 4px;
            vertical-align:top;
            padding: 4px;
          }

          td.rightCol{
            background-color:#FFFFFF;
            border-color:#4B9EDC;
            border-style:solid;
            border-width:4px 4px 4px 1px;
          }
          
        </style>
        <script type="text/javascript">
        function lang(){
            var theForm = getElementById('lang');
            if (theForm.value == "eng"){
                
            }
        }
        </script>
    </head>
<body>
<form id="Form1" method="post" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />
<div id="main">
		<div class="header">
            <div class="IndexTitle">
                <asp:Literal ID="txtTitle" runat="server" Text="Task 2" /><br />
                <div><asp:Literal ID="txtSubTitle" runat="server" Text="Custom report generator" /></div>
            </div>  
            <div class="header-right-side"> 
                <div class="comboLang">
                    <asp:LinkButton ID="lnkBtnEng" Visible="false" runat="server" CommandName="LangSwitch" CommandArgument="en-US" OnCommand="LangSwitch_Command">English</asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnRu" Visible="false" runat="server" CommandName="LangSwitch" CommandArgument="ru-RU" OnCommand="LangSwitch_Command">Russian</asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnEsp" Visible="false" runat="server" CommandName="LangSwitch" CommandArgument="es-ES" OnCommand="LangSwitch_Command">Spanish</asp:LinkButton>
                    <span class="version"><asp:Label Visible="false" ID="LabelVersion" runat="server"></asp:Label></span>
                </div>	        
                <div class="headerButtons">     
                    <asp:Button ID="btnClear" runat="server" OnClick="ClearBtn_Click" Text="Clear"  CssClass="clearButton" meta:resourcekey="btnClear" />
                    <asp:Button ID="btnSave" runat="server" OnClick="SaveBtn_Click" Text="Save.." CssClass="saveButton"  meta:resourcekey="btnSave" />
                    <!--<asp:Literal ID="txtQueryFile" runat="server" Text="<%$ Resources:txtQueryFile%>" />--> 
                    <!--<asp:FileUpload ID="SavedQueryUpload" runat="server" CssClass="inputFileButton" />-->
                    <!--<asp:Button ID="btnLoad" runat="server" OnClick="LoadBtn_Click" Text="Load" CssClass="loadButton"  meta:resourcekey="btnLoad"/>-->                                                   
                </div>
            </div>                
        </div>
        
<asp:Label ID="ErrorLabel" runat="server" Text="______" CssClass="error-label" Visible="False"></asp:Label>
<div id="content">
    <div class="eqdax-entitiesPanel">        
	   <asp:UpdatePanel ID="UpdatePanelEntities" runat="server">
                    <ContentTemplate>
                        <div class="eqdax-entitiesBorder"></div>
                        <div class="eqdax-entitiesTitle">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:txtEntAttr%>" />
                        </div>
                        <keqwc:EntitiesPanel ID="EntitiesPanel1" runat="server" BorderStyle="None" ToolTip="Entities and attributes" 
                            cssClass="eqdax-entities-table" UseAppearanceStyle="False"  ToolBarOnTop="False" UseDefaultStyle="False"></keqwc:EntitiesPanel>							
                    </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
    <div class="eqdax-rightBlocks">
        <div class="eqdax-columnsBlock">
        <asp:UpdatePanel ID="UpdatePanelColumns" runat="server">
            <ContentTemplate>
                <div class="eqdax-resultColumn">
                <div class="eqdax-topBorder-block"></div>
                    <span class="eqdax-resultColumn-title"><asp:Literal ID="txtResultColumns" runat="server" Text="<%$ Resources:txtResultColumns%>" />
                    </span> 
                    <asp:Panel ID="QCAddRowPanel" CssClass="eqdax-resultColumn-addRow" runat="server"></asp:Panel>                   
                    <keqwc:QueryColumnsPanel ID="QueryColumnsPanel1" runat="server" BorderStyle="none" ShowHeaders="True" 
                        ToolTip="Result Columns" UseDefaultStyle="False" 
                        UseAppearanceStyle="False" 
                        Appearance-AttrElementFormat="{entity} {attr}" 
                        Appearance-RowButtonTooltip="Click here to see all available operations"></keqwc:QueryColumnsPanel>							
                </div>              
                <div class="eqdax-columnSorting-block">
                    <div class="eqdax-topBorder-block"></div>
                    <span class="eqdax-columnSorting-title">
                    <asp:Literal ID="txtColumnSoring" runat="server" Text="<%$ Resources:txtColumnSorting%>" /></span>                     
                    <asp:Panel ID="QSAddRowPanel" CssClass="eqdax-columnSorting-addRow" runat="server"></asp:Panel>
                    <keqwc:SortColumnsPanel ID="SortColumnsPanel1" runat="server" ToolTip="Columns Sorting" BorderStyle="none" UseDefaultStyle="False" 
                        UseAppearanceStyle="False"></keqwc:SortColumnsPanel>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>

        <div class="eqdax-conditionsPanel">
            <div class="eqdax-topBorder-block"></div>
                <span class="eqdax-queryConditions-title"><asp:Literal ID="txtQueryConditions" runat="server" Text="<%$ Resources:txtQueryConditions%>" /></span>
                <asp:UpdatePanel ID="UpdatePanelConditions" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="QPAddRowPanel" CssClass="eqdax-queryCondition-addRow" runat="server"></asp:Panel>
                        <keqwc:QueryPanel ID="QueryPanel1" runat="server"
                            BorderStyle="none" ScrollBars="Auto"
                            OnListRequest="QueryPanel1_ListRequest" 
                            OnCreateValueElement="QueryPanel1_CreateValueElement" 
                            Appearance-ScriptMenuStyle-ItemMinWidth="160" 
                            UseListCache="True"
                            KeepSessionAlive="True" 
                            UseDefaultStyle="False" UseAppearanceStyle="False"></keqwc:QueryPanel>
                    </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


<div id="contentBot" class="eqdax-resultBlock">
	<div id="eqdax-sqlPanel">
    	<div class="eqdax-topBorderSQL"></div>
		<div class="eqdax-sqlTitle">SQL</div>
        <div class="eqdax-sqlPanel-block">
			<asp:UpdatePanel ID="UpdatePanel3" runat="server">
				<ContentTemplate>
                	<asp:TextBox ID="SqlTextBox" runat="server" CssClass="eqdax-sqlPanel-textBox" TextMode="MultiLine"></asp:TextBox>
				</ContentTemplate>
			</asp:UpdatePanel>
        </div>
	</div>
    <div class="eqdax-resultTable">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
        <ContentTemplate>
            <div class="eqdax-topBorderUpdatePanel"></div>
                <div class="eqdax-updatePanel-bottomBorder">
           <span class="eqdax-resultPanel-title"><asp:Literal ID="txtResult" runat="server" Text="<%$ Resources:txtResult%>" />  </span>
 		 <span class="eqdax-resultPanel-actions">
            <asp:Button ID="btnUpdateResult" runat="server" OnClick="UpdateResultBtn_Click" Text="Update Result" CssClass="eqdax-resultPanel-updateButton"  meta:resourcekey="btnUpdateResult" /> </span>
           <span class="eqdax-resultPanel-export">
              <asp:Button ID="btnExportExcel" runat="server" OnClick="ExportExcelBtn_Click" Text="Export to Excel" CssClass="eqdax-resultPanel-exportButton"  meta:resourcekey="btnExportExcel" />
              <asp:Button ID="btnExportCsv" runat="server" OnClick="ExportCsvBtn_Click"  Text="Export to Csv" CssClass="eqdax-resultPanel-exportButton" meta:resourcekey="btnExportCsv" />
                            </span>
                </div>
                <asp:Label ID="ResultLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Panel ID="PanelResult" runat="server" >
                    <asp:GridView ID="ResultGrid" runat="server" DataSourceID="ResultDS" CellPadding="4"  CellSpacing="2" GridLines="Vertical">
                    </asp:GridView>
                </asp:Panel>
        </ContentTemplate>
        <Triggers>
           <asp:PostBackTrigger ControlID="btnExportExcel" />
           <asp:PostBackTrigger ControlID="btnExportCsv" />
           <asp:AsyncPostBackTrigger ControlID="SqlTextBox" EventName="TextChanged" />
         </Triggers>
    </asp:UpdatePanel>
    </div>
</div>
</div>
    <span class="copyright">

      

        <asp:SqlDataSource ID="ResultDS" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ></asp:SqlDataSource>

    </span>
</div>

<div style="display: none;">
<asp:UpdatePanel ID="UpdatePanelQueryText" runat="server">
    <ContentTemplate>
        <asp:Literal ID="literalQueryText" runat="server"></asp:Literal><br />&nbsp;
    </ContentTemplate>
</asp:UpdatePanel>
                    
    <asp:UpdateProgress ID="UpdateProgressColumns" runat="server" AssociatedUpdatePanelID="UpdatePanelColumns">
        <ProgressTemplate>
            <span style="font-weight:bold;font-size:14px">Processing... </span>
            <img src="images/progressBar2.gif" alt="Progress Bar"/>
        </ProgressTemplate>
    </asp:UpdateProgress>
    
    <asp:UpdateProgress ID="UpdateProgressConditions" runat="server" AssociatedUpdatePanelID="UpdatePanelConditions">
        <ProgressTemplate>
            <span style="font-weight:bold;font-size:14px">Processing... </span>
            <img src="images/progressBar2.gif" alt="Progress Bar" /> 
        </ProgressTemplate>
    </asp:UpdateProgress>
</div>
        </form>
        			 
	</body>
</html>
