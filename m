Content-Type: multipart/mixed; boundary="===============8767915567948182899=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Mon, 22 Nov 2021 16:04:22 +0100
Message-ID: <caa07511-5400-6f54-2ca0-f5993e689375@iogearbox.net>
In-Reply-To: <d697a36a-e6a9-f658-d5d7-267f30721b43@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8767915567948182899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/22/21 9:52 AM, Li Zhijian wrote:
> On 18/11/2021 14:23, Oliver Sang wrote:
>> On Fri, Nov 05, 2021 at 12:21:20PM +0100, Daniel Borkmann wrote:
>>> Hey Oliver,
>>>
>>>>> To reproduce:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cd linux
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cp config-5.15.0-rc4-01167-g7482e3841d5=
2 .config
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di=
386 olddefconfig prepare modules_prepare bzImage
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone http=
s://github.com/intel/lkp-tests.git
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -=
k <bzImage> job-script # job-script is attached in this email
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come acro=
ss any failure that blocks the test,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remov=
e ~/.lkp and /lkp dir to run from a clean state.
>>> I ran the test multiple times, but it seems I cannot reproduce. Would b=
e good if you could
>>> double check below whether it looks / passes as expected or if I'm doin=
g something wrong:
> =

> Sorry to late reply, we missed the modules before. Please try following i=
nstruction again.
> =

> # make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules=
_prepare bzImage

Should have been:

make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_pre=
pare bzImage modules

> # make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-inst=
all-dir> modules_install
> # cd <mod-install-dir>
> # find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> # bin/lkp qemu -k <bzImage> -m modules.cgz job-script

This helped and I was able to repro, thanks so much!

Sent the fix here:

   https://lore.kernel.org/netdev/20211122150151.16447-1-daniel(a)iogearbox=
.net/

Thanks everyone!
Daniel
--===============8767915567948182899==--

