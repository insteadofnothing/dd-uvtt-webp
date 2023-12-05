var script_class = "export_format"

var export_format_name = "Universal VTT (WebP)"
var export_file_extension = "dd2vtt"
var export_image_format = "webp"
var show_quality_slider = true


func start():
  pass


func process(path: String, image: File, ppi: int):
  # Marshall the WebP into Base64 and replace the UVTT's PNG data.
  var b64_img = Marshalls.raw_to_base64(image.get_buffer(image.get_len()))
  var map_data = Global.Exporter.ExportForVTT(ppi, image)
  map_data["image"] = b64_img

  # Save the data to a file.
  var file = File.new()
  var error = file.open(path, File.WRITE)
  file.store_line(JSON.print(map_data, "\t"))
  file.close()
