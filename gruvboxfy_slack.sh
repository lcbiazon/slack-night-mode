#! /bin/bash

# Based on https://gist.github.com/Jiri-Kremser/2716ff5c6918cc6538f96b56e46f8c13

#since slack 2.6.3 there is some hack in that file, so make sure this piece of code goes before the:
#start(assignIn({}, require('electron').remote.getGlobal('loadSettings'), { windowType: 'WEBAPP' }));
#..line

# since 3.0.5
# or before the 'const loadSettings = ...' line

cat << 'EOF' >> /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: 'https://raw.githubusercontent.com/lcbiazon/slack-night-mode/master/css/raw/variants/gruvbox.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
EOF
echo If Slack.app is already running, refresh with CTRL-R
