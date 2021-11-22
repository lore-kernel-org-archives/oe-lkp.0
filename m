Content-Type: multipart/mixed; boundary="===============1716938611847942776=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Mon, 22 Nov 2021 16:52:04 +0800
Message-ID: <d697a36a-e6a9-f658-d5d7-267f30721b43@intel.com>
In-Reply-To: <20211118062316.GB12388@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1716938611847942776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 18/11/2021 14:23, Oliver Sang wrote:
> Hi Daniel,
>
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
>> I ran the test multiple times, but it seems I cannot reproduce. Would be=
 good if you could
>> double check below whether it looks / passes as expected or if I'm doing=
 something wrong:

Sorry to late reply, we missed the modules before. Please try following ins=
truction again.

# make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_p=
repare bzImage
# make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-instal=
l-dir> modules_install
# cd <mod-install-dir>
# find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
# bin/lkp qemu -k <bzImage> -m modules.cgz job-script

Thanks
Zhijian




> sorry about this, we tried above reproducer locally but failed to reprodu=
ce
> either. we are under investigation of this issue.
>
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
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============1716938611847942776==--

