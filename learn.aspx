﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="learn.aspx.cs" Inherits="learn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/sentence-script.js"></script>
    <link rel="stylesheet" type="text/css" href="css/learn.css" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="learn">
	<div id="marquee">
	
		<ul>

			<li><asp:Image ID="Image1" runat="server" /></li>
			<li><asp:Image ID="Image2" runat="server" /></li>
			<li><asp:Image ID="Image3" runat="server" /></li>
			<li><asp:Image ID="Image4" runat="server" /></li>
			<li><asp:Image ID="Image5" runat="server" /></li>
			
		</ul>
		
		<div class='pre-next pre'></div>
    </div><br />
    <div id="change">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    </div>
    </div>
    <div id="learnse">
        <div class="main">
            
        <p class="se" title="A New Tutorial Every Week" >
            <asp:Image ID="Image6" runat="server" ImageUrl="~/img/se-01.jpg" CssClass="seimg"/>
            <asp:Image ID="Image7" runat="server" ImageUrl="~/img/se-02.jpg" CssClass="seimg"/>
            <asp:Image ID="Image8" runat="server" ImageUrl="~/img/se-03.jpg" CssClass="seimg"/>
            <asp:Image ID="Image9" runat="server" ImageUrl="~/img/se-04.jpg" CssClass="seimg"/>
            <asp:Image ID="Image10" runat="server" ImageUrl="~/img/se-05.jpg" CssClass="seimg"/>

        </p>

        </div>
    </div>
<script type="text/javascript">
    $(function () {
        var width = $("#marquee").width();
        var index = 0;
        var len = $("#marquee ul li").length;
        var timer = null;
        var aaa = "<div class='btn-bground'></div><div class='btn'>";

        $("#marquee ul li").each(function () {
            aaa += "<span></span>";
        });
        aaa += "</div><div class='pre-next pre'></div><div class='pre-next next'>";
        $("#marquee").append(aaa);
        $("#marquee .btn-bground").css("opacity", 0.5);

        $("#marquee ul").css("width", width * len);

        $("#marquee .pre-next").css("opacity", 0.2).hover(function () {
            $(this).stop(true, false).animate({ "opacity": 0.4 }, 300);
        }, function () {
            $(this).stop(true, false).animate({ "opacity": 0.2 }, 300);
        });


               
        $("#marquee .btn span").css("opacity", 0.4).mouseenter(function () {
            index = $("#marquee .btn span").index(this);
            marquee(index);
            sentence(index);
        }).eq(0).trigger("mouseenter");

        $("#marquee .pre").click(function () {
            if (--index == -1) {
                index = len - 1;
            }
            marquee(index);
            sentence(index);
        });

        $("#marquee .next").click(function () {
            if (++index == len) {
                index = 0;
            }
            marquee(index);
            sentence(index);
        });

        $("#marquee").hover(function () {
            clearInterval(timer);
        }, function () {
            timer = setInterval(function () {
                marquee(index);
                if (++index == len) {
                    index = 0;
                }
            }, 120000);
        }).trigger("mouseleave");

        function marquee(index) {
            var left = -index * width;
            $("#marquee ul").stop(true, false).animate({ "left": left }, 300);
            $("#marquee .btn span").stop(true, false).animate({ "opacity": 0.4 }, 300).eq(index).stop(true, false).animate({ "opacity": 1 }, 300);
            
        }

        //function sentence(index) {
        //    var sss = "#ContentPlaceHolder1_Image" + (index + 6).toString();
        //    $(".seimg").css("display", "none");
        //    $(sss).css("display", "block");
        //    var t1 = setTimeout("$('.tipIcon').trigger('click')", 1000);
        //    $('.tipIcon').trigger('click');
        //}
    });
    function sentence(index) {
        var sss = "#ContentPlaceHolder1_Image" + (index + 6).toString();
        $(".seimg").css("display", "none");
        $(sss).css("display", "block");
        var t1 = setTimeout("$('.tipIcon').trigger('click')", 1000);
        $('.tipIcon').trigger('click');
    }



</script>
</asp:Content>

