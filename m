Content-Type: multipart/mixed; boundary="===============3393963274482356100=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 2ab9fb18c4: kernel BUG at include/linux/skbuff.h:1935!
Date: Mon, 14 Nov 2016 11:11:30 +0800
Message-ID: <20161114031130.yjb4anou24ede4ue@wfg-t540p.sh.intel.com>
In-Reply-To: <20161114021420.GC31218@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3393963274482356100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>Hi guys.
>>
>>I took a look at the commit again and I do not see how this can happen.
>>
>>Are you sure patch was properly applied ?
>>
>>In particular, the following extract is obscure for me :
>>
>>
>>> https://github.com/0day-ci/linux Eric-Dumazet/net-__skb_flow_dissect-mu=
st-cap-its-return-value/20161110-080839
>>> commit 2ab9fb18c46b91b16a0f0f329336d3be9fc32deb ("net: __skb_flow_disse=
ct() must cap its return value")
>>>
>
>Hi,
>
>The above two lines means 0day repo setup a new branch
>"Eric-Dumazet/net-__skb_flow_dissect-must-cap-its-return-value/20161110-08=
0839"
>which is based on net/master, then applied you patch on top of it,
>commit id is 2ab9fb18c46b91b16a0f0f329336d3be9fc32deb.

Xiaolong, it may be more helpful to show the base tree where we apply
the patch to. And the final url:

https://github.com/0day-ci/linux/tree/Eric-Dumazet/net-__skb_flow_dissect-m=
ust-cap-its-return-value/20161110-080839

Thanks,
Fengguang

--===============3393963274482356100==--

