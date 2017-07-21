Content-Type: multipart/mixed; boundary="===============5154545687509782716=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Fri, 21 Jul 2017 10:03:49 +0800
Message-ID: <20170721020349.GB4273@yexl-desktop>
In-Reply-To: <20170721015632.c75dmce5tm76jpij@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5154545687509782716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/21, Fengguang Wu wrote:
>On Fri, Jul 21, 2017 at 09:52:22AM +0800, Ye Xiaolong wrote:
>>On 07/21, Fengguang Wu wrote:
>>>Hi Xiaolong,
>>>
>>>On Thu, Jul 20, 2017 at 10:50:52PM +0800, Ye Xiaolong wrote:
>>>>Hi, fengguang
>>>>
>>>>On 07/19, Linus Torvalds wrote:
>>>>>Hmm. I wonder why the kernel test robot ends up having that annoying
>>>>>line doubling for the dmesg.
>>>>>
>>>>
>>>>I found that the line doubling issue should be caused by setting
>>>>"earlyprintk=3DttyS0,115200" and "console=3DttyS0,115200" at the same t=
ime in
>>>>kernel parameter via debugging with `lkp qemu`, could I just omit one o=
f them?
>>>
>>>That's a good finding. I guess it's better to tell that fact and let
>>>the community know (more) about this caveat of earlyprintk and
>>>possibly (plan to) fix it.
>>
>>Got it, I'll give this feedback to community.
>
>OK, thanks!
>
>>>>any side effect it may bring? or I can solve this issue by uniq the dme=
sg log
>>>>in report?
>>>
>>>Then we can offer the option to strip the duplicate lines in dmesg in
>>>our robot. It looks like trivial to do in fixup_dmesg():
>>>
>>>https://stackoverflow.com/questions/22067201/how-to-delete-duplicate-lin=
es-in-file-in-unix
>>>
>>>sed -r '$!N; /^(.*)\n\1$/!P; D' filename
>>
>>I'll send a fix for it.
>
>Never mind, I've done a tested patch just now. :)

You are so quick, thanks. :)

>
>Thanks,
>Fengguang

--===============5154545687509782716==--

