//
// RPC�R�}���h���Ăяo���T���v��
// CallCoindCommand �Ƀ��\�b�h���ƃp�����[�^�[��n���ƌ��ʂ��Ԃ�
// OnBlockNotify �ł͕Ԃ��Ă���json���p�[�X���ĕ\�����Ă���
//


using System;
using System.IO;
using System.Json;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

class MonaPlugin
{
    // �v���O�C���̃��[�h�����������ꍇ�ɍŏ��ɌĂ΂��
    public void OnInit()
    {
        Console.WriteLine("****** OnInit *****");

        // �K���ɃR�}���h�����s���Ă݂�
        // �R�}���h�A������RPC�Ɠ���
        // �i�p�����[�^�[�̓e�X�g���̂��̂Ȃ̂œK�X���������Ă��������j
        string res;
        res = CallCoindCommand("sendfrom", "testasccount", "p88ZwicTpUKyiC7JR9gAVm6S81aSQhDT2z", 1.1);
        Console.WriteLine("sendfrom : {0}", res);

        res = CallCoindCommand("getpeerinfo");
        Console.WriteLine("getpeerinfo : {0}", res);

        res = CallCoindCommand("getbalance", "testaccount");
        Console.WriteLine("getbalance : {0}", res);
    }

    // �u���b�N���X�V���ꂽ�Ƃ��̒ʒm
    public void OnBlockNotify(bool binit, string hash)
    {
        if(!binit)
        {
            Console.WriteLine("****** OnBlockNotify *****");

            // getblock�R�}���h�Ŗ߂��Ă���json���p�[�X
            var json = JsonObject.Parse(CallCoindCommand("getblock", hash));

            // �������o��
            Console.WriteLine("hash : {0}", json["hash"]);
            Console.WriteLine("confirmations : {0}", json["confirmations"]);
            Console.WriteLine("size : {0}", json["size"]);
            Console.WriteLine("height : {0}", json["height"]);
            Console.WriteLine("tx [");
            foreach(var tx in json["tx"])
            {
                Console.WriteLine(tx);
            }
            Console.WriteLine("]");
        }
    }


    //----------------------------------------------------------
    // CallCoindCommand
    // coind�̃R�}���h���Ăяo���֐�
    // 
    // _method : ���\�b�h��
    // _params : �p�����[�^�[�z��
    // �Ԃ�l : �R�}���h�̎��s����
    //----------------------------------------------------------

    [MethodImplAttribute(MethodImplOptions.InternalCall)]
    public static extern string CoindCommand(string _method, string _param);

    public string CallCoindCommand(string _method, params object[] _params)
    {
        string strParams = "";
        if(_params.Length != 0)
        {
            foreach(var p in _params)
            {
                if(p.GetType().Equals(typeof(string)))
                {
                    strParams += ",\"" + p.ToString() + "\"";
                }
                else
                {
                    strParams += "," + p.ToString();
                }
            }
            strParams = "[" + strParams.Substring(1) + "]";
        }
        else
        {
            strParams = "[]";
        }

        return CoindCommand(_method, strParams);
    }
}
