var onTop = new Vue({
    el: '#onTop',
    data: {
        pic_match: null,
        selected: null,
        applyForTop: false
    },
    methods: {
        selimg: function () {
            if ($("#ApplyForTop")[0].checked) {
                this.applyForTop = true;
                var ria = UE.getEditor('editor').getContent();
                var mark = new RegExp(/src=\"[\w|\/|.]*?.[jpg|jpeg|gif|png|JPG]\"/g);
                var ii = ria.match(mark);
                if (ii != this.pic_match) {
                    if (!ii) {
                        alert("检测不到图片，不能申请!");
                        $("#ApplyForTop")[0].checked = false;
                        this.applyForTop = false;
                        return;
                    }

                    for (var index = 0; index < ii.length ; ++index) {
                        ii[index] = ii[index].substring(5, ii[index].length - 1)
                    }

                    this.pic_match = ii;
                }
            } else {
                this.applyForTop = false;
            }
        }
    }
})

$(document).ready(function () {
    var isedit = ($("#hideria").val() != undefined && $("#hideria").val() != "");
    if (isedit) {
        ue.ready(function () {
            ue.setContent(unescape($("#hideria").val()));
            if ($("#hideurl").val() != undefined && $("#hideurl").val() != "") {
                $("#ApplyForTop")[0].checked = true;
                onTop.selected = $("#hideurl").val();
                onTop.selimg();
            }
        });
    }
})

function checkbefore() {
    if ($("#NewsTitle").val() == undefined || $("#NewsTitle").val() == "") {
        alert("没有标题!");
        return false;
    }else if(!UE.getEditor('editor').hasContents()){
        alert("编辑器中没有内容!");
        return false;
    }

    var conf = "确认发布为" + $("#NewsType").val();
    if ($("#ApplyForTop")[0].checked) {
        conf += "\n并且申请设置为首页滚动新闻？";
    } else {
        conf += "\n并且不申请设置为首页滚动新闻？";
    }
    if (window.confirm(conf)) {
        var ria = escape(UE.getEditor('editor').getContent());
        var text = UE.getEditor('editor').getContentTxt();
        $("#hideria").val(ria);
        $("#hidetext").val(text);
        $("#hideurl").val(onTop.selected);
        return true;
    } else {
        return false;
    }
}