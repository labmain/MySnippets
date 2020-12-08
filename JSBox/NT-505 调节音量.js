const rates = [14, 18, 28, 38, 45];

$ui.render({
    props: {
        title: $l10n("main-title")
    },
    views: [{
            type: "input",
            props: {
                type: $kbType.number
            },
            layout: function (make,view) {
                make.left.top.inset(10);
                make.height.equalTo(32);
                make.width
                  .equalTo(view.super)
                  .multipliedBy(0.5)
                  .offset(-15);
            },
            events: {
                returned: function(sender) {
                    buttonClick();
                }
            }
        },
        {
            type: "button",
            props: {
                title: "确定"
            },
            layout: function (make) {
                make.centerY.equalTo($("input"));
                make.height.equalTo(32);
                make.width.equalTo(60);
                make.right.inset(10);
            },
            tapped: function(sender) {
                buttonClick();
            }
        },
        {
            type: "tab",
            props: {
                items: rates.map(function (item) {
                    return item + "";
                })
            },
            layout: function (make) {
                make.left.right.inset(10);
                make.top.equalTo($("input").bottom).offset(10);
            },
            events: {
                changed: function (sender) {
                    tabChange();
                }
            }
        }
    ]
});

function tabChange() {
    var volume = rates[$("tab").index];
    setVolume(volume)
}

function buttonClick() {
    var volume = Number($("input").text);
    setVolume(volume)
    console.info(volume)
}

function setVolume(volume) {
    $http.request({
        method: "POST",
        url: "http://10.3.0.20:23000/RenderingControl/4c494e4e-3d9b-11e1-b86c-0016e852084b/control.xml",
        header: {
            "Content-Type": "text/xml",
            "SOAPAction": "urn:schemas-upnp-org:service:RenderingControl:1#SetVolume"
        },
        body: "<s:Envelope s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:u=\"urn:schemas-upnp-org:service:RenderingControl:1\"><s:Body><u:SetVolume><InstanceID>0</InstanceID><Channel>Master</Channel><DesiredVolume>" + volume + "</DesiredVolume></u:SetVolume></s:Body></s:Envelope>",
        handler: function (resp) {
            var data = resp.data
        }
    })
}