Content-Type: multipart/mixed; boundary="===============1464717861349446957=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 18 Nov 2021 14:03:25 +0100
Message-ID: <e845ced3-505b-ec7e-1bcd-9837e85b7a34@iogearbox.net>
In-Reply-To: <YZZOrSiAyC9dfuSl@rli9-dbox>
List-Id: <oe-lkp.lists.linux.dev>

--===============1464717861349446957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/18/21 2:01 PM, Philip Li wrote:
> On Thu, Nov 18, 2021 at 09:47:51AM +0100, Daniel Borkmann wrote:
>> On 11/18/21 7:23 AM, Oliver Sang wrote:
>>> On Fri, Nov 05, 2021 at 12:21:20PM +0100, Daniel Borkmann wrote:
>>>> Hey Oliver,
>>>>
>>>>>> To reproduce:
>>>>>>
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0cd linux
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0cp config-5.15.0-rc4-01167-g7482e3841d52 .=
config
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386=
 olddefconfig prepare modules_prepare bzImage
>>>>>>
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https:/=
/github.com/intel/lkp-tests.git
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <=
bzImage> job-script # job-script is attached in this email
>>>>>>
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across =
any failure that blocks the test,
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~=
/.lkp and /lkp dir to run from a clean state.
>>>>
>>>> I ran the test multiple times, but it seems I cannot reproduce. Would =
be good if you could
>>>> double check below whether it looks / passes as expected or if I'm doi=
ng something wrong:
>>>
>>> sorry about this, we tried above reproducer locally but failed to repro=
duce
>>> either. we are under investigation of this issue.
>>
>> Ok, thanks for looking into it!
>>
>>> at the same time, we double confirmed by queuing more jobs to our auto-=
test
>>> framework, it still reproduced in a persistent way. Just FYI
>>> 2c611ad97a82b512 7482e3841d520a368426ac19672
>>> ---------------- ---------------------------
>>>          fail:runs  %reproduction    fail:runs
>>>              |             |             |
>>>              :59          98%          58:58    dmesg.BUG:unable_to_han=
dle_page_fault_for_address
>>>              :59          98%          58:58    dmesg.Kernel_panic-not_=
syncing:Fatal_exception_in_interrupt
>>>              :59          98%          58:58    dmesg.Oops:#[##]
>>>
>>
>> Is there any way for lkp to test development branches for getting more d=
ebug info out of it?
>> Something like syzkaller has with 'syz test' where it mails the results =
back [0]?
> thanks for the suggestion, Daniel. So far, we don't support this yet, but=
 this is
> very helpful to provide something similar to syzkaller does. We will cons=
ider this
> seriously as TODO.

That's awesome to hear, thanks a lot Philip!
--===============1464717861349446957==--

