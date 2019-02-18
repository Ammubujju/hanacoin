using System;
using System.IO;


// �N���X��"MonaPlugin"�̒��̉��L�̃��\�b�h��monacond����Ăяo����܂�
class MonaPlugin
{
    // �v���O�C���̃��[�h�����������ꍇ�ɍŏ��ɌĂ΂��
    public void OnInit()
    {
        Console.WriteLine("****** OnInit *****");
    }

    // �v���O�C�����폜����钼�O�ɌĂ΂��
    public void OnTerm()
    {
        Console.WriteLine("****** OnTerm *****");
    }

    // �����̃A�h���X�Ɋւ��ʒm
    public void OnWalletNotify(string hash)
    {
        Console.WriteLine("****** OnWalletNotify *****");
        Console.WriteLine("hash : {0}", hash);
    }

    // �u���b�N���X�V���ꂽ�Ƃ��̒ʒm
    public void OnBlockNotify(bool binit, string hash)
    {
        if(!binit)
        {
            Console.WriteLine("****** OnBlockNotify *****");
            Console.WriteLine("hash : {0}", hash);
        }
    }
}
