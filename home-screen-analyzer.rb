require 'opencv'
include OpenCV

image = OpenCV::IplImage.load("images/home_screens/001.png")
template = OpenCV::IplImage.load("images/apps/facebook.jpg")

result = image.match_template(template, CV_TM_SQDIFF_NORMED)
min_score, max_score, min_point, max_point = result.min_max_loc

if min_score < 0.1
  from = min_point
  to = OpenCV::CvPoint.new(from.x + template.width, from.y + template.height)
  image.rectangle!(from, to, :color => OpenCV::CvColor::Red, :thickness => 1)
  p true
else
  p false
end

image.save_image("images/outputs/001.png")
