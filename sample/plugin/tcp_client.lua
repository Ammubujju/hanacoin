-- tcp�N���C�A���g�̃T���v��
-- OnBlockNotify�̓x�ɃT�[�o�[�Ƀ��b�Z�[�W�𑗐M���Ă��܂�

local socket = require("socket")
local tcp

function OnInit()
  -- �ڑ�
  tcp = assert(socket.connect("127.0.0.1", 7500))
end

function OnTerm()
  -- �N���[�Y
  tcp:close()
end

function OnBlockNotify(initialsync, hash)
  -- ���b�Z�[�W���M
  tcp:send("test message")
end
