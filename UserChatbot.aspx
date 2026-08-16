<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="UserChatbot.aspx.cs" Inherits="UserChatbot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        body {
            font-family: 'Segoe UI';
            background: #f4f6f9;
        }

        .chat-container {
            width: 400px;
            margin: 40px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.2);
            display: flex;
            flex-direction: column;
            height: 600px;
        }

        .chat-header {
            background: #4CAF50;
            color: white;
            padding: 15px;
            border-radius: 15px 15px 0 0;
            font-size: 18px;
            font-weight: bold;
        }

        .chat-body {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
        }

        .user-msg {
            text-align: right;
            margin: 10px;
        }

        .bot-msg {
            text-align: left;
            margin: 10px;
        }

        .bubble {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 15px;
            max-width: 70%;
        }

        .user {
            background: #4CAF50;
            color: white;
        }

        .bot {
            background: #e5e5ea;
            color: black;
        }

        .chat-footer {
            padding: 10px;
            display: flex;
            border-top: 1px solid #ddd;
        }

        .chat-footer input {
            flex: 1;
            padding: 10px;
            border-radius: 20px;
            border: 1px solid #ccc;
        }

        .chat-footer button {
            margin-left: 10px;
            padding: 10px 15px;
            border: none;
            background: #4CAF50;
            color: white;
            border-radius: 50%;
            cursor: pointer;
        }

        .chat-footer button:hover {
            background: #45a049;
        }
    </style>
    <script>
        function speak(text) {
            var speech = new SpeechSynthesisUtterance(text);
            speech.lang = 'en-IN';
            window.speechSynthesis.speak(speech);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
          <div class="chat-container">

    <div class="chat-header">
        💰 Financial Assistant
    </div>

    <div class="chat-body" id="chatBody" runat="server">
        <asp:Literal ID="litChat" runat="server"></asp:Literal>
    </div>

    <div class="chat-footer">
        <asp:TextBox ID="txtMessage" runat="server" placeholder="Ask something..."></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="➤" OnClick="btnSend_Click" />
    </div>

</div>


</asp:Content>

