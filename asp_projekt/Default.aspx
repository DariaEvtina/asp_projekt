<%@ Page Title="Home page" Language="VB" %>
<!Doctype html>
<html>
<head runat="server">
    <title>Ininimesd andmed xml failist</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Xml runat="server" DocumentSource="~/sugupuu.xml" TransformSource="~/sugupuulisa.xslt"></asp:Xml>

        </div>
    </form>
</body>
</html>
