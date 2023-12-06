URL = "https://reg.ntuh.gov.tw/EmgInfoBoard/NTUHEmgInfo.aspx"

txt = scan(URL, what = "character", encoding = "UTF-8", quiet = TRUE)

#print前15行
head(txt, 15) 

#拼接一起
txt_new = paste(txt, sep = "", collapse = " ")

#找出TITLE
TITLE.pos = gregexpr("<title>.*</title>", txt_new)
start.TITLE.pos = TITLE.pos[[1]][1]
end.TITLE.pos = start.TITLE.pos + attr(TITLE.pos[[1]], "match.length")[1] - 1

TITLE.word = substr(txt_new, start.TITLE.pos, end.TITLE.pos)

TITLE.word

#移除HTML tag
TITLE.word = gsub("<title>", "", TITLE.word)
TITLE.word = gsub("</title>", "", TITLE.word)
TITLE.word

#抓「等候掛號人數：」後面的人數
start.pos = gregexpr("<tr>", txt_new)
end.pos = gregexpr("</tr>", txt_new)

i = 1
sub.start.pos = start.pos[[1]][i]
sub.end.pos = end.pos[[1]][i] + attr(end.pos[[1]], "match.length")[i] - 1

sub_txt = substr(txt_new, sub.start.pos, sub.end.pos)
sub_txt

#移除HTML tag
sub_txt = gsub('等候掛號人數：', '', sub_txt)
sub_txt = gsub('</?tr>', '', sub_txt)
sub_txt = gsub('</?td>', '', sub_txt)
sub_txt = gsub(' ', '', sub_txt)
sub_txt
