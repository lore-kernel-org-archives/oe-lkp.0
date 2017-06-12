Content-Type: multipart/mixed; boundary="===============7770359905289338151=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC, sb_edac] e2f747b1f4: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Mon, 12 Jun 2017 13:11:13 +0800
Message-ID: <20170612051113.GD22185@yexl-desktop>
In-Reply-To: <20170612013046.GG29690@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7770359905289338151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/12, Ye Xiaolong wrote:
>On 06/10, Zhuo, Qiuxu wrote:
>>> From: Borislav Petkov [mailto:bp(a)alien8.de] =

>>>
>>> Xiaolong,
>>>
>>> can you please run Qiuxu's patch to verify it fixes your issue?
>>
>>
>>Hi Boris,
>>    I manually verified the fix patch on the Broadwell-DE server on which=
 the bug was found by Xiaolong: =

>>    the sb_edac can be loaded successfully, and it identified which size =
and type of DIMMs were installed
>>    in each slot correctly (see attached dmesg.sb_edac.on.Broadwell-DE.lo=
g).
>>
>>Hi Xiaolong,
>>   Would you please also test the patch by your LKP method by which the i=
ssue was found last time.
>>
>
>Got it, I've queued test jobs for your fix patch, will let you know the re=
sult
>once I get the it.

Confirmed the error is gone with qiuxu's fix patch.


Tested-by: From: Ye Xiaolong <xiaolong.ye@intel.com>

Thanks,
Xiaolong
>
>Thanks,
>Xiaolong
>
>
>>Thanks!
>>
>>BR
>>Qiuxu =

>>    =

>>    =

>>    =

>
>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============7770359905289338151==--

