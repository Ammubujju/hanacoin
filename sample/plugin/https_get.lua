-- luasec���g����https�Ń��N�G�X�g����T���v��
-- �󂯎�������e��stdout�֏����o��

local string = require("string")
local ltn12 = require("ltn12")
local https = require("ssl.https")

local one, code, headers, status = https.request {
  url = "https://monacoin.org",
  sink = ltn12.sink.file(io.stdout),
  protocol = "any",
  options = "all",
  verify = "none",
}
