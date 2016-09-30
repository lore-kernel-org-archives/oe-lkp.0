Content-Type: multipart/mixed; boundary="===============5183296151607069508=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [staging] d4f56b47a8: divide error: 0000 [#1] PREEMPT SMP KASAN
Date: Fri, 30 Sep 2016 18:18:00 +0800
Message-ID: <20160930101800.oqwogwzeoumaf7dq@wfg-t540p.sh.intel.com>
In-Reply-To: <20160930095143.GA30029@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5183296151607069508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> >> [   16.819509] RIP  [<ffffffff82f67e97>] gb_timesync_init+0x35/0x78
>> >> [   16.820094]  RSP <ffff88001a147e58>
>> >> [   16.820548] ---[ end trace c73ba0f929e81492 ]---
>> >> [   16.821001] Kernel panic - not syncing: Fatal exception
>> >
>> >Can you please confirm if below patch fixes it for you ?
>> >
>> >https://marc.info/?l=3Dlinux-kernel&m=3D147490908100954
>>
>> This error is gone with this fix.
>>
>> Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>
>
>Wonderful, thanks for letting us know.  It's been in linux-next since
>Tuesday of this week.   Perhaps your testing could see if patches
>further along in the specific branch you hit solve the problem you are
>having before you need to report the issue?

Yes, good idea! It could be made more smart like that.

Thanks,
Fengguang

--===============5183296151607069508==--

