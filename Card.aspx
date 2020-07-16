<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Card.aspx.cs" Inherits="WebApplication_App.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Button ID="Button_Logout" runat="server" OnClick="Button_Logout_Click" Text="Logout" />
    
    <p style="font-size: xx-large"/>
        <strong>WorkCards</strong>
        <table class="nav-justified" >
            
            <tr>
                <td><strong></strong></td>
                <td><strong></strong></td>
                <td><strong></strong></td>
            </tr>



             <%-- Create new card --%>



            <tr>
                <td style="width: 365px"><strong><br /><br />Create new card</strong></td>
                <td style="width: 365px"><strong><br /><br />Edit or Delete card</strong></td>


            </tr>
            <tr>
                <td style="width: 365px">

                    <asp:Panel ID="Panel" runat="server">
                        <div class="text-left" style="width: 200px; margin-right: 0px">
                            <br />
                            <asp:Label ID="Lbl_project" runat="server" Text="Choose project"></asp:Label>
                            <asp:DropDownList ID="DropDownList_project" runat="server" CssClass="col-xs-offset-0"  Width="415px">
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Lbl_name" runat="server" Text="Give the card a name"></asp:Label>
                            <asp:TextBox ID="Txt_name" runat="server" Width="415px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Lbl_description" runat="server" Text="Give the card a description:"></asp:Label>
                            <asp:TextBox ID="Txt_description" runat="server" Height="99px" Width="415px"></asp:TextBox>

                            <br />
                            <asp:Label ID="Lbl_statusname" runat="server" Text="Choose status:"></asp:Label>
                            <asp:DropDownList ID="DropDownList_status" runat="server"></asp:DropDownList>
                            <br />
                        
                            <asp:Button ID="Btn_save" runat="server" OnClick="Btn_save_Click" Text="Save new card" />
                            <asp:Button ID="Btn_clear" runat="server" OnClick="Btn_clear_Click" Text="Clear card" />
                            <br />
                            <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    <br />


                            <script type="text/javascript">
                                function HideLabel() {
                                    var seconds = 5;
                                    setTimeout(function () {
                                        document.getElementById("<%=lblSuccessMessage.ClientID %>").style.display = "none";
                                        }, seconds * 1000);
                                };
                            </script>    
                        </div>
                    </asp:Panel>
                </td>



                <%-- Edit card --%>


                 <td style="width: 365px">

                    <asp:Panel ID="Panel4" runat="server">
                        <div class="text-left" style="width: 200px; margin-right: 0px">
                            <br />
                            <asp:Label ID="Lbl_choose_card" runat="server" Text="Choose card"></asp:Label>
                            <asp:DropDownList ID="DropDown_card" runat="server" CssClass="col-xs-offset-0"  Width="415px" OnSelectedIndexChanged="DropDown_card_SelectedIndexChanged" >
                            </asp:DropDownList>
                            <br />
                             <asp:Button ID="Btn_get_card_info" runat="server" Text="Get Card Info"  /><br />
                            <asp:Label ID="Lbl_c_name" runat="server" Text="Change Name"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" Width="415px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="Change description:"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Height="99px" Width="415px"></asp:TextBox>

                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Change status:"></asp:Label>
                            <asp:DropDownList ID="DropDownList_status1" runat="server"></asp:DropDownList>
                            <br />
                             <asp:Label ID="Label3" runat="server" Text="Change Project:"></asp:Label>
                            <asp:DropDownList ID="DropDownList_project1" runat="server"></asp:DropDownList>
                            <br />
                            <asp:Button ID="Btn_Save_Changes" runat="server" Text="Save Changes" OnClick="Btn_Save_Changes_Click" /> <br /> <br />
                            <asp:Button ID="Btn_Delete_Card" runat="server" Text="Delete Card" OnClick="Btn_Delete_Card_Click" />
                            <asp:Button ID="Btn_Cleaar" runat="server" OnClick="Btn_clear_Click1" Text="Clear card" />
                            
                            <br />
                            <asp:Label ID="lblSuccessMessage1" runat="server" Text="" ForeColor="Green"></asp:Label>
                            <asp:Label ID="lblErrorMessage1" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    <br />


                            <script type="text/javascript">
                                function HideLabel() {
                                    var seconds = 5;
                                    setTimeout(function () {
                                        document.getElementById("<%=lblSuccessMessage1.ClientID %>").style.display = "none";
                                        }, seconds * 1000);
                                };
                            </script>    
                        </div>
                    </asp:Panel>
                </td>

            </tr>



            <%-- TODO column --%>

            <tr>
                <td style="width: 365px">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:DataList ID="datalist_todo" runat="server" CellPadding="4" Font-Bold="True"
                            BorderStyle="Ridge" BorderWidth="5px"
                            Font-Names="Verdana" Font-Size="Small" RepeatColumns="1" RepeatDirection="Horizontal"
                            Width="383px" ForeColor="#333333" style="margin-right: 32px">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" Font-Size="Large" ForeColor="White"
                                HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderTemplate>
                                TO DO
                            </HeaderTemplate>
                            <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <ItemTemplate>

                                <table>
                                    <tr>
                                        <td> <br />

                                             
                                           <asp:Label ID="NameLabel" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" Font-Size="Large" Text='<%# Eval("name") %>' ForeColor="#000099" />
                                            ID: 
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("id") %>' ForeColor="#000099" /> <br /><br />
                                            <br />
                                            Description:<br />
                                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("description") %>' ForeColor="#000099" />
                                            <br />
                                            Status<br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Status_name") %>' ForeColor="#000099" />
                                            <br />
                                            Project<br />
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Project_id") %>' ForeColor="#000099" />

                                            <br />
                                          
                                    </tr>
                                </table>

                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        </asp:DataList>
                    </asp:Panel>
                </td>

                   <%-- DOING column --%>

                <td style="width: 342px">
                    <asp:Panel ID="Panel2" runat="server">
                    <asp:DataList ID="DataList_doing" runat="server" BackColor="White" 
                        BorderStyle="Ridge" BorderWidth="5px" CellPadding="3" Font-Bold="True"
                        Font-Names="Verdana" Font-Size="Small" GridLines="Horizontal" RepeatColumns="1"
                        Width="383px" style="margin-left: 0px; margin-right: 32px">
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" Font-Size="Large" ForeColor="#F7F7F7"
                            HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderTemplate>
                            DOING
                        </HeaderTemplate>
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <ItemTemplate>

                            <table >
                                <tr>
                                    <td> <br />                       
                        <asp:Label ID="NameLabel" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" Font-Size="Large"  Text='<%# Eval("name") %>' ForeColor="#000099" />
                                       ID: 
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("id") %>' ForeColor="#000099" /> <br /><br />
                                            <br />  <br />
                                        Description:<br />
                                        <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("description") %>' ForeColor="#000099" />
                                        <br />
                                        Status<br />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Status_name") %>' ForeColor="#000099" />
                                        <br />
                                        Project<br />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Project_id") %>' ForeColor="#000099" />
                                            <br />
                                </tr>
                            </table>

                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList></asp:Panel></td>


                   <%-- DOING column --%>

                <td style="width: 368px">
                    <asp:Panel ID="Panel3" runat="server">
                    <asp:DataList ID="DataList_done" runat="server" BackColor="White" BorderColor="#336666"
                        BorderStyle="Ridge" BorderWidth="5px" CellPadding="4" Font-Bold="True"
                        Font-Names="Verdana" Font-Size="Small" GridLines="Horizontal" RepeatColumns="1" RepeatDirection="Horizontal"
                        Width="383px" style="margin-left: 0px">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" Font-Size="Large" ForeColor="White"
                            HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderTemplate>
                            DONE
                        </HeaderTemplate>
                        <ItemStyle BackColor="White" ForeColor="#333333" />
                        <ItemTemplate>
                            <table>

                                <tr>
                                    <td><br /> 
                        <asp:Label ID="NameLabel" runat="server"  BackColor="#DEBA84" BorderColor="#DEBA84" Font-Size="Large" Text='<%# Eval("name") %>' ForeColor="#000099" />
                                    ID: 
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("id") %>' ForeColor="#000099" /> <br /><br />
                                            <br />     <br />
                                        Description:<br />
                                        <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("description") %>' ForeColor="#000099" />
                                        <br />
                                        Status<br />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Status_name") %>' ForeColor="#000099" />
                                        
                                        <br />Project<br />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Project_id") %>' ForeColor="#000099" />
                                            <br />
                                </tr>
                            </table>

                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                    </asp:Panel>
                </td>
            </tr>



           
        </table>
</asp:Content>
