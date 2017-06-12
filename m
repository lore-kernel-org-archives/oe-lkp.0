Content-Type: multipart/mixed; boundary="===============2684505034019672677=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC, sb_edac] e2f747b1f4: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Mon, 12 Jun 2017 09:30:46 +0800
Message-ID: <20170612013046.GG29690@yexl-desktop>
In-Reply-To: <E6AF1AFDEA62A94A97508F458CBDD47F6F5A34C4@SHSMSX101.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2684505034019672677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/10, Zhuo, Qiuxu wrote:
>> From: Borislav Petkov [mailto:bp(a)alien8.de] =

>>
>> Xiaolong,
>>
>> can you please run Qiuxu's patch to verify it fixes your issue?
>
>
>Hi Boris,
>    I manually verified the fix patch on the Broadwell-DE server on which =
the bug was found by Xiaolong: =

>    the sb_edac can be loaded successfully, and it identified which size a=
nd type of DIMMs were installed
>    in each slot correctly (see attached dmesg.sb_edac.on.Broadwell-DE.log=
).
>
>Hi Xiaolong,
>   Would you please also test the patch by your LKP method by which the is=
sue was found last time.
>

Got it, I've queued test jobs for your fix patch, will let you know the res=
ult
once I get the it.

Thanks,
Xiaolong


>Thanks!
>
>BR
>Qiuxu =

>    =

>    =

>    =




--===============2684505034019672677==--

