-- post����T���v��
-- OnBlockNotify���ɃT�[�o�[�ɏ���POST���Ă݂܂�

local http = require("socket.http")

function OnBlockNotify(initialsync, hash)
  -- �����_�E�����[�h�̏ꍇ�̓X���[
  if initialsync == true then
    return
  end

  -- �u���b�N�̏����擾
  ret, value = coind.getblock(hash)
  if ret ~= true then
    return
  end

  -- Height��Diff��json�ő���
  req = {}
  req["Height"] = value["height"]
  req["Difficulty"] = value["difficulty"]
  request_body = cjson.encode(req)
  response_body = {}

  print(string.format("request_body:%s", request_body))

  -- �T�[�o�[��POST
  res, code, response_headers = http.request{
    url = "https://httpbin.org/post",
    method = "POST",
    headers = {
      ["Content-Type"] = "application/x-www-form-urlencoded";
      ["Content-Length"] = #request_body;
    },
    source = ltn12.source.string(request_body),
    sink = ltn12.sink.table(response_body),
  }

  print(res)  -- �֐��̕Ԃ�l
  print(code) -- �X�e�[�^�X�R�[�h

  -- ���X�|���X�w�b�_
  print("Response header:")
  if type(response_headers) == "table" then
    for k, v in pairs(response_headers) do
      print(k, v)
    end
  end

  -- https://httpbin.org/post ��POST�������̂����̂܂ܕԂ��Ă���
  print(string.format("response_body:%s", request_body))

end

