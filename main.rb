require 'rqrcode_png'

def make_RQ(url, str)
  qr = RQRCode::QRCode.new(url, :size => 4, :level => :h)
  png = qr.to_img                                             # returns an instance of ChunkyPNG
  png.resize(300, 300).save("qr.png") # resize(width, height)

  #system("convert -background white -fill blue -font /usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc  -size 70x30  label:'这是中文字体'  icon.gif")
  system("convert -background white -fill blue -font /usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc -size 70x30 -gravity center label:'#{str}' icon.gif")

  system("convert qr.png icon.gif -gravity center -composite  result.png")
end

make_RQ("http://weibo.com", "这是中文字体")
