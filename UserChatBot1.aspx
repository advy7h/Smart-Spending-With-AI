<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="UserChatBot1.aspx.cs" Inherits="UserChatBot1" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <title>AI Chatbot</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        margin: 0;
        padding: 0;
    }

    .chat-container {
        width: 420px;
        height: 600px;
        margin: 40px auto;
        background: #ffffff;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        overflow: hidden;
    }

    .chat-header {
        background: #4a00e0;
        color: white;
        padding: 15px;
        font-size: 18px;
        font-weight: bold;
        text-align: center;
    }

    .chat-body {
        flex: 1;
        padding: 15px;
        overflow-y: auto;
        background: #f9f9f9;
    }

    .message {
        padding: 10px 15px;
        margin: 8px 0;
        border-radius: 20px;
        max-width: 75%;
        display: inline-block;
        word-wrap: break-word;
    }

    .user {
        background: #4a90e2;
        color: white;
        align-self: flex-end;
        border-bottom-right-radius: 5px;
    }

    .bot {
        background: #e5e5ea;
        color: #333;
        align-self: flex-start;
        border-bottom-left-radius: 5px;
    }

    .chat-footer {
        display: flex;
        padding: 10px;
        border-top: 1px solid #ddd;
        background: #fff;
    }

    .chat-footer input {
        flex: 1;
        padding: 10px;
        border-radius: 20px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 14px;
    }

    .chat-footer input:focus {
        border-color: #4a00e0;
    }

    .chat-footer button {
        margin-left: 10px;
        padding: 10px 18px;
        background: #4a00e0;
        color: white;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        transition: 0.3s;
    }

    .chat-footer button:hover {
        background: #6a11cb;
    }

    /* Scrollbar Styling */
    .chat-body::-webkit-scrollbar {
        width: 5px;
    }

    .chat-body::-webkit-scrollbar-thumb {
        background: #ccc;
        border-radius: 10px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     
     <div class="chat-container">

    <div class="chat-header">
        🤖 AI Assistant
    </div>

    <div class="chat-body">
        <asp:Literal ID="litChat" runat="server"></asp:Literal>
    </div>

    <div class="chat-footer">
        <asp:TextBox ID="txtMessage" runat="server" placeholder="Type your message..."></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
    </div>

</div>
</asp:Content>

