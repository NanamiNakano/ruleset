[General]
# 日志等级: warning, notify, info, verbose (默认值: notify)
loglevel = notify
skip-proxy = 127.0.0.0/8, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 162.14.0.0/16, 211.99.96.0/19, 162.159.192.0/24, 162.159.193.0/24, 162.159.195.0/24, fc00::/7, fe80::/10, localhost, *.local, captive.apple.com, passenger.t3go.cn, *.ccb.com, wxh.wo.cn, *.abcchina.com, *.abcchina.com.cn
hijack-dns = 8.8.8.8:53, 8.8.4.4:53
exclude-simple-hostnames = true
dns-server = 223.5.5.5, 1.1.1.1, 8.8.8.8, system
encrypted-dns-server = quic://dns.cooluc.com, https://doh.apad.pro/dns-query, https://1.0.0.1/dns-query
read-etc-hosts = true

ipv6 = false
ipv6-vif = off
# 以下参数仅供 macOS 版本使用（多端口监听仅 Surge 3 支持）
http-listen = 0.0.0.0
socks5-listen = 0.0.0.0
# 测速地址
internet-test-url = http://apple.cn
proxy-test-url = http://google.com
proxy-test-udp = www.apple.com@64.6.64.6
# external-controller-access = password@0.0.0.0:6170
allow-wifi-access = true
# 当遇到 REJECT 策略时返回错误页
show-error-page-for-reject = true
always-real-ip = msftconnecttest.com, msftncsi.com, *.msftconnecttest.com, *.msftncsi.com, *.srv.nintendo.net, *.stun.playstation.net, xbox.*.microsoft.com, *.xboxlive.com
geoip-maxmind-url = https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country.mmdb
test-timeout = 5
http-api-web-dashboard = true
vif-mode = v3
udp-policy-not-supported-behaviour = REJECT

[Replica]
hide-apple-request = 1
keyword-filter-type = none
hide-crash-reporter-request = 1

[Proxy]
{{ getSurgeNodes(nodeList) }}

[Proxy Group]
🇭🇰 HKTest = smart, interval=300, tolerance=50, timeout=2, {{ getNodeNames(nodeList, customFilters.hkFilter) }}
🇺🇸 USTest = smart, interval=300, tolerance=50, timeout=2, {{ getNodeNames(nodeList, customFilters.usFilter) }}
🔰 节点选择 = select, 🇭🇰 HKTest, {{ getNodeNames(nodeList) }}
🇺🇸 US DIRECT = select, 🇺🇸 USTest, {{ getNodeNames(nodeList) }}
📲 电报吹水 = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
📲 WeChat = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
🎮 Steam = select, 🔰 节点选择, DIRECT,{{ getNodeNames(nodeList) }}
📹 YouTube = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
🎥 NETFLIX = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
📺 巴哈姆特 = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
📺 AbemaTV = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
📖 知乎 API = select,DIRECT,🔰 节点选择,{{ getNodeNames(nodeList) }}
📖 知乎 Res = select,DIRECT,🔰 节点选择,{{ getNodeNames(nodeList) }}
🌍 国外媒体 = select,🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
🔞️ ExHentai = select,🇺🇸 USTest, 🔰 节点选择,DIRECT,{{ getNodeNames(nodeList) }}
🍎 苹果服务 = select,DIRECT,🇺🇸 USTest, 🔰 节点选择,{{ getNodeNames(nodeList) }}
🔎 GoogleSearch = select,DIRECT,🇺🇸 USTest, 🔰 节点选择,{{ getNodeNames(nodeList) }}
Ⓜ️ 微软服务 = select,DIRECT,🇺🇸 USTest, 🔰 节点选择,{{ getNodeNames(nodeList) }}
🛑 劫持拦截 = select,REJECT,DIRECT,🔰 节点选择,{{ getNodeNames(nodeList) }}
🐟 规则外路由选择 = select,🔰 节点选择,REJECT,DIRECT,{{ getNodeNames(nodeList) }}

[Rule]
RULE-SET,https://github.com/NanamiNakano/rules/releases/latest/download/Reject.list,🛑 劫持拦截
PROCESS-NAME,Adobe Photoshop ????,REJECT
RULE-SET,SYSTEM,DIRECT
RULE-SET,LAN,DIRECT
PROCESS-NAME,/Applications/QQ.app/Contents/MacOS/QQ,DIRECT
# DOMAIN,appstorrent.ru,DIRECT
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/SteamCN.list,DIRECT
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/US.list,🇺🇸 US DIRECT
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Google/GoogleSearch.list,🔎 GoogleSearch
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Apple/Apple.list,🍎 苹果服务
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Streaming/Video/Netflix.list,🎥 NETFLIX
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Streaming/Video/Bahamut.list,📺 巴哈姆特
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Streaming/Video/YouTube.list,📹 YouTube
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Streaming/Video/AbemaTV.list,📺 AbemaTV
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Telegram.list,📲 电报吹水
RULE-SET,https://github.com/NanamiNakano/rules/releases/latest/download/WeChat.list,📲 WeChat
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/Steam.list,🎮 Steam
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Extra/Streaming/!CN.list,🌍 国外媒体
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/ExHentai.list,🔞️ ExHentai
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/ZhihuApi.list,📖 知乎 API
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/ZhihuApi.list,📖 知乎 Res
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/MSServices.list,Ⓜ️ 微软服务
PROCESS-NAME,oss-browser,🔰 节点选择
PROCESS-NAME,/Applications/TeamViewer.app/Contents/MacOS/TeamViewer,🔰 节点选择
# PROCESS-NAME,prl_naptd,🔰 节点选择
RULE-SET,https://raw.githubusercontent.com/NanamiNakano/rules/master/PROXY.list,🔰 节点选择
RULE-SET,https://github.com/ConnersHua/RuleGo/raw/refs/heads/master/Surge/Ruleset/Proxy.list,🔰 节点选择
GEOIP,CN,DIRECT

# Final
FINAL,🐟 规则外路由选择,dns-failed

[MITM]
h2 = true
hostname = *.bilibili.com, *.biliapi.net
ca-passphrase = E26E127F
ca-p12 = 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

[Host]
*.bilivideo.com = server:223.5.5.5
*.hdslb.com = server:223.5.5.5
*.jd.com = server:https://doh.pub/dns-query
*.360buyimg.com = server:https://doh.pub/dns-query

[Script]
