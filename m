Content-Type: multipart/mixed; boundary="===============8654286376443136409=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 18 Nov 2021 09:47:51 +0100
Message-ID: <f4ae9b1a-c357-0da7-6c1e-71701c408c61@iogearbox.net>
In-Reply-To: <20211118062316.GB12388@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8654286376443136409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On 11/18/21 7:23 AM, Oliver Sang wrote:
> On Fri, Nov 05, 2021 at 12:21:20PM +0100, Daniel Borkmann wrote:
>> Hey Oliver,
>>
>>>> To reproduce:
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0cd linux
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0cp config-5.15.0-rc4-01167-g7482e3841d52 .con=
fig
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 ol=
ddefconfig prepare modules_prepare bzImage
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://gi=
thub.com/intel/lkp-tests.git
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzI=
mage> job-script # job-script is attached in this email
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any=
 failure that blocks the test,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.l=
kp and /lkp dir to run from a clean state.
>>
>> I ran the test multiple times, but it seems I cannot reproduce. Would be=
 good if you could
>> double check below whether it looks / passes as expected or if I'm doing=
 something wrong:
> =

> sorry about this, we tried above reproducer locally but failed to reprodu=
ce
> either. we are under investigation of this issue.

Ok, thanks for looking into it!

> at the same time, we double confirmed by queuing more jobs to our auto-te=
st
> framework, it still reproduced in a persistent way. Just FYI
> 2c611ad97a82b512 7482e3841d520a368426ac19672
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :59          98%          58:58    dmesg.BUG:unable_to_handle=
_page_fault_for_address
>             :59          98%          58:58    dmesg.Kernel_panic-not_syn=
cing:Fatal_exception_in_interrupt
>             :59          98%          58:58    dmesg.Oops:#[##]
> =


Is there any way for lkp to test development branches for getting more debu=
g info out of it?
Something like syzkaller has with 'syz test' where it mails the results bac=
k [0]?

Thanks a lot,
Daniel

   [0] https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testi=
ng-patches
--===============8654286376443136409==--

